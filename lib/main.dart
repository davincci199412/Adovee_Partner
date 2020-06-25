import 'package:adovee_partner/screen/firstscreen.dart';
import 'package:flutter/material.dart';

void main() {
  //SyncfusionLicense.registerLicense('ADD YOUR LICENCE KEY HERE');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'OpenSans'
      ),
      home: FirstScreenPage(),
      
    );
  }
}