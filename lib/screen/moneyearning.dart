import 'package:flutter/material.dart';
import 'package:adovee_partner/global.dart';

import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class MoneyEarningPage extends StatefulWidget {
  @override
  _MoneyEarningPageState createState() => _MoneyEarningPageState();
}
 
class _MoneyEarningPageState extends State<MoneyEarningPage> {
 
  final GlobalKey<FormState> _moneyEarningKey = GlobalKey<FormState>();

  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now().add(Duration(days: 7));

  String message;
  
  Future<dynamic> moneyEarning() async {
    final http.Response response = await http.get(
      baseUrl + 'statistics/moneyearnings?startDate=' + format.format(_startDate) + '&endDate=' +format.format(_endDate),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: 'Bearer '+ currentUser.token,

      },
    );
    
    if (response.statusCode == 200) {
      setState(() {
        var body = json.decode(response.body);
        if(body != null) moneyearnings = body['earnings'];
      });
      message = 'Money earning success';
    }
    else {
      message = 'Money earning failed';
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
  void dispose() {
    super.dispose();
  }

  Widget earningList(Widget widget)
  {
    if(moneyearnings != null) return widget;
    else return null;
  }

  @override
  Widget build(BuildContext context) {
    moneyEarning();
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
              "Money Earning",
              style: TextStyle(color: Color(0xff0078d4)),
            ),
          )
        ),
        body: SafeArea(
          child: Form(
            key: _moneyEarningKey,
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
                            if (_moneyEarningKey.currentState.validate()) {
                                _moneyEarningKey.currentState.save();
                                moneyEarning();
                              }
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
                            if (_moneyEarningKey.currentState.validate()) {
                                _moneyEarningKey.currentState.save();
                                moneyEarning();
                              }
                          },
                        ),
                      ),
                      
                      earningList(titleContentDescription(context, 'Booking', moneyearnings['stats']['bookings'].toString())),
                      earningList(titleContentDescription(context, 'Canelations', moneyearnings['stats']['canelations'].toString())),
                      earningList(titleContentDescription(context, 'CaneclationLoss', moneyearnings['stats']['caneclationLoss'].toString())),
                      earningList(titleContentDescription(context, 'EarningsWithCancelation', moneyearnings['stats']['earningsWithCancelation'].toString())),
                      earningList(titleContentDescription(context, 'ActualEarnings', moneyearnings['stats']['actualEarnings'].toString())),
                    ],
                  ),
                ),
            ),
          ),
        ),
    );
  }
}