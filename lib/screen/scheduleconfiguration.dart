import 'package:adovee_partner/global.dart';
import 'package:adovee_partner/screen/createcustomer.dart';
import 'package:adovee_partner/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';

class ScheduleConfigurationPage extends StatefulWidget {
  @override
  _ScheduleConfigurationPageState createState() => _ScheduleConfigurationPageState();
}
 
class _ScheduleConfigurationPageState extends State<ScheduleConfigurationPage> {

  TextEditingController _searchController = TextEditingController();
  String message;

  Future<dynamic> getScheduleConfiguration() async {
    final http.Response response = await http.get(
      baseUrl + 'schedule/getscheduleconfiguration',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: 'Bearer '+ currentUser.token,
      },
    );
    
    if (response.statusCode == 200) {
      message = 'getscheduleconfiguration success';
    }
    else {
      message = 'Fail';
    }

    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: ThemeColors.lightBlue,
        textColor: Colors.white,
        fontSize: 16.0
      );
    return response;
      
  }

  Future<dynamic> setScheduleConfiguration() async {
    final http.Response response = await http.post(
      baseUrl + 'schedule/setscheduleconfiguration',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: 'Bearer '+ currentUser.token,
      },
      body: jsonEncode(<String, dynamic>{
        'ScheduleId': 5,
        'Days': '15',
        'MinTime': '0',
        'MaxTime': '5'
      }),
    );
    if (response.statusCode == 200) {
      
      message = 'setscheduleconfiguration success';
    }
    else {
      message = 'setscheduleconfiguration failed.';
    }

    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: ThemeColors.lightBlue,
        textColor: Colors.white,
        fontSize: 16.0
      );
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
          hintText: "Search by Reference or Product",
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
  Widget productList(BuildContext context)
  {
    List<Widget> list = new List<Widget>();
    
    return new ListView(children: list);
  }

  @override
  Widget build(BuildContext context) {
    getScheduleConfiguration();
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
              "Schedule Configuration",
              style: TextStyle(color: Color(0xff0078d4)),
            ),
          )
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: productList(context),
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
              builder: (context) => Home(current: 0)),
        );

        return false;
      },
      
    );
  }
}