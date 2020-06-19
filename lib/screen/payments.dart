import 'package:adovee/screen/favourite.dart';
import 'package:flutter/material.dart';
import 'package:adovee/screen/register.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}
 
class _PaymentPageState extends State<PaymentPage> {
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
              "Payment methods",
              style: TextStyle(color: Color(0xff0078d4)),
            ),
          )
        ),
      body: ListView(
        children: <Widget>[
          SizedBox(
                width: 40.0,
                height: 40.0,
              ),
          paymentButton(new Icon(Icons.card_giftcard), 'Add new card', 0),
        ],
      ),
    );
  }
  
  Widget paymentButton(Icon icon, String str, int buttonIndex)
  {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 1, 10, 1),
      height: MediaQuery.of(context).size.height / 6,
      child: new RaisedButton(
        color: Colors.white,
        onPressed: () {
          switch (buttonIndex) {
            case 0:    
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Register()),
              );   
              break;
            case 1:    
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FavouritePage()),
              );   
              break;
            default:
          }
        },
        padding: EdgeInsets.all(8.0),
        child: Align(
            alignment: Alignment.centerLeft,
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                icon,
                new Text(
                  '  ' + str,
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ],
            ),
          )
      ),
    );
  } 
}