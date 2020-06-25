import 'package:adovee_partner/global.dart';
import 'package:adovee_partner/screen/createoffice.dart';
import 'package:adovee_partner/screen/home.dart';
import 'package:adovee_partner/screen/offline.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';

class OfficePage extends StatefulWidget {
  @override
  _OfficePageState createState() => _OfficePageState();
}
 
class _OfficePageState extends State<OfficePage> {
  TextEditingController _searchController = TextEditingController();
  
  Future<dynamic> getOffices() async {
    final response = await http.get(
      baseUrl + 'office/getoffices',
      headers: {HttpHeaders.authorizationHeader: 'Bearer '+ currentUser.token},
    );
    if (response.statusCode == 200)
    {
      var body = json.decode(response.body);
      setState(() {
        if (body != []) {
          offices = body['offices'];
        }
      });
      // print(offices);
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
          hintText: "Search Office",
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
  Widget officeList(BuildContext context)
  {
    List<Widget> list = new List<Widget>();
    list.add(searchBox());
    if (offices != null) {
      for(var i = 0; i < offices.length; i++){
        list.add(titleContentButton(context, offices[i]['name'], offices[i]['country'], 'office',i));
      }
    }
    
    return new ListView(children: list);
  }

  @override
  Widget build(BuildContext context) {
    getOffices();
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
              "Office",
              style: TextStyle(color: Color(0xff0078d4)),
            ),
          )
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: officeList(context),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CreateOfficePage()),
            );

          },
          tooltip: 'Create office',
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