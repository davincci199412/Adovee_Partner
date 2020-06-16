import 'package:adovee_partner/screen/profile.dart';
import 'package:adovee_partner/screen/register.dart';
import 'package:flutter/material.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}
 
class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0), // here the desired height
          child: AppBar(
            iconTheme: IconThemeData(
              color: Color(0xff0078d4), //change your color here
            ),
            backgroundColor: Colors.white,
            title: Text(
              "Sign in",
              style: TextStyle(color: Color(0xff0078d4)),
            ),
          )
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: Center(
              child: ListView(
                children: <Widget>[
                  Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(50),
                      child: new Image(image: AssetImage('assets/images/logo.png')),
                      ),
                  
                  Container(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email Address',
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: TextField(
                      obscureText: true,
                      controller: passwordController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                      ),
                    ),
                  ),
                  FlatButton(
                    onPressed: (){
                      //forgot password screen
                    },
                    textColor: Color(0xff0078d4),
                    child: SizedBox(
                      width: double.infinity,
                      child: Text(
                      'Forgot Password? ',
                      textAlign: TextAlign.right),
                    ),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: RaisedButton(
                        textColor: Colors.white,
                        color: Color(0xff0078d4),
                        child: Text('Login'),
                        onPressed: () {
                          print(emailController.text);
                          print(passwordController.text);

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Profile()),
                            );
                        },
                      )),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Text("Don't have account?"),
                        FlatButton(
                          textColor: Color(0xff0078d4),
                          child: Text(
                            'Sign Up',
                            style: TextStyle(fontSize: 20),
                          ),
                          onPressed: () {
                            //signup screen
                            
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Register()),
                            );
                          },
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                  )),
                ],
              ),
            
            ),
            ),
      );
  
  }
}