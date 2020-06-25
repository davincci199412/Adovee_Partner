import 'package:adovee_partner/screen/login.dart';
import 'package:adovee_partner/screen/register.dart';
import 'package:flutter/material.dart';

class FirstScreenPage extends StatefulWidget {
  @override
  _FirstScreenPageState createState() => _FirstScreenPageState();
}
 
class _FirstScreenPageState extends State<FirstScreenPage> {
 
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
                      height: MediaQuery.of(context).size.height * 0.2,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(50),
                      child: new Image(image: AssetImage('assets/images/logo.png')),
                      ),
                  
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 10,
                      padding: EdgeInsets.all(10),
                      child: RaisedButton(
                        textColor: Colors.white,
                        color: Color(0xff0078d4),
                        child: Text('Login'),
                        onPressed: () {

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Login()),
                            );
                        },
                      )),
                  SizedBox(
                    height : 20
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 10,
                      padding: EdgeInsets.all(10),
                      child: RaisedButton(
                        textColor: Color(0xff0078d4),
                        color: Colors.white,
                        child: Text(
                          'Register a free business account'
                          ),
                        onPressed: () {

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Register()),
                            );
                        },
                      )),
                  
                ],
              ),
            
            ),
          ),
      );
  
  }
}