import 'package:adovee_partner/global.dart';
import 'package:adovee_partner/screen/createservicecategory.dart';
import 'package:adovee_partner/screen/home.dart';
import 'package:adovee_partner/screen/offline.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';

class ServiceCategoryPage extends StatefulWidget {
  @override
  _ServiceCategoryPageState createState() => _ServiceCategoryPageState();
}
 
class _ServiceCategoryPageState extends State<ServiceCategoryPage> {

  
  TextEditingController _searchController = TextEditingController();
  
  int smsBalance;
  Future<dynamic> getAllServiceCategorys() async {
    final response = await http.get(
      baseUrl + 'service/getallservicecategorys',
      headers: {HttpHeaders.authorizationHeader: 'Bearer '+ currentUser.token},
    );
    if (response.statusCode == 200)
    {
      var body = json.decode(response.body);
      setState(() {
        categorizedServices = body['categorizedServices'];      
      });
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

  Widget searchBox()
  {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          labelText: "Search",
          hintText: "Search by Reference or Service",
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
  Widget serviceList(BuildContext context)
  {
    List<Widget> list = new List<Widget>();
    list.add(searchBox());
    if(categorizedServices != null)
    {
      for(var i = 0; i < categorizedServices.length; i++){
        list.add(titleContentButton(context, 'Name', categorizedServices[i]['categoryName'], 'category', i));
      }
    }
    
    return new ListView(children: list);
  }

  @override
  Widget build(BuildContext context) {
    getAllServiceCategorys();
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
              "Category",
              style: TextStyle(color: Color(0xff0078d4)),
            ),
          )
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: serviceList(context),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CreateServiceCategoryPage()),
            );

          },
          tooltip: 'Create service category',
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