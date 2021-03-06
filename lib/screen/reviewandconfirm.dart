import 'package:adovee_partner/screen/complete.dart';
import 'package:flutter/material.dart';
import 'package:adovee_partner/screen/note.dart';
import 'package:flutter/rendering.dart';

class ReviewPage extends StatefulWidget {

  final int id;

  const ReviewPage({Key key, this.id}) : super(key: key);
  @override
  _ReviewPageState createState() => _ReviewPageState();
}
 
class _ReviewPageState extends State<ReviewPage> {
 
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
              "Review and Confirm",
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
                                Text('17 Jun 2020 at 11:00 am',
                                  style: Theme.of(context).textTheme.headline6.apply(
                                    color: Colors.black,
                                  ),
                                ),
                                Text('1h duration, end at 12:00 pm'),
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
                                  
                                    '100 Artsakh Ave. Marketplace Ste.115, Glendale, California-11111111111',
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
            // padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
            padding: EdgeInsets.all(0.0),
            height: MediaQuery.of(context).size.height / 8,
            child: new RaisedButton(
              color: Colors.white,
              onPressed: () {},
              padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.payment),
                      new Text('   Pay at Store',
                        style: Theme.of(context).textTheme.headline6.apply(
                        color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                )
            ),
          ),

          Container(
            //padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
            padding: EdgeInsets.all(0.0),
            height: MediaQuery.of(context).size.height / 8,
            child: new RaisedButton(
              color: Colors.white,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NotePage(id: 1)),
                  );
              },
              padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.event_note),
                      new Text('   Add booking notes',
                        style: Theme.of(context).textTheme.headline6.apply(
                        color: Color(0xff0078d4),
                        ),
                      ),
                    ],
                  ),
                )
            ),
          ),

          Container(
              padding: EdgeInsets.all(10),
              child: Center(
                child: Text("1 service USD 25",
                ),
              ), 
            ),
            
            Container(
              padding: EdgeInsets.all(10),
              child: RaisedButton(
                textColor: Colors.white,
                color: Color(0xff0078d4),
                child: Text(
                  'Confirm',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BookCompletePage(id: 1)),
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