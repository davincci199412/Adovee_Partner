import 'package:adovee_partner/global.dart';
import 'package:adovee_partner/screen/createemployee.dart';
import 'package:adovee_partner/screen/home.dart';
import 'package:adovee_partner/screen/offline.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


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
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
            iconTheme: IconThemeData(
              color: Color(0xff0078d4),
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