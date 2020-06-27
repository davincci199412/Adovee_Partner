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
    
    if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CustomerPage()),
      );
      message = 'Booking Success';
    }
    else {
      message = 'Fail';
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
    if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CustomerPage()),
      );
      message = 'Booking Cancel Success';
    }
    else {
      message = 'Fail';
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
    
    if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CustomerPage()),
      );
      message = 'Get Booking Success';
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
  
  Future<dynamic> deleteCustomer() async {
    final http.Response response = await http.delete(
      baseUrl + 'customer/delete/' + customers[widget.id]['customerId'].toString(),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: 'Bearer '+ currentUser.token,

      },
    );
    if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CustomerPage()),
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
                    width: MediaQuery.of(context).size.width,
                    height: 70,
                      padding: EdgeInsets.all(0),
                      child: RaisedButton(
                        textColor: Colors.white,
                        color: Color(0xff0078d4),
                        child: Text('Book now'),
                        onPressed: () {
                          if (_customerDetailKey.currentState.validate()) {
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