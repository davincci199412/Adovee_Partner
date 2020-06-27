import 'package:adovee_partner/screen/office.dart';
import 'package:adovee_partner/screen/offline.dart';
import 'package:flutter/material.dart';
import 'package:adovee_partner/global.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';

class OfficeDetailPage extends StatefulWidget {
  
  final int id;

  const OfficeDetailPage({Key key, this.id}) : super(key: key);
  

  @override
  _OfficeDetailPageState createState() => _OfficeDetailPageState();
}
 
class _OfficeDetailPageState extends State<OfficeDetailPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
 
  final _officeDetailKey = GlobalKey<FormState>();

  final TextEditingController phoneController = TextEditingController();
  
  String phoneNumber;
  String phoneIsoCode;
  bool visible = false;
  String confirmedNumber = '';
  String message;

  int _selectedEmployee;

  var officeEmployees;
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

  Future<dynamic> assignEmployeeToOffice() async {
    final http.Response response = await http.post(
      baseUrl + 'office/assignemployeetooffice',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: 'Bearer '+ currentUser.token,

      },
      body: jsonEncode(<String, dynamic>{
        'EmployeeId': _selectedEmployee,
        'BranchOfficeId': offices[widget.id]['branchOfficeId'],
      }),
    );
    
    if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => OfficePage()),
      );
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
  
  Future<dynamic> getAllCompanyOffices() async {
    final http.Response response = await http.get(
      baseUrl + 'office/getallcompanyoffices',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: 'Bearer '+ currentUser.token,

      },
    );
    
    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      if(body != null) officeEmployees = body['offices'];
      message = 'Get office Success';
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

  Future<dynamic> getEmployeeInCompany() async {
    final response = await http.get(
      baseUrl + 'employee/getemployeeincompany',
      headers: {HttpHeaders.authorizationHeader: 'Bearer '+ currentUser.token},
    );
    if (response.statusCode == 200)
    {
      var body = json.decode(response.body);
      
      companyEmployees = body['employees'];
      if (companyEmployees != null)
      {
        setState(() {
          _dropDownMenuItems = buildDropDownMenuItems();
        _selectedEmployee = _dropDownMenuItems[0].value;
        });
        
      }
    }
    else 
    {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => OfflinePage()),
      );
    }
    return response;
  }

  @override
  void initState() {
    
    getAllCompanyOffices();
    getEmployeeInCompany();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
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
              'Office: ' + offices[widget.id]['name'],
              style: TextStyle(color: Color(0xff0078d4)),
            ),
          )
        ),

        body: Padding(
          padding: EdgeInsets.all(10),
          child: Form(
            key: _officeDetailKey,
            child: Center(
              child: ListView(
                children: <Widget>[
                  Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.fromLTRB(30, 0, 30, 20),
                      child: new Image(image: AssetImage('assets/images/logo.png')),
                      ),
                  
                  titleContentDescription(context, 'Name', offices[widget.id]['name']),
                  titleContentDescription(context, 'Country', offices[widget.id]['country']),
                  titleContentDescription(context, 'Address', offices[widget.id]['address']),
                  titleContentDescription(context, 'ZipCode', offices[widget.id]['zipCode']),
                  titleContentDescription(context, 'Area', offices[widget.id]['area']),


                  SizedBox(
                    height: 20
                  ),
                  
                  Container(
                    padding: EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width,
                    height: 70,
                    child: DropdownButton(
                      value: _selectedEmployee,
                      items: _dropDownMenuItems, 
                      onChanged: onChangeDropDownItem,
                    ),
                  ),
                  

                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 70,
                      padding: EdgeInsets.all(0),
                      child: RaisedButton(
                        textColor: Colors.white,
                        color: Color(0xff0078d4),
                        child: Text('Assign Employee to office'),
                        onPressed: () {
                          assignEmployeeToOffice();
                        },
                      )),
                ],
              )
            ),
          )
        ),
      );
  }
}