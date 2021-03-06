import 'package:adovee_partner/global.dart';
import 'package:adovee_partner/screen/home.dart';
import 'package:adovee_partner/screen/smtpserverdetail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';

class SmtpServerPage extends StatefulWidget {
  @override
  _SmtpServerPageState createState() => _SmtpServerPageState();
}
 
class _SmtpServerPageState extends State<SmtpServerPage> {
  TextEditingController _searchController = TextEditingController();
  
  Future<dynamic> getSmtpServer() async {
    final response = await http.get(
      baseUrl + 'smtpserver/getsmtpserver',
      headers: {HttpHeaders.authorizationHeader: 'Bearer '+ currentUser.token},
    );
    if (response.statusCode == 200)
    {
      var body = json.decode(response.body);
      
    }
    else 
    {

    }
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
          hintText: "Search by Reference or smtp server",
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
        onChanged: (value) {
        },
      ),
    );   
  }
  Widget smtpServerList(BuildContext context)
  {
    List<Widget> list = new List<Widget>();
    list.add(searchBox());
    
    return new ListView(children: list);
  }

  @override
  Widget build(BuildContext context) {
    getSmtpServer();
    return WillPopScope(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
            iconTheme: IconThemeData(
              color: Color(0xff0078d4),
            ),
            backgroundColor: Colors.white,
            title: Text(
              "SMTP Server",
              style: TextStyle(color: Color(0xff0078d4)),
            ),
          )
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: smtpServerList(context),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SmtpServerUpdatePage(id: 1)),
            );

          },
          tooltip: 'Create customer',
          ),
      ), 
      onWillPop: () async {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Home(current: 4)),
        );

        return false;
      },
      
    );
  }
}