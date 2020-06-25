import 'package:adovee_partner/screen/profile.dart';
import 'package:adovee_partner/screen/offline.dart';

import 'package:flutter/material.dart';
import 'package:adovee_partner/global.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';

import 'dart:io';

class ContactPreferencePage extends StatefulWidget {
  @override
  _ContactPreferencePageState createState() => _ContactPreferencePageState();
}
 
class _ContactPreferencePageState extends State<ContactPreferencePage> {
 
  String message;
  
  Future<dynamic> getContactPreference() async {
    final response = await http.get(
      baseUrl + 'contactpreference/getcontactpreference',
      headers: {HttpHeaders.authorizationHeader: 'Bearer '+ currentUser.token},
    );
    // print(response.statusCode);
    final body = json.decode(response.body);
    if (response.statusCode == 200)
    {
      // print(body);
      // print(json.decode(response.body));
      message = 'Go to your email';

    }
    else 
    {
      message = 'Failed';
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => OfflinePage()),
      );
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

  Future<dynamic> setContactPreference() async {
    final http.Response response = await http.post(
      baseUrl + 'contactpreference/setcontactpreference',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: 'Bearer '+ currentUser.token,
      },
      body: jsonEncode(<String, dynamic>{
        'ContactPreferenseId': 0,
        'SMS': true,
        'Email': true,
      }),
    );
    //final body = json.decode(response.body);
    // print(response.statusCode);
    // print(json.decode(response.headers));
    if (response.statusCode == 200) {
      
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Profile()),
      );
      message = 'Success';
    }
    else {
      message = 'Failed .' + response.statusCode.toString();
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
          preferredSize: Size.fromHeight(50.0), // here the desired height
          child: AppBar(
            iconTheme: IconThemeData(
              color: Color(0xFF222E36), //change your color here
            ),
            backgroundColor: Colors.white,
            title: Text(
              "Contact preference",
              style: TextStyle(color: Color(0xff0078d4)),
            ),
          )
        ),
        body: SafeArea(
          child: Center(
            child: ListView(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    CircleAvatar(
                      radius: MediaQuery.of(context).size.height / 8,
                      backgroundImage: AssetImage('assets/images/profile_logo.jpg'),
                    ),
                    ],
                  ),
                
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 70,
                    padding: EdgeInsets.all(10),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text('GetContactPreference'),
                      onPressed: () {
                        //showDialog();
                        getContactPreference();
                      },
                    )),

                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 70,
                    padding: EdgeInsets.all(10),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text('SetContactPreference'),
                      onPressed: () {
                        //showDialog();
                        setContactPreference();
                      },
                    )),
              ],
            ),
          ),
        ),
    );
  }
}