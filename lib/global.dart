import 'package:adovee_partner/screen/officedetail.dart';
import 'package:adovee_partner/screen/servicedetail.dart';
import 'package:adovee_partner/screen/workinghourdetail.dart';
import 'package:flutter/material.dart';
import 'package:adovee_partner/screen/clientdetail.dart';
import 'package:adovee_partner/screen/customerdetail.dart';
import 'package:adovee_partner/screen/employdetail.dart';
import 'package:intl/intl.dart';


var baseUrl = 'https://dev01-api.adovee.com/';

class ThemeColors {
  static Color lightBlue = Color(0xff0078d4);
}

class User {
  final int id;
  final String companyName;
  final String firstName;
  final String lastName;
  final String username;
  final String expires;
  final String token;
  final role;

  User({this.id, this.companyName, this.firstName, this.lastName, this.username, this.expires, this.token, this.role});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      companyName: json['companyName'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      username: json['username'],
      expires: json['expires'],
      token: json['token'],
      role: json['role']
    );
  }
}

class Employee
{
  final int employeeId;
  final int companyId;
  final String firstName;
  final String lastName;

  Employee({this.employeeId, this.companyId, this.firstName, this.lastName});

  factory Employee.fromJson(Map<String, dynamic> json)
  {
    return Employee(
      employeeId: json['employeeId'],
      companyId: json['companyId'],
      firstName: json['firstName'],
      lastName: json['lastName']
    );
  }
}

User currentUser;

var employeeCalenders;

var employees;
var companyEmployees;

var workinghours;
var customers;
var resultCustomers;

var faqs;

var offices;

var products;

var services;

var categorizedServices;

var smtpServers;

var statistics;

var format = DateFormat("yyyy-MM-dd");

Widget titleContentDescription(BuildContext context, String strTitle, String strContent)
  {
    return Container(   
      //padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 8,
      decoration: BoxDecoration(
        
        color: Colors.white,
        // border: Border.all(color: Colors.blueAccent),
        border: Border(bottom: BorderSide(color: Color(0xffaaaaaa)))
      ),
      child: Align(
          alignment: Alignment.centerLeft,
          child: Center(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            strTitle,
                            style: TextStyle(color: ThemeColors.lightBlue),
                            ),
                          Text(strContent,
                            style: Theme.of(context).textTheme.headline6.apply(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ), 
            
          ), 
              
        )
    );
    
  }

Widget titleContentButton(BuildContext context, String strTitle, String strEmail, String buttonType, int buttonIndex)
  {
    return Container(      
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      height: MediaQuery.of(context).size.height / 8,
      child: new RaisedButton(
        color: Colors.white,
        onPressed: () {
          switch (buttonType) {
            case 'employee':
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => EmployeeDetailPage(id: buttonIndex)),
              );
              break;
            case 'customer':
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CustomerDetailPage(id: buttonIndex)),
              );
              break;
            case 'client':
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ClientDetailPage(id: buttonIndex)),
              );
              break;
            case 'office':
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => OfficeDetailPage(id: buttonIndex)),
              );
              break;
            case 'service':
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ServiceDetailPage(id: buttonIndex)),
              );
              break;
            case 'workinghour':
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => WorkingHourDetailPage(id: buttonIndex)),
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
                      //backgroundImage: AssetImage('assets/images/profile_logo.jpg'),
                    ),
                    
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(strTitle,
                            style: Theme.of(context).textTheme.headline6.apply(
                              color: Colors.black,
                            ),
                          ),
                          Text(strEmail),
                        ],
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

Widget contentButton(BuildContext context, String strContent, String buttonType, int buttonIndex)
  {
    return Container(      
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      height: MediaQuery.of(context).size.height / 8,
      child: new RaisedButton(
        color: Colors.white,
        onPressed: () {
          
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
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Text(strContent,
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
  