import 'package:adovee_partner/screen/login.dart';
import 'package:adovee_partner/screen/register.dart';
import 'package:adovee_partner/screen/uptodate.dart';
import 'package:flutter/material.dart';

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
            preferredSize: Size.fromHeight(120.0),
            child: AppBar(
              iconTheme: IconThemeData(
                color: Color(0xff0078d4),
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