
import 'package:adovee_partner/screen/office.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:adovee_partner/global.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';

class CreateOfficePage extends StatefulWidget {

  @override
  _CreateOfficePageState createState() => _CreateOfficePageState();
}
 
class _CreateOfficePageState extends State<CreateOfficePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
 
  final _setOfficeKey = GlobalKey<FormState>();

  final TextEditingController phoneController = TextEditingController();
  
  String phoneNumber;
  String phoneIsoCode;
  bool visible = false;
  String confirmedNumber = '';
  String message;

  final TextEditingController controller = TextEditingController();
  String initialCountry = 'NG';
  PhoneNumber number = PhoneNumber(isoCode: 'NG');

  String _firstName;
  String _lastName;
  String _country;
  String _address;
  String _zipCode;
  String _area;
  String _mobile;

  Future<dynamic> setOffice() async {
    final http.Response response = await http.post(
      baseUrl + 'office/setoffice',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: 'Bearer '+ currentUser.token,
      },
      body: jsonEncode(<String, dynamic>{
        'Name': _firstName + ' ' + _lastName,
        'Country': _country,
        'Address': _address,
        'ZipCode': _zipCode,
        'Area': _area,
        'Phone': _mobile
      }),
    );
    
    if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => OfficePage()),
      );
      message = 'Success';
    }
    else {
      message = 'Failed';
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
              "Set Office",
              style: TextStyle(color: Color(0xff0078d4)),
            ),
          )
        ),

        body: Padding(
          padding: EdgeInsets.all(10),
          child: Form(
            key: _setOfficeKey,
            child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
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
                          textFieldController: controller,
                          inputBorder: OutlineInputBorder(),
                        ),
                      ),

                      Container(
                          padding: EdgeInsets.all(10),
                          child: TextFormField(
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter country';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                            
                              border: OutlineInputBorder(),
                              labelText: 'Country',
                            ),
                            onSaved: (value) => _country = value,
                          ),
                        ),

                      Container(
                          padding: EdgeInsets.all(10),
                          child: TextFormField(
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter address';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                            
                              border: OutlineInputBorder(),
                              labelText: 'Address',
                            ),
                            onSaved: (value) => _address = value,
                          ),
                        ),

                      Container(
                          padding: EdgeInsets.all(10),
                          child: TextFormField(
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter zipcode';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                            
                              border: OutlineInputBorder(),
                              labelText: 'ZipCode',
                            ),
                            onSaved: (value) => _zipCode = value,
                          ),
                        ),

                      Container(
                          padding: EdgeInsets.all(10),
                          child: TextFormField(
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter area';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                            
                              border: OutlineInputBorder(),
                              labelText: 'Area',
                            ),
                            onSaved: (value) => _area = value,
                          ),
                        ),
                      
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 70,
                          padding: EdgeInsets.all(10),
                          child: RaisedButton(
                            textColor: Colors.white,
                            color: Color(0xff0078d4),
                            child: Text('Set Office'),
                            onPressed: () {
                              if (_setOfficeKey.currentState.validate()) {
                                  _setOfficeKey.currentState.save();
                                  setOffice();
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