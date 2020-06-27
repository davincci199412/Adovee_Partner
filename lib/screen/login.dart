import 'package:adovee_partner/global.dart';
import 'package:adovee_partner/screen/forgetpassword.dart';
import 'package:adovee_partner/screen/register.dart';
import 'package:adovee_partner/screen/home.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}
 
class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _loginKey = GlobalKey<FormState>();

  String _email;
  String _password;
  String message = '';
  
  Future<dynamic> login() async {
    final http.Response response = await http.post(
      baseUrl + 'account/login',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'Username': _email,
        'Password': _password,
      }),
    );
    final body = json.decode(response.body);
    if (response.statusCode == 200) {
      currentUser = User.fromJson(body);
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Home(current: 4,)),
      );
      message = 'Success Login';
      return User.fromJson(body);
    }
    else {
      message = body['message'];
    }

    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: ThemeColors.lightBlue,
        textColor: Colors.white,
        fontSize: 16.0
      );
    return response;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        resizeToAvoidBottomInset: true,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0), 
          child: AppBar(
            iconTheme: IconThemeData(
              color: ThemeColors.lightBlue,
            ),
            backgroundColor: Colors.white,
            title: Text(
              "Sign in",
              style: TextStyle(color: ThemeColors.lightBlue),
            ),
          )
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: Form(
              key: _loginKey,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,

                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.fromLTRB(30, 0, 30, 10),
                        child: new Image(image: AssetImage('assets/images/logo.png')),
                        ),
                      
                      Container(
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter email address';
                            }
                            if(!value.contains('@')) {
                              return 'Not a vaild email address';
                            }
                            return null;
                          },
                          controller: emailController,
                          decoration: InputDecoration(
                          
                            border: OutlineInputBorder(),
                            labelText: 'Email Address',
                          ),
                          onSaved: (value) => _email = value,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: TextFormField(
                          obscureText: true,
                          controller: passwordController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Password',
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter password';
                            }
                            return null;
                          },
                          onSaved: (value) => _password = value,
                        ),
                      ),
                      FlatButton(
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForgotPasswordPage()),
                          );
                        },
                        textColor: ThemeColors.lightBlue,
                        child: SizedBox(
                          width: double.infinity,
                          child: Text(
                          'Forgot Password? ',
                          textAlign: TextAlign.right),
                        ),
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: RaisedButton(
                            textColor: Colors.white,
                            color: ThemeColors.lightBlue,
                            child: Text('Login'),
                            
                            onPressed: () {
                              if (_loginKey.currentState.validate()) {
                                _loginKey.currentState.save();
                                login();
                              }
                            },
                          )),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Text("Don't have account?"),
                            FlatButton(
                              textColor: ThemeColors.lightBlue,
                              child: Text(
                                'Sign Up',
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
                          mainAxisAlignment: MainAxisAlignment.center,
                      )),
                    ],
                  ),
            
                )
              ),
              
            ),
            ),
      );
  
  }
}