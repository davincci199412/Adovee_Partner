import 'package:adovee_partner/global.dart';
import 'package:adovee_partner/screen/offline.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';

class CompanyApiPage extends StatefulWidget {
  @override
  _CompanyApiPageState createState() => _CompanyApiPageState();
}
 
class _CompanyApiPageState extends State<CompanyApiPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _companyApiKey = GlobalKey<FormState>();
  var companyapi;
  Future<dynamic> addCompanyApi() async {
    final http.Response response = await http.post(
      baseUrl + 'company/addstripeapi',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: 'Bearer '+ currentUser.token,
      },
      body: jsonEncode(<String, String>{
        'ApiKey': _companyapi,
      }),
    );
    if (response.statusCode == 200) {
      
      message = 'Success' + _companyapi;
    }
    else {
      message = 'Load api failed.';
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: ThemeColors.lightBlue,
        textColor: Colors.white,
        fontSize: 16.0
      );
    }

    return response;
  }

  Future<dynamic> getCompanyApi() async {
    final response = await http.get(
      baseUrl + 'company/getstripeapi',
      headers: {HttpHeaders.authorizationHeader: 'Bearer '+ currentUser.token},
    );
    if (response.statusCode == 200)
    {
      Fluttertoast.showToast(
        msg: 'Success get api',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: ThemeColors.lightBlue,
        textColor: Colors.white,
        fontSize: 16.0
      );
      final body = json.decode(response.body);
      companyapi = body['companyApi'];
    }
    else 
    {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => OfflinePage()),
      );
    }
    return response;
  }

  String _companyapi;
  String message = '';

  @override
  Widget build(BuildContext context) {
    getCompanyApi();
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
            "Company Api",
            style: TextStyle(color: ThemeColors.lightBlue),
          ),
        )
      ),
      body: Padding(
          padding: EdgeInsets.all(10),
          child: Form(
            key: _companyApiKey,
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
                      child: Text(
                        'CompanyApi'
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter api';
                          }
                          return null;
                        },
                        controller: emailController,
                        decoration: InputDecoration(
                        
                          border: OutlineInputBorder(),
                          labelText: 'Company Api.',
                        ),
                        onSaved: (value) => _companyapi = value,
                      ),
                    ),
                    
                    

                    Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: RaisedButton(
                          textColor: Colors.white,
                          color: ThemeColors.lightBlue,
                          child: Text('Add'),
                          
                          onPressed: () {
                            if (_companyApiKey.currentState.validate()) {
                              _companyApiKey.currentState.save();
                              addCompanyApi();
                            }
                          },
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