import 'package:adovee_partner/global.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class CreateBookingPage extends StatefulWidget {
  @override
  _CreateBookingPageState createState() => _CreateBookingPageState();
}
 
class _CreateBookingPageState extends State<CreateBookingPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _bookingKey = GlobalKey<FormState>();

  Future<dynamic> addBookings() async {
    final http.Response response = await http.post(
      baseUrl + 'schedule/addbookings',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: 'Bearer '+ currentUser.token,
      },
      body: jsonEncode(<String, dynamic>{
        'ScheduleTitle': _scheduleTitle,
        'ServiceId': 17,
        'ScheduleId': 39,
        'Startdate': format.format(_startDate),
        'EndDate': format.format(_endDate),
        'BookingType': 1,
        'IsRecurring': false,
        'IsReminder': false,
        'RecurringDays': [
          0
        ],
        'NumberOfPlaces': 0,
        'ReminderTask': {
          'ReminderDate': '2020-06-25T15:44:47.361Z'
        }

      }),
    );
    if (response.statusCode == 200) {
      message = 'Addbooking success';
    }
    else {
      message = 'addbooking failed';
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

  Future<dynamic> getScheduleRecurringIntervalDates() async {
    final http.Response response = await http.post(
      baseUrl + 'schedule/getschedulerecurringintervaldates',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: 'Bearer '+ currentUser.token,
      },
      body: jsonEncode(<String, dynamic>{
        "BookingId": 5454,
        "ScheduleId": 1123,
        "ServiceId": 3212,
        "StartDate": format.format(_startDate),
        "EndDate": format.format(_endDate),
        "BookingTypeId": 1,
        "RecurringDays": [
          0,
          4
        ]
      }),
    );
    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      message = 'getschedulerecurringintervaldates success';
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

  Future<dynamic> addBookingWithRemovedIntervalDays() async {
    final http.Response response = await http.post(
      baseUrl + 'schedule/addbookingwithremovedintervaldays',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: 'Bearer '+ currentUser.token,
      },
      body: jsonEncode(<String, dynamic>{
        'Booking': {
          'Username': 'string',
          'ScheduleId': 0,
          'ScheduleTitle': 'string',
          'BookingId': 0,
          'ServiceId': 0,
          'CompanyId': 0,
          'CustomerIds': 'string',
          'CustomerId': 0,
          'Startdate': '2020-06-24T01:08:09.447Z',
          'EndDate': '2020-06-24T01:08:09.447Z',
          'IsBooked': true,
          'CompanyName': 'string',
          'ServiceTitle': 'string',
          'BookingType': 1,
          'ICanceled': true,
          'IsFullBooked': true,
          'CancledCode': 'string',
          'IsRecurring': true,
          'IsReminder': true,
          'RecurringDays': [
            0
          ],
          'NumberOfPlaces': 0,
          'IsConditionAccepted': true,
          'ScheduleReminder': {
            'ScheduleReminderTaskId': 0,
            'BookingId': 0,
            'CompanyId': 0,
            'CustomerId': 0,
            'Email': 'string',
            'Mobile': 'string',
            'ReminderDate': '2020-06-24T01:08:09.448Z',
            'IsReminderSent': true
          }
        },
        "DaysToRemove": [
          "2020-06-24T01:08:09.448Z"
        ]
      }),
    );
    if (response.statusCode == 200) {
      message = 'addBookingWithRemovedIntervalDays success';
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

  Future<dynamic> updateBooking() async {
    final http.Response response = await http.post(
      baseUrl + 'schedule/updatebooking',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: 'Bearer '+ currentUser.token,
      },
      body: jsonEncode(<String, dynamic>{
        'BookingId': 46,
        'StartDate': '2020-06-24T01:12:30.643Z',
        'EndDate': '2020-06-24T01:12:30.643Z'
      }),
    );
    if (response.statusCode == 200) {
      message = 'updatebooking success';
    }
    else {
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

  Future<dynamic> deleteBooking() async {
    final http.Response response = await http.delete(
      baseUrl + 'schedule/deletebooking/1',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: 'Bearer '+ currentUser.token,

      },
    );
    
    if (response.statusCode == 200) {
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
  

  String _scheduleTitle;
  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now().add(Duration(days: 7));
  String message = '';

  @override
  Widget build(BuildContext context) {
    addBookingWithRemovedIntervalDays();
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          iconTheme: IconThemeData(
            color: ThemeColors.lightBlue,
          ),
          backgroundColor: Colors.white,
          title: Text(
            "Add Booking",
            style: TextStyle(color: ThemeColors.lightBlue),
          ),
        )
      ),
      body: Padding(
          padding: EdgeInsets.all(10),
          child: Form(
            key: _bookingKey,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.fromLTRB(30, 0, 30, 10),
                      child: new Image(image: AssetImage('assets/images/logo.png')),
                      ),

                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter schedule title';
                          }
                          return null;
                        },
                        controller: emailController,
                        decoration: InputDecoration(
                        
                          border: OutlineInputBorder(),
                          labelText: 'Schedule Title.',
                        ),
                        onSaved: (value) => _scheduleTitle = value,
                      ),
                    ),
                    
                    Container(
                      padding: EdgeInsets.all(10),
                      child: DateTimeField(
                        format: format,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Start Date',
                          ),
                        initialValue: _startDate,
                        onShowPicker: (context, currentValue) {
                          return showDatePicker(
                              context: context,
                              firstDate: DateTime(1900),
                              initialDate: _startDate,
                              lastDate: DateTime(2100));
                        },
                        onChanged: (value) {
                          _startDate = value;
                        },
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.all(10),
                      child: DateTimeField(
                        format: format,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'End Date',
                          ),
                        initialValue: _endDate,
                        onShowPicker: (context, currentValue) {
                          return showDatePicker(
                              context: context,
                              firstDate: DateTime(1900),
                              initialDate: _endDate,
                              lastDate: DateTime(2100));
                        },
                        onChanged: (value) {
                          _endDate = value;
                        },
                      ),
                    ),
                           
                    Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        padding: EdgeInsets.all(10),
                        child: RaisedButton(
                          textColor: Colors.white,
                          color: ThemeColors.lightBlue,
                          child: Text('Add'),
                          
                          onPressed: () {
                            if (_bookingKey.currentState.validate()) {
                              _bookingKey.currentState.save();
                              addBookings();
                            }
                          },
                        )),

                    Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        padding: EdgeInsets.all(10),
                        child: RaisedButton(
                          textColor: Colors.white,
                          color: ThemeColors.lightBlue,
                          child: Text('Update'),
                          
                          onPressed: () {
                            if (_bookingKey.currentState.validate()) {
                              _bookingKey.currentState.save();
                              updateBooking();
                            }
                          },
                        )),

                    Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        padding: EdgeInsets.all(10),
                        child: RaisedButton(
                          textColor: Colors.white,
                          color: ThemeColors.lightBlue,
                          child: Text('Delete'),
                          
                          onPressed: () {
                            if (_bookingKey.currentState.validate()) {
                              _bookingKey.currentState.save();
                              deleteBooking();
                            }
                          },
                        )),
                    
                  ],
                ),
          
              )
            ),
            
          ),
          ),
    );
  }
}