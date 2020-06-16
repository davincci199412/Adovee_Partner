import 'package:adovee_partner/screen/chart.dart';
import 'package:flutter/material.dart';


class OverviewPage extends StatefulWidget {
  @override
  _OverviewPageState createState() => _OverviewPageState();
}
 
class _OverviewPageState extends State<OverviewPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Color(0xffeeeeee),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0), // here the desired height
          child: AppBar(
            iconTheme: IconThemeData(
              color: Color(0xff0078d4), //change your color here
            ),
            backgroundColor: Colors.white,
            title: Text(
              "Home",
              style: TextStyle(color: Color(0xff0078d4)),
            ),
          )
        ),
        body: Padding(
            padding: EdgeInsets.all(20),
            child: Center(
              child: ListView(
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(30),
                    child: new Image(image: AssetImage('assets/images/logo.png')),
                  ),
                  
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 1.616,
                    color: Colors.white,
                    padding: EdgeInsets.all(10),
                    
                    child: ListView(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Text(
                          'Recent Sales',
                          style: Theme.of(context).textTheme.headline6.apply(
                              color: Colors.black,
                            ),
                        ),
                        SizedBox(height: 5,),
                        new Text(
                          'Last 7 days',
                        ),

                        SizedBox(height: 20,),
                        new Text(
                          'USD 0',
                          style: Theme.of(context).textTheme.headline5.apply(
                              color: Colors.black,
                            ),
                        ),
                        SizedBox(height: 20,),
                        new Row(
                          children: <Widget>[
                              new Text(
                                'Appointments',
                              ),
                              SizedBox(width: 40,),
                              new Text(
                                '2',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        SizedBox(height: 5,),
                        new Row(
                          children: <Widget>[
                              new Text(
                                'Appointments value',
                              ),
                              SizedBox(width: 40,),
                              new Text(
                                'USD 0',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        // ListView(
                        //   children: <Widget>[
                        //     ChartPage(width: MediaQuery.of(context).size.width, height: 50,),

                        //   ],
                        // ),
                        // ChartPage(width: MediaQuery.of(context).size.width, height: 50,),

                        Container(
                          padding: EdgeInsets.all(10),
                          child: ChartPage(width: MediaQuery.of(context).size.width, height: 50,),
                        ),
                        
                      ],
                    )
                    
                  ),
                  
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'You do not have any notifications yet.',
                      textAlign: TextAlign.center,
                      ),
                  ),
                ],
              ),
            )
        ),

      );
  
  }
}