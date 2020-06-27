import 'package:flutter/material.dart';
import 'package:adovee_partner/screen/login.dart';
import 'package:adovee_partner/screen/register.dart';

class LoginDetailPage extends StatefulWidget {
  @override
  _LoginDetailPageState createState() => _LoginDetailPageState();
}
 
class _LoginDetailPageState extends State<LoginDetailPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
        body: 
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
  
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              
              children: <Widget>[
                
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(50),
                    child: new Image(image: AssetImage('assets/images/logo.png')),
                    ),

                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 12,
                    padding: EdgeInsets.all(10),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Color(0xff0078d4),
                      child: Text(
                        'Log in with email',
                        style: TextStyle(fontSize: 16),
                        ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Login()),
                          );
                      },
                    )),
                
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 12,
                    padding: EdgeInsets.all(10),
                    child: RaisedButton(
                      textColor: Colors.black,
                      color: Colors.white,
                      child: Text(
                        'Continue with Google',
                        style: TextStyle(fontSize: 16),
                        ),
                      onPressed: () {
                      },
                    )),

                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 12,
                    padding: EdgeInsets.all(10),
                    child: RaisedButton(
                      textColor: Colors.black,
                      color: Colors.white,
                      child: Text(
                        'Continue with Facebook',
                        style: TextStyle(fontSize: 16),
                        ),
                      onPressed: () {
                      },
                    )),

                Container(
                  height: 50,
                  padding: EdgeInsets.all(10),
                  child: Center(
                    child: Text(
                      "Don't have a booker account?",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),

                  
                ),
                
                FlatButton(
                  textColor: Colors.blue,
                  child: Text(
                    'Sign up now',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Register()),
                    );
                  },
                )
              ],
            )
        ),
      );
  }
}