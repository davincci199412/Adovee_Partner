import 'package:adovee_partner/screen/dashboard.dart';
import 'package:adovee_partner/screen/login.dart';
import 'package:adovee_partner/screen/offline.dart';
import 'package:adovee_partner/screen/register.dart';
import 'package:adovee_partner/screen/uptodate.dart';
import 'package:flutter/material.dart';
import 'package:adovee_partner/screen/settings.dart';
import 'package:adovee_partner/screen/payments.dart';

class NotificationPage extends StatefulWidget {

  final int id;

  const NotificationPage({Key key, this.id}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}
 
class _NotificationPageState extends State<NotificationPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  
  final List<Tab> myTabs = <Tab>[
    new Tab(text: 'Activity'),
    new Tab(text: 'News'),
  ];

  List<Widget> containers = [
    Login(),
    Register()
  ];

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
        length: 2,
        child: new Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(120.0), // here the desired height
            child: AppBar(
              iconTheme: IconThemeData(
                color: Color(0xff0078d4), //change your color here
              ),
              backgroundColor: Colors.white,
              title: Text(
                "Notification",
                textAlign: TextAlign.left,
                style: TextStyle(color: Color(0xff0078d4)),
              ),
              bottom: new TabBar(
                tabs: [
                  new Container(
                    height: 50,
                    child: Center(
                      child: Text(
                        "Activity", 
                        style: TextStyle(color: Color(0xff0078d4))
                        ),
                      )
                    ), 
                  new Container(
                    height: 50,
                    child: Center(
                      child: Text(
                        "News", 
                        style: TextStyle(color: Color(0xff0078d4))
                        ),
                      )
                    ), 
                  ],
              ),
            )
          ),
          body: new TabBarView(
            children: <Widget>[
              NoNotificationPage(),
              UptoDatePage()
            ],
          ),
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
            case 2:    
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SettingPage()),
              );   
              break;
            case 3:    
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PaymentPage()),
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

  Widget profileDescription(String strTitle, String strContent)
  {
    return Container(   
      padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
      height: MediaQuery.of(context).size.height / 8,
      decoration: BoxDecoration(
        // border: Border.all(color: Colors.blueAccent),
        color: Color(0xfff2f2f2),
        border: Border(bottom: BorderSide(color: Color(0xff888888)))
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
                      padding: EdgeInsets.all(0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(strTitle),
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
}


class NoNotificationPage extends StatefulWidget {
  @override
  _NoNotificationPageState createState() => _NoNotificationPageState();
}
 
class _NoNotificationPageState extends State<NoNotificationPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(30),
                    child: new Image(image: AssetImage('assets/images/logo.png')),
                  ),
                  
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(20),
                    child: new Text(
                      'No notifications yet',
                      style: Theme.of(context).textTheme.headline6.apply(
                          color: Colors.black,
                        ),
                      ),
                  ),
                  
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'You do not have any notifications yet.',
                      textAlign: TextAlign.center,
                      ),
                  ),
                ],
              ),
            )
        ),

      );
  
  }
}