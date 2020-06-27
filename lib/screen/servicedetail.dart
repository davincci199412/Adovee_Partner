import 'package:adovee_partner/screen/service.dart';
import 'package:adovee_partner/screen/servicecategory.dart';
import 'package:flutter/material.dart';
import 'package:adovee_partner/global.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';

import 'dart:io';

import 'package:flutter/services.dart';

class ServiceDetailPage extends StatefulWidget {
  final int id;

  const ServiceDetailPage({Key key, this.id}) : super(key: key);
  
  @override
  _ServiceDetailPageState createState() => _ServiceDetailPageState();
}
 
class _ServiceDetailPageState extends State<ServiceDetailPage> {
 
  final GlobalKey<FormState> _serviceDetailPageKey = GlobalKey<FormState>();
  String _serviceTitle;
  double _price;

  String message;

  Future<dynamic> updateService() async {
    final http.Response response = await http.post(
      baseUrl + 'service/updateservice',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: 'Bearer '+ currentUser.token,

      },
      body: jsonEncode(<String, dynamic>{
        'ServiceId': services[widget.id]['serviceId'],
        'ServiceTitle': _serviceTitle,
        'Price': _price
      }),
    );
    
    if (response.statusCode == 200) {
      message = 'Service update success';
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ServicePage()),
      );
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

  Future<dynamic> deleteService() async {
    final http.Response response = await http.delete(
      baseUrl + 'service/deleteservice/' + services[widget.id]['serviceId'].toString(),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: 'Bearer '+ currentUser.token,

      },
    );
    if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ServicePage()),
      );
      message = 'Delete Success';
    }
    else {
      message = 'fail';
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
              "Service Detail",
              style: TextStyle(color: Color(0xff0078d4)),
            ),
          )
        ),
        body: SafeArea(
          child: Form(
            key: _serviceDetailPageKey,
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
                            labelText: 'title',
                          ),

                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter title';
                            }
                            return null;
                          },
                          initialValue: services[widget.id]['serviceTitle'],
                          onSaved: (value) => _serviceTitle = value,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Price',
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter Price';
                            }
                            return null;
                          },
                          initialValue: services[widget.id]['price'].toString(),

                          onSaved: (value) => _price = double.parse(value),
                        ),
                      ),
                      
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 70,
                          padding: EdgeInsets.all(10),
                          child: RaisedButton(
                            textColor: Colors.white,
                            color: Colors.blue,
                            child: Text('Update'),
                            onPressed: () {
                              if (_serviceDetailPageKey.currentState.validate()) {
                                _serviceDetailPageKey.currentState.save();
                                updateService();
                              }
                            },
                          )),
                      
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 70,
                          padding: EdgeInsets.all(10),
                          child: RaisedButton(
                            textColor: Colors.white,
                            color: Colors.blue,
                            child: Text('Delete'),
                            onPressed: () {
                              deleteService();
                            },
                          )),
                      
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 70,
                          padding: EdgeInsets.all(10),
                          child: RaisedButton(
                            textColor: Colors.white,
                            color: Colors.blue,
                            child: Text('Service Category'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ServiceCategoryPage()),
                              );
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