import 'package:adovee_partner/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class BookCompletePage extends StatefulWidget {

  final int id;

  const BookCompletePage({Key key, this.id}) : super(key: key);
  @override
  _BookCompletePageState createState() => _BookCompletePageState();
}
 
class _BookCompletePageState extends State<BookCompletePage> {
 
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
              "Complete",
              style: TextStyle(color: Color(0xff0078d4)),
            ),
          )
        ),
      body: ListView(
        children: <Widget>[
          Container(   
            padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
            height: MediaQuery.of(context).size.height / 8,
            decoration: BoxDecoration(
              // border: Border.all(color: Colors.blueAccent),
              color: Color(0xfff2f2f2),
              //border: Border(bottom: BorderSide(color: Color(0xff888888)))
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
                                Text('17 Jun 2020 at 11:00 am',
                                  style: Theme.of(context).textTheme.headline5.apply(
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  'Confirmed',
                                  style: TextStyle(color: Color(0xff0078d4)),
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

          Container(   
            padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
            height: MediaQuery.of(context).size.height / 8,
            decoration: BoxDecoration(
              // border: Border.all(color: Colors.blueAccent),
              color: Color(0xffeeeeee),
              //border: Border(bottom: BorderSide(color: Color(0xff888888)))
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
                                Text('Read & Blue Beauty Salon',
                                  style: Theme.of(context).textTheme.headline6.apply(
                                    color: Colors.black,
                                  ),
                                ),
                                Container(
                                  constraints: new BoxConstraints(
                                    maxWidth: MediaQuery.of(context).size.width - 100
                                  ),
                                  child: Text(
                                  
                                    '100 Artsakh Ave. Marketplace Ste.115,',
                                    style: Theme.of(context)
                                      .textTheme
                                      .subtitle2
                                      .apply(color: Colors.black38),
                                    textAlign: TextAlign.left,
                                  ),
                                ),

                                Container(
                                  constraints: new BoxConstraints(
                                    maxWidth: MediaQuery.of(context).size.width - 100
                                  ),
                                  child: Text(
                                    'Glendale, California, 91205',
                                    style: Theme.of(context)
                                      .textTheme
                                      .subtitle2
                                      .apply(color: Colors.black38),
                                    textAlign: TextAlign.left,
                                  ),
                                ),

                                Container(
                                  constraints: new BoxConstraints(
                                    maxWidth: MediaQuery.of(context).size.width - 100
                                  ),
                                  child: Text(
                                  
                                    'Booking ref: 6DB39778',
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
                      
                      Container(
                        width: MediaQuery.of(context).size.width /8,
                        height: MediaQuery.of(context).size.height / 8,
                        constraints: new BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width /8,
                          maxHeight: MediaQuery.of(context).size.width /8
                        ),
                        child: Image.asset(
                          'assets/images/login.png',
                          width: MediaQuery.of(context).size.width /8,
                          height: MediaQuery.of(context).size.width /8,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ), 
                  
                ), 
                    
              )
          ),

          Container(   
            padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
            height: MediaQuery.of(context).size.height / 8,
            decoration: BoxDecoration(
              // border: Border.all(color: Colors.blueAccent),
              color: Color(0xffeeeeee),
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
                                Text('Haircut',
                                  style: Theme.of(context).textTheme.headline6.apply(
                                    color: Colors.black,
                                  ),
                                ),
                                Container(
                                  constraints: new BoxConstraints(
                                    maxWidth: MediaQuery.of(context).size.width - 100
                                  ),
                                  child: Text(
                                    '1h Men',
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
                      
                      Text(
                        'USD 25'
                      )
                      
                    ],
                  ), 
                  
                ), 
                    
              )
          ),
          
          Container(   
            padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
            height: MediaQuery.of(context).size.height / 8,
            decoration: BoxDecoration(
              // border: Border.all(color: Colors.blueAccent),
              color: Color(0xffeeeeee),
              border: Border(bottom: BorderSide(color: Color(0xff888888)))
            ),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Center(
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[

                      Text('Total',
                        style: Theme.of(context).textTheme.headline6.apply(
                        color: Colors.black,
                        ),
                      ),
                      Text(
                        'USD 25'
                      )
                      
                    ],
                  ), 
                  
                ), 
                    
              )
          ),

          Container(
            padding: EdgeInsets.all(10),
            child: RaisedButton(
              textColor: Colors.white,
              color: Color(0xff0078d4),
              child: Text(
                'Direction',
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Home(current: 0)),
                );
              },
            ),
          ),

          Container(
            padding: EdgeInsets.all(10),
            child: RaisedButton(
              textColor: Colors.white,
              color: Color(0xff0078d4),
              child: Text(
                'Reschedule',
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Home(current: 0)),
                );
              },
            ),
          ),

          Container(
            padding: EdgeInsets.all(10),
            child: RaisedButton(
              textColor: Colors.white,
              color: Color(0xff0078d4),
              child: Text(
                'Cancel',
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Home(current: 0)),
                );
              },
            ),
          ),

          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              "Related",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),

          Container(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Text(
                "No Related Found",
                style: Theme.of(context)
                    .textTheme
                    .subtitle2
                    .apply(color: Colors.black38),
              ),
            ),
            
          ),
        
        ],
      ),
    );
  }
  
  Widget reviewItem(Icon icon, String str, int buttonIndex)
  {
    return Container(   
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      height: MediaQuery.of(context).size.height / 8,
      decoration: BoxDecoration(
        // border: Border.all(color: Colors.blueAccent),
        color: Colors.black26,
        border: Border(bottom: BorderSide(color: Colors.black26))
      ),
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
                          Text('str',
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
    );
  }
}