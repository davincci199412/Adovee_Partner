import 'package:flutter/material.dart';


class UptoDatePage extends StatefulWidget {
  @override
  _UptoDatePageState createState() => _UptoDatePageState();
}
 
class _UptoDatePageState extends State<UptoDatePage> {
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
                      'You are up to date!',
                      style: Theme.of(context).textTheme.headline6.apply(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Check back here to learn about brand new features add to your account.',
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