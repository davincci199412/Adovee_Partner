import 'package:flutter/material.dart';
import 'package:adovee/screen/home.dart';

void main() {
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
