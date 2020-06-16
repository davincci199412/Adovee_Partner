import 'package:adovee_partner/screen/appointments.dart';
import 'package:adovee_partner/screen/dailysales.dart';
import 'package:adovee_partner/screen/invoice.dart';
import 'package:adovee_partner/screen/voucher.dart';
import 'package:flutter/material.dart';

class SalesPage extends StatefulWidget {
  @override
  _SalesPageState createState() => _SalesPageState();
}
 
class _SalesPageState extends State<SalesPage> {
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
              "Sales",
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
          
          salesButton(new Icon(Icons.lightbulb_outline, size: 30,), 'Daily Sales', 'See daily totals of sales made and payments collected', 0),
          salesButton(new Icon(Icons.lightbulb_outline, size: 30,), 'Appointments', 'List of all appointments booked, with filter and export options', 1),
          salesButton(new Icon(Icons.lightbulb_outline, size: 30,), 'Invoices', 'List of all sales made, with filter and export options', 2),
          salesButton(new Icon(Icons.lightbulb_outline, size: 30,), 'Vouchers', 'List of all vouchers issued with filter and export options', 3),
        ],
      ),
    );
  }
  
  Widget salesButton(Icon icon, String strTitle, String strContent, int buttonIndex)
  {
    return Container(   
      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
      height: MediaQuery.of(context).size.height / 8,
      // decoration: BoxDecoration(
      //   // border: Border.all(color: Colors.blueAccent),
      //   color: Color(0xffeeeeee),
      //   border: Border(bottom: BorderSide(color: Color(0xff888888)))
      // ),
      child: FlatButton(
        onPressed: () {
          switch (buttonIndex) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DailySalesPage()),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AppointmentsPage()),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => InvoicePage()),
              );
              break;
            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => VoucherPage()),
              );
              break;
            case 4:
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AppointmentsPage()),
              );
              break;
            default:
          }
        }, 
        child: Align(
          alignment: Alignment.centerLeft,
          child: Center(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Row(
                  children: <Widget>[
                    icon,
                    SizedBox(
                      width: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.all(0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            strTitle,
                            style: Theme.of(context).textTheme.headline6.apply(
                              color: Colors.black,
                            ),
                          ),
                          Container(
                            constraints: new BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width * 0.8
                            ),
                            child: Text(
                              strContent,
                              style: Theme.of(context)
                                .textTheme
                                .subtitle2
                                .apply(color: Colors.black38),
                              textAlign: TextAlign.left,
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
    //   child: Align(
    //       alignment: Alignment.centerLeft,
    //       child: Center(
    //         child: new Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: <Widget>[
    //             new Row(
    //               children: <Widget>[
    //                 icon,
    //                 SizedBox(
    //                   width: 10,
    //                 ),
    //                 Padding(
    //                   padding: EdgeInsets.all(0),
    //                   child: Column(
    //                     mainAxisAlignment: MainAxisAlignment.center,
    //                     crossAxisAlignment: CrossAxisAlignment.start,
    //                     children: <Widget>[
    //                       Text(
    //                         strTitle,
    //                         style: Theme.of(context).textTheme.headline6.apply(
    //                           color: Colors.black,
    //                         ),
    //                       ),
    //                       Container(
    //                         constraints: new BoxConstraints(
    //                           maxWidth: MediaQuery.of(context).size.width * 0.8
    //                         ),
    //                         child: Text(
    //                           strContent,
    //                           style: Theme.of(context)
    //                             .textTheme
    //                             .subtitle2
    //                             .apply(color: Colors.black38),
    //                           textAlign: TextAlign.left,
    //                         ),
    //                       ),
                          
    //                     ],
    //                   ),
    //                 ),
    //               ],
    //             ),
                
    //           ],
    //         ), 
            
    //       ), 
              
    //     )
    );
  } 
}