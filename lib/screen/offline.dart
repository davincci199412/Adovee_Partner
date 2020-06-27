import 'package:adovee_partner/screen/home.dart';
import 'package:flutter/material.dart';


class OfflinePage extends StatefulWidget {
  @override
  _OfflinePageState createState() => _OfflinePageState();
}
 
class _OfflinePageState extends State<OfflinePage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(30),
                    child: new Image(image: AssetImage('assets/images/logo.png')),
                  ),
                  
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(20),
                    child: new Text(
                      'You are offline',
                      style: Theme.of(context).textTheme.headline6.apply(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: RaisedButton(
                        textColor: Colors.white,
                        color: Color(0xff0078d4),
                        child: Text('Go to Home'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Home(current: 1)),
                            );
                        },
                      )
                    ),
                  
                ],
              ),
            )
        ),

      );
  
  }
}