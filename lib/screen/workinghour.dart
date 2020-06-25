import 'package:adovee_partner/screen/createworkinghour.dart';
import 'package:flutter/material.dart';
import 'package:adovee_partner/global.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';

class WorkingHourPage extends StatefulWidget {
  
  final int id;

  const WorkingHourPage({Key key, this.id}) : super(key: key);
  

  @override
  _WorkingHourPageState createState() => _WorkingHourPageState();
}
 
class _WorkingHourPageState extends State<WorkingHourPage> {
  TextEditingController _searchController = TextEditingController();
 
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

      if(body != null) workinghours = body['employees'];
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
  
  Widget searchBox()
  {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          labelText: "Search",
          hintText: "Search by Reference or Employee",
          prefixIcon: Icon(Icons.search),
          suffixIcon: _searchController.text.isEmpty
              ? null
              : InkWell(
                  onTap: () => _searchController.clear(),
                  child: Icon(Icons.clear),
                ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
        ),
      ),
    );   
  }
  Widget workinghourList(BuildContext context)
  {
    List<Widget> list = new List<Widget>();
    list.add(searchBox());
    if(workinghours != null)
    {
      for(var i = 0; i < workinghours.length; i++){
        list.add(titleContentButton(context, workinghours[i]['startDate'], workinghours[i]['endDate'], 'workinghour', i));
      }
    }
    
    return new ListView(children: list);
  }
  @override
  Widget build(BuildContext context) {
    getEmployeeWorkingHours();
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
              "Working Hours",
              style: TextStyle(color: Color(0xff0078d4)),
            ),
          )
        ),

        body: Padding(
          padding: EdgeInsets.all(10),
            child: workinghourList(context),
          ),

        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CreateWorkingHourPage(id: widget.id,)),
            );

          },
          tooltip: 'Create working hour',
          ),
      );
  }
}