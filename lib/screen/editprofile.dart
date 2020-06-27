import 'package:adovee_partner/screen/profile.dart';

import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:adovee_partner/global.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';

import 'dart:io';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}
 
class _EditProfilePageState extends State<EditProfilePage> {
 
  final GlobalKey<FormState> _editProfilePageKey = GlobalKey<FormState>();
  String _firstName;
  String _lastName;
  String _email = "sdfgfdg";
  String _mobile;

  String message;

  String initialCountry = 'NG';
  PhoneNumber number = PhoneNumber(isoCode: 'NG');

  void showDialog() {
    showGeneralDialog(
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      context: context,
      pageBuilder: (_, __, ___) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 300,
            child: SizedBox.expand(child: FlutterLogo()),
            margin: EdgeInsets.only(bottom: 50, left: 12, right: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
          child: child,
        );
      },
    );
  }

  Future<dynamic> updateCompanyDetails() async {
    final http.Response response = await http.post(
      baseUrl + 'company/updatecompanydetails',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: 'Bearer '+ currentUser.token,
      },
      body: jsonEncode(<String, String>{
        'FirstName': _firstName,
        'LastName': _lastName,
        'Email': _email,
        'Mobile': _mobile,
      }),
    );
    if (response.statusCode == 200) {
      
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Profile()),
      );
      message = 'Go to your email';
    }
    else {
      message = 'Update failed.';
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
              "Edit profile",
              style: TextStyle(color: Color(0xff0078d4)),
            ),
          )
        ),
        body: SafeArea(
          child: Form(
            key: _editProfilePageKey,
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
                            labelText: 'First Name',
                          ),

                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter first name';
                            }
                            return null;
                          },
                          onSaved: (value) => _firstName = value,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Last Name',
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter last name';
                            }
                            return null;
                          },
                          onSaved: (value) => _lastName = value,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: InternationalPhoneNumberInput(
                          onInputChanged: (PhoneNumber number) {
                            _mobile = number.phoneNumber;
                          },
                          onInputValidated: (bool value) {
                          },
                          ignoreBlank: false,
                          autoValidate: false,
                          selectorTextStyle: TextStyle(color: Colors.black),
                          initialValue: number,
                          inputBorder: OutlineInputBorder(),
                        ),
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
                            decoration: InputDecoration(
                            
                              border: OutlineInputBorder(),
                              labelText: 'Email Address',
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
                            color: Colors.blue,
                            child: Text('Save'),
                            onPressed: () {
                              if (_editProfilePageKey.currentState.validate()) {
                                _editProfilePageKey.currentState.save();

                                updateCompanyDetails();
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