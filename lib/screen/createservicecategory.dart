import 'package:adovee_partner/screen/servicecategory.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:adovee_partner/global.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';

class CreateServiceCategoryPage extends StatefulWidget {

  @override
  _CreateServiceCategoryPageState createState() => _CreateServiceCategoryPageState();
}
 
class _CreateServiceCategoryPageState extends State<CreateServiceCategoryPage> {
 
  final _addServiceCategoryKey = GlobalKey<FormState>();

  String message;

  final TextEditingController controller = TextEditingController();
  String initialCountry = 'NG';
  PhoneNumber number = PhoneNumber(isoCode: 'NG');

  String _categoryName;

  Future<dynamic> addServiceCategory() async {
    final http.Response response = await http.post(
      baseUrl + 'service/addservicecategory',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: 'Bearer '+ currentUser.token,
      },
      body: jsonEncode(<String, dynamic>{
        'CategoryName': _categoryName
      }),
    );
    
    if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ServiceCategoryPage()),
      );
      message = 'Success';
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
              "Add Service Category",
              style: TextStyle(color: Color(0xff0078d4)),
            ),
          )
        ),

        body: Padding(
          padding: EdgeInsets.all(10),
          child: Form(
            key: _addServiceCategoryKey,
            child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                          child: new Image(image: AssetImage('assets/images/logo.png')),
                          ),

                      Container(
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Category Name',
                          ),

                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter category name';
                            }
                            return null;
                          },
                          onSaved: (value) => _categoryName = value,
                        ),
                      ),
                     
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 70,
                          padding: EdgeInsets.all(10),
                          child: RaisedButton(
                            textColor: Colors.white,
                            color: Color(0xff0078d4),
                            child: Text('Add Service Category'),
                            onPressed: () {
                              if (_addServiceCategoryKey.currentState.validate()) {
                                  _addServiceCategoryKey.currentState.save();
                                  addServiceCategory();
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