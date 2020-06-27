import 'package:adovee_partner/screen/favourite.dart';
import 'package:adovee_partner/screen/logindetail.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}
 
class _SettingPageState extends State<SettingPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
            iconTheme: IconThemeData(
              color: Color(0xff0078d4),
            ),
            backgroundColor: Colors.white,
            title: Text(
              "Settings",
              style: TextStyle(color: Color(0xff0078d4)),
            ),
          )
        ),
      body: ListView(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(50),
            child: new Image(image: AssetImage('assets/images/logo.png')),
          ),

          settingButton(new Icon(Icons.lightbulb_outline), 'Social logins', 0),
          settingButton(new Icon(Icons.lightbulb_outline), 'For Partners', 1),
          settingButton(new Icon(Icons.lightbulb_outline), 'Booking terms', 2),
          settingButton(new Icon(Icons.lightbulb_outline), 'Privacy policy', 3),
          settingButton(new Icon(Icons.lightbulb_outline), 'Website terms', 4),
        ],
      ),
    );
  }
  
  Widget settingButton(Icon icon, String str, int buttonIndex)
  {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      height: MediaQuery.of(context).size.height / 11,
      child: new RaisedButton(
        color: Colors.white,
        onPressed: () {
          switch (buttonIndex) {
            case 0:    
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LoginDetailPage()),
              );   
              break;
            case 1:    
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FavouritePage()),
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