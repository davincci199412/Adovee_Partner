import 'package:adovee/screen/favourite.dart';
import 'package:adovee/screen/logindetail.dart';
import 'package:flutter/material.dart';

class ServicePage extends StatefulWidget {

  final int id;

  const ServicePage({Key key, this.id}) : super(key: key);
  @override
  _ServicePageState createState() => _ServicePageState();
}
 
class _ServicePageState extends State<ServicePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0), // here the desired height
          child: AppBar(
            iconTheme: IconThemeData(
              color: Color(0xff0078d4), //change your color here
            ),
            backgroundColor: Colors.white,
            title: Text(
              "Select Service",
              style: TextStyle(color: Color(0xff0078d4)),
            ),
          )
        ),
      body: ListView(
        children: <Widget>[

          
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(50),
            child: new Image(image: AssetImage('assets/images/logo.png')),
          ),

          settingButton(new Icon(Icons.lightbulb_outline), 'Highlight', 0),
          settingButton(new Icon(Icons.lightbulb_outline), 'Highlight', 1),
          settingButton(new Icon(Icons.lightbulb_outline), 'Highlight', 2),
          settingButton(new Icon(Icons.lightbulb_outline), 'Highlight', 3),
          settingButton(new Icon(Icons.lightbulb_outline), 'Highlight', 4),
        ],
      ),
    );
  }
  
  Widget settingButton(Icon icon, String str, int buttonIndex)
  {
    return Container(
            
            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
            height: MediaQuery.of(context).size.height / 8,
            child: new RaisedButton(
              color: Colors.white,
              onPressed: () {
                // switch (buttonIndex) {
                //   case 0:    
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) => LoginDetailPage()),
                //     );   
                //     break;
                //   case 1:    
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) => FavouritePage()),
                //     );   
                //     break;
                //   default:
                // }
              },
              padding: EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Center(
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Row(
                        children: <Widget>[
                          CircleAvatar(
                            radius: MediaQuery.of(context).size.height / 24,
                            //backgroundImage: AssetImage('assets/images/profile_logo.jpg'),
                          ),
                          
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(str,
                                  style: Theme.of(context).textTheme.headline6.apply(
                                    color: Colors.black,
                                  ),
                                ),
                                Text('3h'),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('From'),
                          Text('20 USD'),
                        ],
                      ),
                    
                    ],
                  ), 
                  
                ), 
                    
              )
            ),
          );
  } 
}