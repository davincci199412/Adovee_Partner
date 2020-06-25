import 'package:adovee_partner/screen/workinghour.dart';
import 'package:flutter/material.dart';
import 'package:adovee_partner/global.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;

import 'package:intl/intl.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';

class EmployeeDetailPage extends StatefulWidget {
  
  final int id;

  const EmployeeDetailPage({Key key, this.id}) : super(key: key);
  

  @override
  _EmployeeDetailPageState createState() => _EmployeeDetailPageState();
}
 
class _EmployeeDetailPageState extends State<EmployeeDetailPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
 
  final _employeeDetailKey = GlobalKey<FormState>();

  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now().add(Duration(days: 7));
  
  Future displayDateRangePicker(BuildContext context) async {
    final List<DateTime> picked = await DateRagePicker.showDatePicker(
      context: context,
      initialFirstDate: _startDate, 
      initialLastDate: _endDate, 
      firstDate: new DateTime(DateTime.now().year - 50), 
      lastDate: new DateTime(DateTime.now().year + 50)
      );
    if(picked != null && picked.length == 2) {
      setState(() {
        _startDate = picked[0];
        _endDate = picked[1];
      });
      print(picked);
      
    }
  }

  String message;
  String _service;
  String _book;

  
  Future<dynamic> getEmployeeWorkingHours() async {
    final response = await http.get(
      baseUrl + 'employee/getemployeeworkinghours',
      headers: {HttpHeaders.authorizationHeader: 'Bearer '+ currentUser.token},
    );
    if (response.statusCode == 200)
    {
      print('getworkinghours');
      print(json.decode(response.body));
      final body = json.decode(response.body);
      print('____________________________________');
      print(body);
      // var body = json.decode(response.body);
      // setState(() {
      //   companyEmployees = body['employees'];
      // });
      //print(companyEmployees);
    }
    else 
    {
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //       builder: (context) => OfflinePage()),
      // );
    }
    return response;
  }


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
        'Note': 'asdfhgdghdghgsdf',
      }),
    );
    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //       builder: (context) => CustomerPage()),
      // );
      message = 'Booking Success';
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

  Future<dynamic> deleteWorkingHours() async {
    final http.Response response = await http.delete(
      baseUrl + 'employee/deleteworkinghours/' + widget.id.toString(),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: 'Bearer '+ currentUser.token,

      },
    );
    //print(json.decode(response.body));
    print(response.statusCode);
    
    if (response.statusCode == 200) {
      message = 'Delete Success';
    }
    else {
      message = 'Delete Failed';
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
              "Employee Detail",
              style: TextStyle(color: Color(0xff0078d4)),
            ),
          )
        ),

        body: Padding(
          padding: EdgeInsets.all(10),
          child: Form(
            key: _employeeDetailKey,
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
                      
                      titleContentDescription(context, 'First Name', companyEmployees[widget.id]['firstName']),
                      titleContentDescription(context, 'Last Name', companyEmployees[widget.id]['lastName']),
                      titleContentDescription(context, 'Email Address', companyEmployees[widget.id]['email']),
                      titleContentDescription(context, 'Mobile Number', companyEmployees[widget.id]['mobile']),
                      titleContentDescription(context, 'Created Date', companyEmployees[widget.id]['createdDate']),

                      // DateTimeField(
                      //   format: format,
                      //   decoration: InputDecoration(
                      //       border: OutlineInputBorder(),
                      //       labelText: 'Service',
                      //     ),
                      //   initialValue: DateTime.now(),
                      //   onShowPicker: (context, currentValue) {
                      //     return showDatePicker(
                      //         context: context,
                      //         firstDate: DateTime(1900),
                      //         initialDate: currentValue ?? DateTime.now(),
                      //         lastDate: DateTime(2100));
                      //   },
                      // ),

                    ],
                  )
        
              ),
            )
            
          ),
          ),

        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.access_time),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => WorkingHourPage(id: widget.id)),
            );
          },
          tooltip: 'Working Hours',
          ),
      );
  }
}