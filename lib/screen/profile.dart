import 'package:adovee_partner/screen/chart.dart';
import 'package:adovee_partner/screen/dashboard.dart';
import 'package:adovee_partner/screen/editprofile.dart';
import 'package:adovee_partner/screen/offline.dart';
import 'package:flutter/material.dart';
import 'package:adovee_partner/screen/payments.dart';
import 'package:adovee_partner/screen/overview.dart';


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
          profileAvatar(),
          profileButton(new Icon(Icons.home), 'Home', 0),
          //profileButton(new Icon(Icons.business_center), 'Staff', 1),
          profileButton(new Icon(Icons.local_laundry_service), 'Services', 2),
          profileButton(new Icon(Icons.payment), 'Inventory', 3),
          profileButton(new Icon(Icons.format_list_bulleted), 'Analytics', 4),
          profileButton(new Icon(Icons.settings), 'Setup', 5),
        ],
      ),
    );
  }
  
  Widget profileAvatar(){
    return Center(
      child: Column(
        children: <Widget>[
          SizedBox(
            width: 40.0,
            height: MediaQuery.of(context).size.height / 32,
          ),
          CircleAvatar(
            radius: MediaQuery.of(context).size.height / 8,
            backgroundImage: AssetImage('assets/images/profile_logo.jpg'),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 32,
            child: Text(
              'Lexy',
              style: TextStyle(
                fontFamily: 'SourceSansPro',
                fontSize: 20,
              ),
            ),
          ),
          
          FlatButton(
            textColor: Colors.blue,
            padding: EdgeInsets.all(0),
            child: Text(
              'Edit Profile',
              //style: TextStyle(fontSize: 20),
            ),
            onPressed: () {
              //signup screen
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => EditProfile()),
              );
            },
          ),
          SizedBox(
            height: 20.0,
            width: 200,
            child: Divider(
              color: Colors.teal[100],
            ),
          ),
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
            case 0:    
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DashboardPage()),
              );   
              break;
            case 1: 
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => OfflinePage()),
              );   
              break;
            // case 2:    
            //   // Navigator.push(
            //   //   context,
            //   //   MaterialPageRoute(
            //   //       builder: (context) => SettingPage()),
            //   // );   
            //   break;
            // case 3:    
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => PaymentPage()),
            //   );   
            //   break;
            case 4:    
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ChartPage(width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.width,)),
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