import 'package:adovee_partner/screen/createbooking.dart';
import 'package:adovee_partner/screen/scheduleconfiguration.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:adovee_partner/global.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class SchedulePage extends StatefulWidget {
  SchedulePage({Key key}) : super(key: key);

  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {

  final GlobalKey<State> _keyLoader = new GlobalKey<State>();

  List<Meeting> meetings;
  DateTime selectedDate = DateTime.now();
  String message;
  int _selectedEmployee;

  static Future<void> showLoadingDialog(BuildContext context, GlobalKey key) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return new WillPopScope(
          onWillPop: () async => false,
          child: SimpleDialog(
              key: key,
              backgroundColor: Colors.black54,
              children: <Widget>[
                Center(
                  child: Column(children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 10,),
                    Text("Please Wait....",style: TextStyle(color: Colors.blueAccent),)
                  ]),
                )
              ]));
      });
  }

  Future<dynamic> getCompanyCalenders(int selectedEmployee, DateTime date) async {
    String strDate = format.format(date);
    final http.Response response = await http.get(
      baseUrl + 'schedule/getcompanycalenders?employeeId='+ selectedEmployee.toString() +'&date=' + strDate,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: 'Bearer '+ currentUser.token,
      },
    );
    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      employeeCalenders = body['employeeCalenders'];
      if(employeeCalenders == null) loading = false;
      else loading = true; 
      message = 'Get Company Calendar Success';
    }
    else {
      message = 'Get Company Calendar fail';
    }

    return response;
      
  }

  Widget _getFAB() {
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: IconThemeData(size: 22),
      backgroundColor: ThemeColors.lightBlue,
      visible: true,
      curve: Curves.bounceIn,
      tooltip: 'Change',
      children: [
        SpeedDialChild(
          child: Icon(Icons.verified_user),
          backgroundColor: ThemeColors.lightBlue,
          onTap: () { 
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CreateBookingPage()),
              );
          },
          label: 'Booking',
        ),
        SpeedDialChild(
          child: Icon(Icons.confirmation_number),
          backgroundColor: ThemeColors.lightBlue,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ScheduleConfigurationPage()),
            );
            getScheduleRecurringIntervalDates();
          },
          label: 'Configuration',
        )
      ],
    );
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
        "StartDate": "2020-06-26T10:21:37.245Z",
        "EndDate": "2020-06-26T10:21:37.245Z",
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

  List<DropdownMenuItem<dynamic>> _dropDownMenuItems;

  List<DropdownMenuItem<dynamic>> buildDropDownMenuItems()
  {
    List<DropdownMenuItem<dynamic>> items = List();
    if(companyEmployees != null)
    {
      for(int i = 0; i < companyEmployees.length; i ++)
      {
        items.add(
          DropdownMenuItem(
            value: companyEmployees[i]['employeeId'],
            child: Text(companyEmployees[i]['firstName'] + ' ' + companyEmployees[i]['lastName'])
            ),
          );
      }
    }
    return items;
  }

  void onChangeDropDownItem(var selectedEmployee)
  {
    setState(() {
      _selectedEmployee = selectedEmployee;
    });
  }

  Future<dynamic> getEmployeeInCompany() async {
    final response = await http.get(
      baseUrl + 'employee/getemployeeincompany',
      headers: {HttpHeaders.authorizationHeader: 'Bearer '+ currentUser.token},
    );
    if (response.statusCode == 200)
    {
      var body = json.decode(response.body);      
      
      if (body != null)
      {
        setState(() {
          companyEmployees = body['employees'];
        });
        _dropDownMenuItems = buildDropDownMenuItems();
        getCompanyCalenders(_selectedEmployee, DateTime.now());
      }
    }
    else 
    {
    }
    return response;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    getEmployeeInCompany();
    _selectedEmployee = _dropDownMenuItems[0].value;
    return Scaffold(
      extendBody: true,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0), 
          child: AppBar(
            iconTheme: IconThemeData(
              color: Color(0xff0078d4), //change your color here
            ),
            backgroundColor: Colors.white,
            title: Text(
              "Schedule",
              style: TextStyle(color: Color(0xff0078d4)),
            ),
          )
        ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              'Select Employee',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),

          Container(
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width / 5,
            height: 70,
            child: DropdownButtonHideUnderline(
              child: ButtonTheme(
                alignedDropdown: true,
                child: DropdownButton(
                  value: _selectedEmployee,
                  items: _dropDownMenuItems,
                  onChanged: onChangeDropDownItem,
                  style: Theme.of(context).textTheme.headline6,
                ),
                minWidth: MediaQuery.of(context).size.width / 3,
              ),
            ),
          ),

          Container(
            padding: EdgeInsets.all(10),
            child: DateTimeField(
              format: format,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Select Date',
                ),
              initialValue: DateTime.now(),
              onShowPicker: (context, currentValue) {
                return showDatePicker(
                    context: context,
                    firstDate: DateTime(1900),
                    initialDate: selectedDate,
                    lastDate: DateTime(2100));
              },
              onChanged: (value) {
                selectedDate = value;
              },
            ),
          ),

          SfCalendar(
            view: CalendarView.day,
            headerHeight: 50,
            viewHeaderHeight: 50,
            initialDisplayDate: DateTime.now(),
            todayHighlightColor: Colors.red,
            dataSource: MeetingDataSource(_getDataSource()),
            monthViewSettings: MonthViewSettings(
              appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
              showAgenda: true,
              agendaViewHeight: 700
              ),
          ),
        ],
      ),
      
      floatingActionButton: _getFAB(),
    );
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 30))
    );

    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
    }
  }

  List<Meeting> _getDataSource() {
    meetings = <Meeting>[];
    final DateTime today = DateTime.now();
    final DateTime startTime =
        DateTime(today.year, today.month, today.day, 9, 0, 0);
    final DateTime endTime = startTime.add(const Duration(hours: 2));
    meetings.add(Meeting('Conference', startTime, endTime, const Color(0xFF0F8644), false));
    return meetings;
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments[index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments[index].to;
  }

  @override
  String getSubject(int index) {
    return appointments[index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments[index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments[index].isAllDay;
  }
}

class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}