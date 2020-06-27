import 'package:adovee_partner/screen/resetpassword.dart';
import 'package:flutter/material.dart';
import 'package:adovee_partner/global.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}
 
class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _forgotPasswordKey = GlobalKey<FormState>();
  
  String message;

  String _email;

  Future<dynamic> forgotPassword() async {
    final http.Response response = await http.post(
      baseUrl + 'account/forgotpassword',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'Email': _email,
      }),
    );
    
    if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ResetPasswordPage()),
      );
      message = 'Email send successfully.';
    }
    else {
      message = 'Email send failed.';
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
              "Forgot Password",
              style: TextStyle(color: Color(0xff0078d4)),
            ),
          )
        ),

        body: Padding(
          padding: EdgeInsets.all(10),
          child: Form(
            key: _forgotPasswordKey,
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
                                return 'Please enter email';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                            
                              border: OutlineInputBorder(),
                              labelText: 'Email',
                            ),
                            onSaved: (value) => _email = value,
                          ),
                        ),
                        
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 70,
                          padding: EdgeInsets.all(10),
                          child: RaisedButton(
                            textColor: Colors.white,
                            color: Color(0xff0078d4),
                            child: Text('Send'),
                            onPressed: () {
                              if (_forgotPasswordKey.currentState.validate()) {
                                  _forgotPasswordKey.currentState.save();

                                  forgotPassword();
                                  
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