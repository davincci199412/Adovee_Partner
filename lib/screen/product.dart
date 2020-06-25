import 'package:adovee_partner/global.dart';
import 'package:adovee_partner/screen/createcustomer.dart';
import 'package:adovee_partner/screen/home.dart';
import 'package:adovee_partner/screen/offline.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}
 
class _ProductPageState extends State<ProductPage> {
  TextEditingController _searchController = TextEditingController();
  
  Future<dynamic> getProduct() async {
    final response = await http.get(
      baseUrl + 'product/getproduct',
      headers: {HttpHeaders.authorizationHeader: 'Bearer '+ currentUser.token},
    );
    print(response.statusCode);
    if (response.statusCode == 200)
    {
      var body = json.decode(response.body);
      setState(() {
        products = body['product'];
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
          hintText: "Search by Reference or Product",
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
          // searchCustomers(value);
        },
      ),
    );   
  }
  Widget productList(BuildContext context)
  {
    List<Widget> list = new List<Widget>();
    list.add(searchBox());
    if (products != null) {
      for(var i = 0; i < products.length; i++){
        list.add(contentButton(context, products[i]['categoryName'], 'product',i));
      }
    }
    
    return new ListView(children: list);
  }

  @override
  Widget build(BuildContext context) {
    getProduct();
    return WillPopScope(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0), // here the desired height
          child: AppBar(
            iconTheme: IconThemeData(
              color: Color(0xff0078d4), //change your color here
            ),
            backgroundColor: Colors.white,
            title: Text(
              "Product",
              style: TextStyle(color: Color(0xff0078d4)),
            ),
          )
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: productList(context),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CreateCustomerPage()),
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