import 'package:adovee_partner/screen/offline.dart';
import 'package:adovee_partner/screen/service.dart';
import 'package:flutter/material.dart';
import 'package:adovee_partner/global.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';


import 'package:flutter/services.dart';


class CreateServicePage extends StatefulWidget {
  @override
  _CreateServicePageState createState() => _CreateServicePageState();
}
 
class _CreateServicePageState extends State<CreateServicePage> {
  
  final _createServiceKey = GlobalKey<FormState>();
  String message;
  
  String _serviceTitle;
  String _description = '';
  int _price = 0;
  String _duration = '';
  int _priceTypeId = 2;
  int _availabilityId = 1;
  int _catagoryId = 1;

  Future<dynamic> addService() async {
    final http.Response response = await http.post(
      baseUrl + 'service/addservice',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: 'Bearer '+ currentUser.token,
      },
      body: jsonEncode(<String, dynamic>{
        'ServiceTitle': _serviceTitle,
        'Description': _description,
        'Price': _price,
        'Duration': _duration,
        'PriceTypeId': _priceTypeId,
        'AvailabilityId': _availabilityId,
        'CategoryId': _catagoryId
      }),
    );
    print('===================create service===================');
    print(response.statusCode);
    
    if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ServicePage()),
      );
      message = 'Go to your email';
    }
    else {
      // final body = json.decode(response.body);
      // message = body['message'];
      message = 'failed';

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
  
  Future<dynamic> getAllServiceCategorys() async {
    final response = await http.get(
      baseUrl + 'service/getallservicecategorys',
      headers: {HttpHeaders.authorizationHeader: 'Bearer '+ currentUser.token},
    );
    if (response.statusCode == 200)
    {
      var body = json.decode(response.body);
      // print('------------------begin---------------------');
      // print(body);
      // print('------------------end---------------------');
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
              "Create Service",
              style: TextStyle(color: Color(0xff0078d4)),
            ),
          )
        ),

        body: Padding(
          padding: EdgeInsets.all(10),
          child: Form(
            key: _createServiceKey,
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
                      labelText: 'Service Title',
                    ),

                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter service title';
                      }
                      if (value.length < 5) {
                        return 'Service have to be longer than 5 characters';
                      }
                      return null;
                    },
                    onSaved: (value) => _serviceTitle = value,
                  ),
                ),

                Container(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Description',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter Description';
                      }
                      return null;
                    },
                  onSaved: (value) => _description = value, 
                  ),
                ),

                Container(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Price',
                    ),
                    inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter price';
                      }
                      return null;
                    },
                  onSaved: (value) => _price = int.parse(value),
                  ),
                ),

                Container(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Duration',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter duration';
                      }
                      return null;
                    },
                  onSaved: (value) => _duration = value, 
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
                        if (_createServiceKey.currentState.validate()) {
                            // If the form is valid, display a Snackbar.
                            _createServiceKey.currentState.save();

                            addService(); 
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