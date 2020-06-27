import 'package:adovee_partner/screen/editprofile.dart';
import 'package:flutter/material.dart';
import 'package:adovee_partner/global.dart';

class ClientDetailPage extends StatefulWidget {

  final int id;

  const ClientDetailPage({Key key, this.id}) : super(key: key);

  @override
  _ClientDetailPageState createState() => _ClientDetailPageState();
}
 
class _ClientDetailPageState extends State<ClientDetailPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          profileAvatar(),

          Container(
            padding: EdgeInsets.fromLTRB(10, 30, 10, 30),
            child: Text(
              'New Client',
              style: Theme.of(context).textTheme.headline6.apply(
                color: Colors.black,
              ),
            ),
          ),

          titleContentDescription(context, 'Email', 'lexy0127@outlook.com'),
          titleContentDescription(context, 'Gender', 'Male'),
          titleContentDescription(context, 'Total Sales', 'USD 0'),
          titleContentDescription(context, 'Outstanding', 'USD 0'),
          titleContentDescription(context, 'All Booking', '1'),
          titleContentDescription(context, 'Completed', '0'),
          titleContentDescription(context, 'Cancelled', '0'),
          titleContentDescription(context, 'No shows', '0'),

          Container(
            padding: EdgeInsets.fromLTRB(10, 30, 10, 30),
            child: Text(
              'Appointment Details',
              style: Theme.of(context).textTheme.headline6.apply(
                color: Colors.black,
              ),
            ),
          ),
          
          appointmentDescription('09', 'June', 'Tue 9.00 a.m', 'Haircut', '1h 30min with Wendy', 'USD 0'),

          Container(   
            padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
            height: MediaQuery.of(context).size.height / 8,
            decoration: BoxDecoration(
              color: Color(0xfff2f2f2),
              border: Border(bottom: BorderSide(color: Color(0xff888888)))
            ),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Center(
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('1h duration, end at 12:00 pm'),
                                Text('17 Jun 2020 at 11:00 am',
                                  style: Theme.of(context).textTheme.headline6.apply(
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ), 
                  
                ), 
                    
              )
          ),
        ],
      ),
    );
  }
  
  Widget profileAvatar(){
    return Center(
      child: Column(
        children: <Widget>[
          SizedBox(
            width: 40.0,
            height: MediaQuery.of(context).size.height / 32,
          ),
          CircleAvatar(
            radius: MediaQuery.of(context).size.height / 8,
            backgroundImage: AssetImage('assets/images/profile_logo.jpg'),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 32,
            child: Text(
              'Lexy',
              style: TextStyle(
                fontFamily: 'SourceSansPro',
                fontSize: 20,
              ),
            ),
          ),
          
          FlatButton(
            textColor: Colors.blue,
            padding: EdgeInsets.all(0),
            child: Text(
              'Edit Profile',
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => EditProfilePage()),
              );
            },
          ),
          SizedBox(
            height: 20.0,
            width: 200,
            child: Divider(
              color: Colors.teal[100],
            ),
          ),
        ],
      ),
    );
}


  Widget appointmentDescription(String strDay, String strMonth, String strTime, String strTitle, String strContent, String strMoney)
  {
    return Container(   
      padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
      height: MediaQuery.of(context).size.height / 8,
      decoration: BoxDecoration(
        color: Color(0xfff2f2f2),
        border: Border(bottom: BorderSide(color: Color(0xff888888)))
      ),
      child: Align(
          alignment: Alignment.centerLeft,
          child: Center(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(strDay,
                            style: Theme.of(context).textTheme.headline6.apply(
                              color: Colors.black,
                            ),
                          ),
                          Text(strMonth),
                        ],
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.all(0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(strTime),
                          Text(strContent,
                            style: Theme.of(context).textTheme.headline6.apply(
                              color: Colors.black,
                            ),
                          ),
                          Text(strContent),
                        ],
                      ),
                    ),
                  ],
                ),
                new Text(strMoney)
              ],
            ), 
            
          ), 
              
        )
    );
    
  }

}