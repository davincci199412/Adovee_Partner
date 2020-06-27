import 'package:adovee_partner/global.dart';
import 'package:adovee_partner/screen/home.dart';
import 'package:adovee_partner/screen/offline.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';

class StatisticsServiceBookPage extends StatefulWidget {
  @override
  _StatisticsServiceBookPageState createState() => _StatisticsServiceBookPageState();
}
 
class _StatisticsServiceBookPageState extends State<StatisticsServiceBookPage> {
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
      setState(() {
        statistics = body['stats'];
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

  Widget searchBox()
  {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          labelText: "Search",
          hintText: "Search",
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
        },
      ),
    );   
  }
  Widget serverList(BuildContext context)
  {
    List<Widget> list = new List<Widget>();
    list.add(searchBox());
    if (statistics != null) {
      for(var i = 0; i < statistics.length; i++){
        list.add(bookingStatisticsDescription(context, statistics[i]['serviceName'], 'TotalBooking: ' + statistics[i]['totalBookings'].toString(), 'CancelBooking: ' + statistics[i]['totalCancelledBookings'].toString()));
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
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
            iconTheme: IconThemeData(
              color: Color(0xff0078d4),
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
            child: serverList(context),
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