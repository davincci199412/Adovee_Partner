import 'package:adovee_partner/global.dart';
import 'package:adovee_partner/screen/employdetail.dart';
import 'package:adovee_partner/screen/companyapi.dart';
import 'package:adovee_partner/screen/editprofile.dart';
import 'package:adovee_partner/screen/home.dart';
import 'package:adovee_partner/screen/offline.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class CompanyPage extends StatefulWidget {
  @override
  _CompanyPageState createState() => _CompanyPageState();
}
 
class _CompanyPageState extends State<CompanyPage> {
  TextEditingController _searchController = TextEditingController();
  
  int smsBalance;
  Future<dynamic> getSmsBalanceByCompanyId() async {
    final response = await http.get(
      baseUrl + 'company/getsmsbalancebycompanyid',
      headers: {HttpHeaders.authorizationHeader: 'Bearer '+ currentUser.token},
    );
    if (response.statusCode == 200)
    {
      var body = json.decode(response.body);
      smsBalance = body['balance'];
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

  
  Future<dynamic> getCompanyEmployees() async {
    final response = await http.get(
      baseUrl + 'company/getcompanyemployees',
      headers: {HttpHeaders.authorizationHeader: 'Bearer '+ currentUser.token},
    );
    if (response.statusCode == 200)
    {
      var body = json.decode(response.body);
      setState(() {
        employees = body['employees'];
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
        SpeedDialChild(
          child: Icon(Icons.verified_user),
          backgroundColor: ThemeColors.lightBlue,
          onTap: () { 
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => EditProfilePage()),
              );
          },
          label: 'Update Company',
        ),
        SpeedDialChild(
          child: Icon(Icons.add),
          backgroundColor: ThemeColors.lightBlue,
          onTap: () {
              setState(() {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CompanyApiPage()),
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
  Widget employeeList()
  {
    List<Widget> list = new List<Widget>();
    list.add(searchBox());
    if(employees != null)
    {
      for(var i = 0; i < employees.length; i++){
        list.add(employeeButton(Icon(Icons.search), employees[i]['firstName'] + ' ' + employees[i]['lastName'], i));
      }
    }
    
    return new ListView(children: list);
  }

  Widget employeeButton(Icon icon, String strTitle, int buttonIndex)
  {
    return Container(      
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      height: MediaQuery.of(context).size.height / 8,
      child: new RaisedButton(
        color: Colors.white,
        onPressed: () {
          switch (buttonIndex) {
            case 0:    
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => EmployeeDetailPage(id: buttonIndex)),
              );   
              break;
            default:
          }
        },
        padding: EdgeInsets.all(8.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Center(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: MediaQuery.of(context).size.height / 24,
                    ),
                    
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Text(strTitle,
                        style: Theme.of(context).textTheme.headline6.apply(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              
              ],
            ), 
            
          ), 
              
        )
      ),
    );
  } 


  @override
  Widget build(BuildContext context) {
    getCompanyEmployees();
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
              "Company",
              style: TextStyle(color: Color(0xff0078d4)),
            ),
          )
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: employeeList(),
        ),
        floatingActionButton: _getFAB(),
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