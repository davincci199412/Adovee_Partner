import 'package:adovee_partner/global.dart';
import 'package:adovee_partner/screen/createemployee.dart';
import 'package:adovee_partner/screen/home.dart';
import 'package:adovee_partner/screen/offline.dart';
import 'package:adovee_partner/screen/workinghour.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';

class EmployeePage extends StatefulWidget {
  @override
  _EmployeePageState createState() => _EmployeePageState();
}
 
class _EmployeePageState extends State<EmployeePage> {

  TextEditingController _searchController = TextEditingController();
  
  Future<dynamic> getEmployeeInCompany() async {
    final response = await http.get(
      baseUrl + 'employee/getemployeeincompany',
      headers: {HttpHeaders.authorizationHeader: 'Bearer '+ currentUser.token},
    );
    if (response.statusCode == 200)
    {
      var body = json.decode(response.body);
      print(body);
      setState(() {
        companyEmployees = body['employees'];
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

  Widget _getFAB() {
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: IconThemeData(size: 22),
      backgroundColor: ThemeColors.lightBlue,
      visible: true,
      curve: Curves.bounceIn,
      tooltip: 'Change Company',
      children: [
            // FAB 1
        SpeedDialChild(
          child: Icon(Icons.verified_user),
          backgroundColor: ThemeColors.lightBlue,
          onTap: () { 
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => WorkingHourPage()),
              );
          },
          label: 'Update Company',
        ),
        // FAB 2
        SpeedDialChild(
          child: Icon(Icons.add),
          backgroundColor: ThemeColors.lightBlue,
          onTap: () {
              setState(() {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CreateEmployeePage()),
                );
              });
          },
        )
      ],
    );
  }


  Widget searchBox()
  {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          labelText: "Search",
          hintText: "Search by Reference or Employee",
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
      ),
    );   
  }
  Widget employeeList(BuildContext context)
  {
    List<Widget> list = new List<Widget>();
    list.add(searchBox());
    if(companyEmployees != null)
    {
      for(var i = 0; i < companyEmployees.length; i++){
        list.add(titleContentButton(context, companyEmployees[i]['firstName'] + ' ' + companyEmployees[i]['lastName'], companyEmployees[i]['email'], 'employee', i));
      }
    }
    
    return new ListView(children: list);
  }

  @override
  Widget build(BuildContext context) {
    getEmployeeInCompany();
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
              "Employees",
              style: TextStyle(color: Color(0xff0078d4)),
            ),
          )
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: employeeList(context),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CreateEmployeePage()),
            );
          },
          tooltip: 'Create employee',
          ),
        // floatingActionButton: _getFAB(),
        
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