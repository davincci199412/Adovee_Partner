import 'package:adovee_partner/screen/customer.dart';
import 'package:adovee_partner/screen/company.dart';
import 'package:adovee_partner/screen/employee.dart';
import 'package:adovee_partner/screen/contactpreference.dart';
import 'package:adovee_partner/screen/faq.dart';
import 'package:adovee_partner/screen/office.dart';
import 'package:adovee_partner/screen/product.dart';
import 'package:adovee_partner/screen/service.dart';
import 'package:adovee_partner/screen/smtpserver.dart';
import 'package:adovee_partner/screen/statistics.dart';

import 'package:flutter/material.dart';


class Profile extends StatefulWidget {

  @override
  _ProfileState createState() => _ProfileState();
}
 
class _ProfileState extends State<Profile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[

          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(50),
            child: new Image(image: AssetImage('assets/images/logo.png')),
          ),
          profileButton(new Icon(Icons.contacts), 'Company', 1),
          profileButton(new Icon(Icons.contacts), 'Contact Preference', 2),
          profileButton(new Icon(Icons.copyright), 'Customer', 3),
          profileButton(new Icon(Icons.contacts), 'Employee', 4),
          profileButton(new Icon(Icons.contacts), 'Faq', 5),
          profileButton(new Icon(Icons.contacts), 'Office', 6),
          profileButton(new Icon(Icons.local_laundry_service), 'Services', 7),
          profileButton(new Icon(Icons.payment), 'Product', 8),
          profileButton(new Icon(Icons.format_list_bulleted), 'Statistics', 9),
          profileButton(new Icon(Icons.settings), 'SMTP Server', 10),
        ],
      ),
    );
  }

  Widget profileButton(Icon icon, String str, int buttonIndex)
  {
    return Container(  
      padding: EdgeInsets.fromLTRB(0, 2, 0, 2),
      height: MediaQuery.of(context).size.height / 12,
      child: new RaisedButton(
        color: Colors.white,
        onPressed: () {
          switch (buttonIndex) {
            case 1: 
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CompanyPage()),
              );   
              break;
            case 2:    
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ContactPreferencePage()),
              );   
              break;
            case 3:    
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CustomerPage()),
              );   
              break;
            case 4:    
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => EmployeePage()),
              );   
              break;
            case 5:    
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FaqPage()),
              );   
              break;
            case 6:    
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => OfficePage()),
              );   
              break;
            case 7:    
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ServicePage()),
              );   
              break;
            case 8:    
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductPage()),
              );   
              break;
            case 9:    
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => StatisticsPage()),
              );   
              break;
            case 10:    
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SmtpServerPage()),
              );   
              break;
            default:
          }
        },
        padding: EdgeInsets.all(8.0),
        child: Align(
            alignment: Alignment.centerLeft,
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                icon,
                new Text('  ' + str),
              ],
            ),
          )
        ),
      );
  } 
}