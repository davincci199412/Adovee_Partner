import 'package:adovee_partner/screen/login.dart';
import 'package:flutter/material.dart';
import 'package:adovee_partner/global.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';

class ResetPasswordPage extends StatefulWidget {
  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}
 
class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final _resetPasswordKey = GlobalKey<FormState>();
  
  String message;

  String _key;
  String _password;
  String _confirm;

  Future<dynamic> resetPassword() async {
    final http.Response response = await http.post(
      baseUrl + 'account/resetpassword',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'Key': _key,
        'NewPassword': _password,
        'Confirm': _confirm,
      }),
    );
    
    if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Login()),
      );
      message = 'Reset password successfully.';
    }
    else {
      message = 'Reset password failed.';
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
              color: Color(0xff0078d4),
            ),
            backgroundColor: Colors.white,
            title: Text(
              "Reset Password",
              style: TextStyle(color: Color(0xff0078d4)),
            ),
          )
        ),

        body: Padding(
          padding: EdgeInsets.all(10),
          child: Form(
            key: _resetPasswordKey,
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
                                return 'Please enter key';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                            
                              border: OutlineInputBorder(),
                              labelText: 'Key',
                            ),
                            onSaved: (value) => _key = value,
                          ),
                        ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: TextFormField(
                          obscureText: true,
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

                      Container(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Confirm password',
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter confirm password';
                            }
                            if(_confirm != _password) {
                              return 'Incorrect password';
                            }
                            return null;
                          },
                          onSaved: (value) => _confirm = value,
                        ),
                      ),
                        
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 70,
                          padding: EdgeInsets.all(10),
                          child: RaisedButton(
                            textColor: Colors.white,
                            color: Color(0xff0078d4),
                            child: Text('Save'),
                            onPressed: () {
                              if (_resetPasswordKey.currentState.validate()) {
                                  _resetPasswordKey.currentState.save();

                                  resetPassword();
                                  
                                }
                            },
                          )),
                    ],
                  ),
                ),
            ),
        
          ),
          ),
      );
  }
}