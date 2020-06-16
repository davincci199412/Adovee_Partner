import 'package:adovee_partner/screen/profile.dart';
import 'package:flutter/material.dart';


class NotePage extends StatefulWidget {

  final int id;

  const NotePage({Key key, this.id}) : super(key: key);
  @override
  _NotePageState createState() => _NotePageState();
}
 
class _NotePageState extends State<NotePage> {
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
              "Add booking notes",
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
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Include comments or requests about your booking',
                      textAlign: TextAlign.center,
                      ),
                  ),

                  Container(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      keyboardType: TextInputType.multiline,
                      maxLength: null,
                      maxLines: null,
                      // controller: emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
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
                        child: Text('Done'),
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
                  
                ],
              ),
            
            ),
            ),
      );
  
  }
}