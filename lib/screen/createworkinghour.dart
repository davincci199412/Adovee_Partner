import 'package:adovee_partner/screen/workinghour.dart';
import 'package:flutter/material.dart';
import 'package:adovee_partner/global.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class CreateWorkingHourPage extends StatefulWidget {
  final int id;

  const CreateWorkingHourPage({Key key, this.id}) : super(key: key);
  
  @override
  _CreateWorkingHourPageState createState() => _CreateWorkingHourPageState();
}
 
class _CreateWorkingHourPageState extends State<CreateWorkingHourPage> {
 
  final GlobalKey<FormState> _createWorkingHourKey = GlobalKey<FormState>();

  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now().add(Duration(days: 7));
  String _note = 'asdasad';

  String message;
   Future<dynamic> addWorkingHours() async {
    final http.Response response = await http.post(
      baseUrl + 'employee/addworkinghours',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: 'Bearer '+ currentUser.token,

      },
      body: jsonEncode(<String, dynamic>{
        'EmployeeId': companyEmployees[widget.id]['employeeId'],
        'StartDate': _startDate.toString(),
        'EndDate': _endDate.toString(),
        'Note': _note,
      }),
    );
    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => WorkingHourPage(id: widget.id,)),
      );
      message = 'Booking Success';
    }
    else {
      message = 'fail';
      print('-----------------sos-----------------');
      print(companyEmployees[widget.id]['employeeId']);
      print(_startDate);
      print(_endDate);
      print(response.statusCode);
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
              "Create Working Hour",
              style: TextStyle(color: Color(0xff0078d4)),
            ),
          )
        ),
        body: SafeArea(
          child: Form(
            key: _createWorkingHourKey,
            child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.fromLTRB(50, 0, 50, 10),
                        child: new Image(image: AssetImage('assets/images/logo.png')),
                        ),

                      Container(
                        padding: EdgeInsets.all(10),
                        child: DateTimeField(
                          format: format,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Start Date',
                            ),
                          initialValue: DateTime.now(),
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
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter note';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.multiline,
                          maxLength: null,
                          maxLines: null,
                          decoration: InputDecoration(
                          
                            border: OutlineInputBorder(),
                            labelText: 'Note',
                          ),
                          onSaved: (value) => _note = value,
                        ),
                      ),
                                            
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 70,
                          padding: EdgeInsets.all(10),
                          child: RaisedButton(
                            textColor: Colors.white,
                            color: Colors.blue,
                            child: Text('Add'),
                            onPressed: () {
                              if (_createWorkingHourKey.currentState.validate()) {
                                // If the form is valid, display a Snackbar.
                                _createWorkingHourKey.currentState.save();
                                
                                addWorkingHours();

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