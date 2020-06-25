import 'package:adovee_partner/screen/customer.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:adovee_partner/global.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';

class CustomerDetailPage extends StatefulWidget {
  
  final int id;

  const CustomerDetailPage({Key key, this.id}) : super(key: key);
  

  @override
  _CustomerDetailPageState createState() => _CustomerDetailPageState();
}
 
class _CustomerDetailPageState extends State<CustomerDetailPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
 
  final _customerDetailKey = GlobalKey<FormState>();

  final TextEditingController phoneController = TextEditingController();
  
  String phoneNumber;
  String phoneIsoCode;
  bool visible = false;
  String confirmedNumber = '';
  String message;

  final TextEditingController controller = TextEditingController();
  String initialCountry = 'NG';
  PhoneNumber number = PhoneNumber(isoCode: 'NG');

  String _service;
  String _book;

  String searchIndustry;

  Future<dynamic> addCustomerBooking() async {
    final http.Response response = await http.post(
      baseUrl + 'customer/addcustomerbooking',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: 'Bearer '+ currentUser.token,

      },
      body: jsonEncode(<String, dynamic>{
        'BookingType': 1,
        'ServiceId': 0,
        'CompanyId': currentUser.id,
        'BookingId': 1,
        'CustomerId': widget.id,
        'IsConditionAccepted': true
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
            builder: (context) => CustomerPage()),
      );
      message = 'Booking Success';
    }
    else {
      //final body = json.decode(response.body);
      // message = body['message'];
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
  
  Future<dynamic> cancelBooking() async {
    final http.Response response = await http.post(
      baseUrl + 'customer/cancelbooking',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: 'Bearer '+ currentUser.token,

      },
      body: jsonEncode(<String, dynamic>{
        'CustomerId': widget.id,
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
            builder: (context) => CustomerPage()),
      );
      message = 'Booking Cancel Success';
    }
    else {
      //final body = json.decode(response.body);
      // message = body['message'];
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
  
  Future<dynamic> getCustomerBooking() async {
    final http.Response response = await http.post(
      baseUrl + 'customer/getcustomerbooking',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: 'Bearer '+ currentUser.token,

      },
      body: jsonEncode(<String, dynamic>{
        'BookingId': 0,
        'BookingTypeId': 0
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
            builder: (context) => CustomerPage()),
      );
      message = 'Get Booking Success';
    }
    else {
      //final body = json.decode(response.body);
      // message = body['message'];
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
  
  Future<dynamic> deleteCustomer() async {
    final http.Response response = await http.delete(
      baseUrl + 'customer/delete/' + customers[widget.id]['customerId'].toString(),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: 'Bearer '+ currentUser.token,

      },
    );
    //print(json.decode(response.body));
    print(response.statusCode);
    
    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CustomerPage()),
      );
      message = 'Delete Success';
    }
    else {
      //final body = json.decode(response.body);
      // message = body['message'];
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
              'Customer: ' + resultCustomers[widget.id]['fullName'],
              style: TextStyle(color: Color(0xff0078d4)),
            ),
          )
        ),

        body: Padding(
          padding: EdgeInsets.all(10),
          child: Form(
            key: _customerDetailKey,
            child: Center(
              child: ListView(
                children: <Widget>[
                  Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.fromLTRB(30, 0, 30, 20),
                      child: new Image(image: AssetImage('assets/images/logo.png')),
                      ),
                  
                  
                  titleContentDescription(context, 'Name', resultCustomers[widget.id]['fullName']),
                  titleContentDescription(context, 'Email Address', resultCustomers[widget.id]['email']),
                  titleContentDescription(context, 'Mobile', resultCustomers[widget.id]['mobile']),

                  SizedBox(
                    height: 20
                  ),

                  Container(
                    padding: EdgeInsets.all(0),
                    child: TextFormField(
                      
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Service',
                      ),

                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter service';
                        }
                        return null;
                      },
                      onSaved: (value) => _service = value,
                    ),
                  ),
                  SizedBox(
                    height: 20
                  ),
                  Container(
                    padding: EdgeInsets.all(0),
                    child: TextFormField(
                      
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Book',
                      ),

                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter Book';
                        }
                        return null;
                      },
                      onSaved: (value) => _book = value,
                    ),
                  ),
                  
                  SizedBox(
                    height: 20
                  ),

                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 70,
                      padding: EdgeInsets.all(0),
                      child: RaisedButton(
                        textColor: Colors.white,
                        color: Color(0xff0078d4),
                        child: Text('Book now'),
                        onPressed: () {
                          if (_customerDetailKey.currentState.validate()) {
                              // If the form is valid, display a Snackbar.
                              _customerDetailKey.currentState.save();

                              addCustomerBooking(); 
                            }
                        },
                      )),

                  SizedBox(
                    height: 20
                  ),

                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 70,
                      padding: EdgeInsets.all(0),
                      child: RaisedButton(
                        textColor: Colors.white,
                        color: Color(0xff0078d4),
                        child: Text('Cancel Booking'),
                        onPressed: () {
                          cancelBooking();
                        },
                      )),
                  
                  SizedBox(
                    height: 20
                  ),
                  
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 70,
                      padding: EdgeInsets.all(0),
                      child: RaisedButton(
                        textColor: Colors.white,
                        color: Color(0xff0078d4),
                        child: Text('Get Booking'),
                        onPressed: () {
                          getCustomerBooking();
                        },
                      )),

                  SizedBox(
                    height: 20
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 70,
                      padding: EdgeInsets.all(0),
                      child: RaisedButton(
                        textColor: Colors.white,
                        color: Color(0xff0078d4),
                        child: Text('Delete Customer'),
                        onPressed: () {
                          deleteCustomer();
                        },
                      )),
                  SizedBox(
                    height: 20
                  ),
                ],
              )
            ),
          )
        ),
      );
  }
}