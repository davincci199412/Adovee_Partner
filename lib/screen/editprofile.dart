import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';


class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}
 
class _EditProfileState extends State<EditProfile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
 
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController controller = TextEditingController();
  String initialCountry = 'NG';
  PhoneNumber number = PhoneNumber(isoCode: 'NG');

  void showDialog() {
    showGeneralDialog(
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      context: context,
      pageBuilder: (_, __, ___) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 300,
            child: SizedBox.expand(child: FlutterLogo()),
            margin: EdgeInsets.only(bottom: 50, left: 12, right: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
        backgroundColor: Colors.white,

        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0), // here the desired height
          child: AppBar(
            iconTheme: IconThemeData(
              color: Color(0xFF222E36), //change your color here
            ),
            backgroundColor: Colors.white,
            title: Text(
              "Edit profile",
              style: TextStyle(color: Color(0xff0078d4)),
            ),
          )
        ),
        body: SafeArea(
          child: Center(
            child: ListView(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    CircleAvatar(
                      radius: MediaQuery.of(context).size.height / 8,
                      backgroundImage: AssetImage('assets/images/profile_logo.jpg'),
                    ),
                  ],
                ),
                
                
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'First Name',
                    ),
                  ),
                ),

                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Last Name',
                    ),
                  ),
                ),
                

                Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.all(10),
                    child: InternationalPhoneNumberInput(
                      onInputChanged: (PhoneNumber number) {
                        print(number.phoneNumber);
                      },
                      onInputValidated: (bool value) {
                        print(value);
                      },
                      ignoreBlank: false,
                      autoValidate: false,
                      selectorTextStyle: TextStyle(color: Colors.black),
                      initialValue: number,
                      textFieldController: controller,
                      inputBorder: OutlineInputBorder(),
                    ),
                
                ),

                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email Address',
                    ),
                  ),
                ),

                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 70,
                    padding: EdgeInsets.all(10),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text('Save'),
                      onPressed: () {
                        print(nameController.text);
                        print(passwordController.text);
                        //showDialog();
                      },
                    )),

                Container(
                  height: 70,
                    padding: EdgeInsets.all(10),
                    child: GridView.count(
                      // Create a grid with 2 columns. If you change the scrollDirection to
                      // horizontal, this produces 2 rows.
                      crossAxisCount: 2,
                      // Generate 100 widgets that display their index in the List.
                      children: List.generate(100, (index) {
                        return Center(
                          child: Text(
                            'Item $index',
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        );
                      }),
                    ),
                 ),
              ],
            ),
          ),
        ),
    );
  }
}