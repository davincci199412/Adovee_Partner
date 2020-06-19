import 'package:adovee/screen/home.dart';
import 'package:flutter/material.dart';


class OfflinePage extends StatefulWidget {
  @override
  _OfflinePageState createState() => _OfflinePageState();
}
 
class _OfflinePageState extends State<OfflinePage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: PreferredSize(
        //   preferredSize: Size.fromHeight(50.0), // here the desired height
        //   child: AppBar(
        //     iconTheme: IconThemeData(
        //       color: Color(0xff0078d4), //change your color here
        //     ),
        //     backgroundColor: Colors.white,
        //     title: Text(
        //       "Sign in",
        //       style: TextStyle(color: Color(0xff0078d4)),
        //     ),
        //   )
        // ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: Center(
              child: ListView(
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(50),
                    child: new Image(image: AssetImage('assets/images/logo.png')),
                  ),
                  
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(20),
                    child: new Text(
                      'You are offline',
                      style: TextStyle(fontSize: 25),),
                  ),
                  Container(
                    height: 50,
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: RaisedButton(
                        textColor: Colors.white,
                        color: Color(0xff0078d4),
                        child: Text('Go to Home'),
                        onPressed: () {
                          print(emailController.text);
                          print(passwordController.text);

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Home(current: 1)),
                            );
                        },
                      )
                    ),
                  
                ],
              ),
            )
        ),

      );
  
  }
}