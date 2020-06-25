import 'package:adovee_partner/global.dart';
import 'package:adovee_partner/screen/createcustomer.dart';
import 'package:adovee_partner/screen/home.dart';
import 'package:adovee_partner/screen/offline.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';

class StatisticsPage extends StatefulWidget {
  @override
  _StatisticsPageState createState() => _StatisticsPageState();
}
 
class _StatisticsPageState extends State<StatisticsPage> {
  TextEditingController _searchController = TextEditingController();
  String message;

  Future<dynamic> getServiceBooking() async {
    final response = await http.get(
      baseUrl + 'statistics/getservicebooking',
      headers: {HttpHeaders.authorizationHeader: 'Bearer '+ currentUser.token},
    );
    if (response.statusCode == 200)
    {
      var body = json.decode(response.body);
      print('--------------------statistics---------------------------');
      setState(() {
        statistics = body['stats'];
        print(statistics);
      });
    }
    else 
    {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => OfflinePage()),
      );
    }
    return response;
  }

  Future<dynamic> moneyEarning() async {
    final http.Response response = await http.post(
      baseUrl + 'statistics/moneyearnings',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: 'Bearer '+ currentUser.token,

      },
      body: jsonEncode(<String, dynamic>{
        'StartDate': '2020-06-23T17:09:31.133Z',
        'EndDate': '2020-06-23T17:09:31.133Z'
      }),
    );
    //print(json.decode(response.body));
    print(response.statusCode);
    
    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //       builder: (context) => ServiceDetailPage(id: widget.id),
      //   )
      // );
      message = 'Money earning success';
    }
    else {
      //final body = json.decode(response.body);
      // message = body['message'];
      message = 'Money earning failed';
    }

    // Fluttertoast.showToast(
    //     msg: message,
    //     toastLength: Toast.LENGTH_LONG,
    //     gravity: ToastGravity.BOTTOM,
    //     timeInSecForIosWeb: 1,
    //     backgroundColor: ThemeColors.lightBlue,
    //     textColor: Colors.white,
    //     fontSize: 16.0
    //   );
    return response;
      
  }

  // Future<dynamic> searchCustomers(String str) async {
  //   final response = await http.get(
  //     baseUrl + 'customer/searchcustomers?Query=' + str,
  //     headers: {HttpHeaders.authorizationHeader: 'Bearer '+ currentUser.token},
  //   );
  //   print(response.statusCode);

  //   if (response.statusCode == 200)
  //   {
  //     //print(json.decode(response.body));
  //     var body = json.decode(response.body);
  //     setState(() {
  //       resultCustomers = body['customers'];
  //     });
  //     print(resultCustomers);
  //   }
  //   else 
  //   {
  //     // Navigator.push(
  //     //   context,
  //     //   MaterialPageRoute(
  //     //       builder: (context) => OfflinePage()),
  //     // );

  //   }
  //   return response;
  // }

  Widget searchBox()
  {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          labelText: "Search",
          hintText: "Search by Reference or smtp server",
          prefixIcon: Icon(Icons.search),
          suffixIcon: _searchController.text.isEmpty
              ? null
              : InkWell(
                  onTap: () => _searchController.clear(),
                  child: Icon(Icons.clear),
                ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
        ),
        onChanged: (value) {
          // searchCustomers(value);
        },
      ),
    );   
  }
  Widget smtpServerList(BuildContext context)
  {
    List<Widget> list = new List<Widget>();
    list.add(searchBox());
    if (statistics != null) {
      for(var i = 0; i < statistics.length; i++){
        list.add(titleContentButton(context, statistics[i]['serviceName'], 'ServiceId: ' + statistics[i]['serviceId'].toString(), 'statistics',i));
      }
    }
    
    return new ListView(children: list);
  }

  @override
  Widget build(BuildContext context) {
    getServiceBooking();
    return WillPopScope(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0), // here the desired height
          child: AppBar(
            iconTheme: IconThemeData(
              color: Color(0xff0078d4), //change your color here
            ),
            backgroundColor: Colors.white,
            title: Text(
              "Statistics",
              style: TextStyle(color: Color(0xff0078d4)),
            ),
          )
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: smtpServerList(context),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CreateCustomerPage()),
            );

          },
          tooltip: 'Create customer',
          ),
      ), 
      onWillPop: () async {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Home(current: 4)),
        );

        return false;
      },
      
    );
  }
}