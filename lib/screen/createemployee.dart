import 'package:adovee_partner/screen/employee.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:adovee_partner/global.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';

class CreateEmployeePage extends StatefulWidget {
  @override
  _CreateEmployeePageState createState() => _CreateEmployeePageState();
}
 
class _CreateEmployeePageState extends State<CreateEmployeePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
 
  final _createAccountKey = GlobalKey<FormState>();

  final TextEditingController phoneController = TextEditingController();
  
  String phoneNumber;
  String phoneIsoCode;
  bool visible = false;
  String confirmedNumber = '';
  String message;

  final TextEditingController controller = TextEditingController();
  String initialCountry = 'NG';
  PhoneNumber number = PhoneNumber(isoCode: 'NG');

  String _email;
  String _password;
  String _confirm;
  String _firstName;
  String _lastName;
  String _mobile;

  var items = ['Working a lot harder', 'Being a lot smarter', 'Being a self-starter', 'Placed in charge of trading charter'];
  
  Future<dynamic> createAccount() async {
    final http.Response response = await http.post(
      baseUrl + 'employee/createaccount',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: 'Bearer '+ currentUser.token,
      },
      body: jsonEncode(<String, dynamic>{
        'CompanyId': 42,
        'FirstName': _firstName,
        'LastName': _lastName,
        'Mobile': _mobile,
        'Email': _email,
        'Password': _password,
        'Confirm': _confirm,
      }),
    );
    //print(json.decode(response.body));
    print(response.statusCode);
    
    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => EmployeePage()),
      );
      message = 'Go to your email';
    }
    else {
      final body = json.decode(response.body);
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
          preferredSize: Size.fromHeight(50.0), // here the desired height
          child: AppBar(
            iconTheme: IconThemeData(
              color: Color(0xff0078d4), //change your color here
            ),
            backgroundColor: Colors.white,
            title: Text(
              "Create Account",
              style: TextStyle(color: Color(0xff0078d4)),
            ),
          )
        ),

        body: Padding(
          padding: EdgeInsets.all(10),
          child: Form(
            key: _createAccountKey,
            child: ListView(
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
                      print(number.phoneNumber);
                      _mobile = number.phoneNumber;
                    },
                    onInputValidated: (bool value) {
                      print(value);
                    },
                    ignoreBlank: false,
                    autoValidate: false,
                    selectorTextStyle: TextStyle(color: Colors.black),
                    initialValue: number,
                    textFieldController: controller,
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
                      child: Text('Create'),
                      onPressed: () {
                        if (_createAccountKey.currentState.validate()) {
                            // If the form is valid, display a Snackbar.
                            _createAccountKey.currentState.save();

                            createAccount(); 
                          }
                      },
                    )),
              ],
            )
        
          ),
          ),
      );
  }
}