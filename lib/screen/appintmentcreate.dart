import 'package:flutter/material.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;
//import 'dart:async';

class CreateAppointmentPage extends StatefulWidget {
  @override
  _CreateAppointmentPageState createState() => _CreateAppointmentPageState();
}
 
class _CreateAppointmentPageState extends State<CreateAppointmentPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
 
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController controller = TextEditingController();
  
  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now().add(Duration(days: 7));
  
  Future displayDateRangePicker(BuildContext context) async {
    final List<DateTime> picked = await DateRagePicker.showDatePicker(
      context: context,
      initialFirstDate: _startDate, 
      initialLastDate: _endDate, 
      firstDate: new DateTime(DateTime.now().year - 50), 
      lastDate: new DateTime(DateTime.now().year + 50)
      );
    if(picked != null && picked.length == 2) {
      setState(() {
        _startDate = picked[0];
        _endDate = picked[1];
      });
      print(picked);
      
    }
  }
  
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
                      
                      onPressed: () async {
                        await displayDateRangePicker(context);
                      },
                    )),
              ],
            )
        
          ),
          ),

        //bottomNavigationBar: FooterBar(),
      );
  }
}