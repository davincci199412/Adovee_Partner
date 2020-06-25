import 'package:adovee_partner/screen/login.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:adovee_partner/global.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}
 
class _RegisterState extends State<Register> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
 
  final _registerKey = GlobalKey<FormState>();

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
  String _company;
  String _firstName;
  String _lastName;
  int _industryId = 1;
  String _mobile;
  String searchIndustry;

  var items = ['Working a lot harder', 'Being a lot smarter', 'Being a self-starter', 'Placed in charge of trading charter'];
  //var items = [];
  Future<dynamic> filterIndustry(String str) async {
    final response = await http.get(
      baseUrl + 'account/filterindustry?query=' + str,
    );
    
    final industrybody = json.decode(response.body);
    if (response.statusCode == 200) {
      var resultIndustry = industrybody['searchResult'];
      print(resultIndustry);
      // items = resultIndustry.OfType<String>().ToList();
      //items = resultIndustry;
      _industryId = 1;
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    print(response.statusCode);
    return response;
  }

  Future<dynamic> register() async {
    final http.Response response = await http.post(
      baseUrl + 'account/register',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'Email': _email,
        'Password': _password,
        'Confirm': _confirm,
        'Companyname': _company,
        'FirstName': _firstName,
        'LastName': _lastName,
        'Mobile': _mobile,
        'IndustryId': _industryId
      }),
    );
    print(json.decode(response.body));
    print(response.statusCode);
    
    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Login()),
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
              "Sign up",
              style: TextStyle(color: Color(0xff0078d4)),
            ),
          )
        ),

        body: Padding(
          padding: EdgeInsets.all(10),
          child: Form(
            key: _registerKey,
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
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter company';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                       
                        border: OutlineInputBorder(),
                        labelText: 'Company',
                      ),
                      onSaved: (value) => _company = value,
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
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: 
                  new Row(
                    children: <Widget>[
                      new Expanded(
                        child: TextFormField(
                          controller: controller,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Industry',
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter industry';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            print(value);
                            // filterIndustry(value);
                          },
                          // onSaved: (value) => _confirm = value,
                        ),
                      ),
                      new PopupMenuButton<String>(
                        icon: const Icon(Icons.arrow_drop_down),
                        onSelected: (String value) {
                          //print(value);
                          searchIndustry = value;
                          controller.text = value;
                        },
                        itemBuilder: (BuildContext context) {
                          return items.map<PopupMenuItem<String>>((String value) {
                            return new PopupMenuItem(child: new Text(value), value: value);
                          }).toList();
                        },
                      ),
                    ],
                  ),

                ),
               
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 70,
                    padding: EdgeInsets.all(10),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Color(0xff0078d4),
                      child: Text('Sign up'),
                      onPressed: () {
                        if (_registerKey.currentState.validate()) {
                            // If the form is valid, display a Snackbar.
                            _registerKey.currentState.save();

                            register(); 
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