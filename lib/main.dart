import 'package:flutter/material.dart';
import 'package:adovee_partner/screen/home.dart';
import 'package:syncfusion_flutter_core/core.dart';

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
      home: Home(current: 0),
      // routes: {
      //   'details' : (ctx) => DetailsScreen(),
      // }
    );
  }
}
