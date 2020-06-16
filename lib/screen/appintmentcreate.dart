import 'package:flutter/material.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;

class CreateAppointmentPage extends StatefulWidget {
  @override
  _CreateAppointmentPageState createState() => _CreateAppointmentPageState();
}
 
class _CreateAppointmentPageState extends State<CreateAppointmentPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
 
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController controller = TextEditingController();
  

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
              "New Appointment",
              style: TextStyle(color: Color(0xff0078d4)),
            ),
          )
        ),

        body: Padding(
          padding: EdgeInsets.all(10),
          child: Center(

            child: ListView(
              //mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              //mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/12, 0, MediaQuery.of(context).size.width/12, MediaQuery.of(context).size.width/12),
                  child: new Image(image: AssetImage('assets/images/logo.png')),
                  ),

                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Client',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Date',
                    ),
                  ),
                ),

                Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Services',
                    style: Theme.of(context).textTheme.headline6.apply(
                              color: Colors.black,
                            ),
                    ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Service',
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
                      labelText: 'Start Time',
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 70,
                    padding: EdgeInsets.all(10),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Color(0xff0078d4),
                      child: Text('Save'),
                      // onPressed: () {
                      //   print(nameController.text);
                      //   print(passwordController.text);

                      // },
                  //     onPressed: () async {
                  //       final List<DateTime> picked = await DateRagePicker.showDatePicker(
                  //           context: context,
                  //           initialDate: new DateTime.now(),
                  // firstDate:
                  //     new DateTime.now().subtract(new Duration(days: 30)),
                  // lastDate: new DateTime.now().add(new Duration(days: 30)),
                  //       );
                  //       if (picked != null && picked.length == 2) {
                  //           print(picked);
                  //       }
                  //     },
                      onPressed: () => showDatePicker(
                        context: context,
                        initialDate: new DateTime.now(),
                        firstDate:
                            new DateTime.now().subtract(new Duration(days: 30)),
                        lastDate: new DateTime.now().add(new Duration(days: 30)),
                      ),
                    )),
              ],
            )
        
          ),
          ),

        //bottomNavigationBar: FooterBar(),
      );
  }
}