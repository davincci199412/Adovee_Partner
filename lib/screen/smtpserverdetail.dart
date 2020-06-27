import 'package:adovee_partner/screen/servicedetail.dart';
import 'package:flutter/material.dart';
import 'package:adovee_partner/global.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';

import 'dart:io';

import 'package:flutter/services.dart';

class SmtpServerUpdatePage extends StatefulWidget {
  final int id;

  const SmtpServerUpdatePage({Key key, this.id}) : super(key: key);
  
  @override
  _SmtpServerUpdatePageState createState() => _SmtpServerUpdatePageState();
}
 
class _SmtpServerUpdatePageState extends State<SmtpServerUpdatePage> {
 
  final GlobalKey<FormState> _smtpServerUpdateKey = GlobalKey<FormState>();
  String _from;
  String _username;
  String _password;
  String _host;
  int _port;

  String message;

  Future<dynamic> setSmtpServer() async {
    final http.Response response = await http.post(
      baseUrl + 'smtpserver/setsmtpserver',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: 'Bearer '+ currentUser.token,
      },
      body: jsonEncode(<String, dynamic>{
        'SmtpServerId': 4,
        'From': _from,
        'Username': _username,
        'Password': _password,
        'Host': _host,
        'SmtpPort': _port
      }),
    );
    
    if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ServiceDetailPage(id: widget.id),
        )
      );
      message = 'Service update success';
    }
    else {
      message = 'Service update failed';
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
        
        backgroundColor: Colors.white,

        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
            iconTheme: IconThemeData(
              color: Color(0xFF222E36),
            ),
            backgroundColor: Colors.white,
            title: Text(
              "Set SMTP Server",
              style: TextStyle(color: Color(0xff0078d4)),
            ),
          )
        ),
        body: SafeArea(
          child: Form(
            key: _smtpServerUpdateKey,
            child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.fromLTRB(30, 0, 30, 10),
                        child: new Image(image: AssetImage('assets/images/logo.png')),
                        ),
                            
                      Container(
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'FROM',
                          ),

                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter from';
                            }
                            return null;
                          },
                          onSaved: (value) => _from = value,
                        ),
                      ),

                      Container(
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter username';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                          
                            border: OutlineInputBorder(),
                            labelText: 'Username',
                          ),
                          onSaved: (value) => _username = value,
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
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter host';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                          
                            border: OutlineInputBorder(),
                            labelText: 'Host',
                          ),
                          onSaved: (value) => _host = value,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Port',
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter Port';
                            }
                            return null;
                          },
                          onSaved: (value) => _port = int.parse(value),
                        ),
                      ),
                      
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 70,
                          padding: EdgeInsets.all(10),
                          child: RaisedButton(
                            textColor: Colors.white,
                            color: Colors.blue,
                            child: Text('Save'),
                            onPressed: () {
                              if (_smtpServerUpdateKey.currentState.validate()) {
                                _smtpServerUpdateKey.currentState.save();
                                setSmtpServer();
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