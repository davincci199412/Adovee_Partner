import 'package:adovee_partner/screen/offline.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:adovee_partner/global.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';

class CreateClientPage extends StatefulWidget {
  @override
  _CreateClientPageState createState() => _CreateClientPageState();
}
 
class _CreateClientPageState extends State<CreateClientPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
 
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController controller = TextEditingController();
  String initialCountry = 'NG';
  PhoneNumber number = PhoneNumber(isoCode: 'NG');
  var employees;
  Future<dynamic> getSmsBalanceByCompanyId() async {
    final response = await http.get(
      baseUrl + 'company/getsmsbalancebycompanyid',
      headers: {HttpHeaders.authorizationHeader: 'Bearer '+ currentUser.token},
    );
    if (response.statusCode == 200)
    {
      employees = json.decode(response.body);
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


  @override
  Widget build(BuildContext context) {
    getSmsBalanceByCompanyId();
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
            iconTheme: IconThemeData(
              color: Color(0xff0078d4),
            ),
            backgroundColor: Colors.white,
            title: Text(
              "Create Client",
              style: TextStyle(color: Color(0xff0078d4)),
            ),
          )
        ),

        body: Padding(
          padding: EdgeInsets.all(10),
          child: Center(

            child: ListView(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/12, 0, MediaQuery.of(context).size.width/12, MediaQuery.of(context).size.width/12),
                  child: new Image(image: AssetImage('assets/images/logo.png')),
                  ),

                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'First Name',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Last Name',
                    ),
                  ),
                ),

                Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.all(10),
                    child: InternationalPhoneNumberInput(
                      onInputChanged: (PhoneNumber number) {
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
                  child: TextField(
                    
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email Address',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Gender',
                    ),
                  ),
                ),

                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Birthday',
                    ),
                  ),
                ),

                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Address',
                    ),
                  ),
                ),

                
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Zip/Post Code',
                    ),
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
                      },
                    )),
              ],
            )
        
          ),
          ),

      );
  }
}