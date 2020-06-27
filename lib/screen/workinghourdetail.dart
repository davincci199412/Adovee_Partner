import 'package:flutter/material.dart';
import 'package:adovee_partner/global.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:fluttertoast/fluttertoast.dart';

import 'dart:io';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class WorkingHourDetailPage extends StatefulWidget {
  final int id;

  const WorkingHourDetailPage({Key key, this.id}) : super(key: key);
  
  @override
  _WorkingHourDetailPageState createState() => _WorkingHourDetailPageState();
}
 
class _WorkingHourDetailPageState extends State<WorkingHourDetailPage> {
 
  final GlobalKey<FormState> _workingHourDetailPageKey = GlobalKey<FormState>();

  String message;

  Future<dynamic> deleteWorkingHours() async {
    final http.Response response = await http.delete(
      baseUrl + 'employee/deleteworkinghours/' + workinghours[widget.id]['workingHoursId'].toString(),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: 'Bearer '+ currentUser.token,

      },
    );
    
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
        
        backgroundColor: Colors.white,

        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0), // here the desired height
          child: AppBar(
            iconTheme: IconThemeData(
              color: Color(0xFF222E36), //change your color here
            ),
            backgroundColor: Colors.white,
            title: Text(
              "Working Hour Detail",
              style: TextStyle(color: Color(0xff0078d4)),
            ),
          )
        ),
        body: SafeArea(
          child: Form(
            key: _workingHourDetailPageKey,
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
                          initialValue: DateTime.parse(workinghours[widget.id]['startDate']),
                          onShowPicker: (context, currentValue) {
                            return showDatePicker(
                                context: context,
                                firstDate: DateTime(1900),
                                initialDate: workinghours[widget.id]['startDate'],
                                lastDate: DateTime(2100));
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
                          initialValue: DateTime.parse(workinghours[widget.id]['endDate']),
                          onShowPicker: (context, currentValue) {
                            return showDatePicker(
                                context: context,
                                firstDate: DateTime(1900),
                                initialDate: workinghours[widget.id]['endDate'],
                                lastDate: DateTime(2100));
                          },
                        ),
                      ),
                                            
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 70,
                          padding: EdgeInsets.all(10),
                          child: RaisedButton(
                            textColor: Colors.white,
                            color: Colors.blue,
                            child: Text('Delete'),
                            onPressed: () {
                              if (_workingHourDetailPageKey.currentState.validate()) {
                                _workingHourDetailPageKey.currentState.save();
                                
                                deleteWorkingHours();

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