import 'package:adovee_partner/screen/marketing.dart';
import 'package:adovee_partner/screen/overview.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}
 
class _DashboardPageState extends State<DashboardPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0), // here the desired height
          child: AppBar(
            iconTheme: IconThemeData(
              color: Color(0xff0078d4), //change your color here
            ),
            backgroundColor: Colors.white,
            title: Text(
              "Home",
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

          dashboardButton(new Icon(Icons.widgets), 'Overview', 0),
          dashboardButton(new Icon(Icons.compare_arrows), 'Online Book', 1),
          dashboardButton(new Icon(Icons.attach_money), 'Marketing', 2),
          dashboardButton(new Icon(Icons.credit_card), 'Card Processing', 3),
          dashboardButton(new Icon(Icons.chat), 'Client Message', 4),
          SizedBox(
            height: MediaQuery.of(context).size.height / 32,
          ),
          dashboardButton(new Icon(Icons.lightbulb_outline), 'Contact Support', 5),
          dashboardButton(new Icon(Icons.help_outline), 'Help Center', 6),
          dashboardButton(new Icon(Icons.exit_to_app), 'Logout', 4),
        ],
      ),
    );
  }
  
  Widget dashboardButton(Icon icon, String str, int buttonIndex)
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
                    builder: (context) => OverviewPage()),
              );   
              break;
            case 2:    
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MarketingPage()),
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