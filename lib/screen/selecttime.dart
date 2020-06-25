import 'package:flutter/material.dart';
import 'package:adovee_partner/screen/reviewandconfirm.dart';

class SeleteTimePage extends StatefulWidget {
  final int id;

  const SeleteTimePage({Key key, this.id}) : super(key: key);
  @override
  _SeleteTimePageState createState() => _SeleteTimePageState();
}
 
class _SeleteTimePageState extends State<SeleteTimePage> {
 
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
              "Selete Time",
              style: TextStyle(color: Color(0xff0078d4)),
            ),
          )
        ),
        body: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                  'June',
                  style: TextStyle(fontSize: 30),
              ),
            ),
            
            Container(
              padding: EdgeInsets.all(10),
              height: MediaQuery.of(context).size.width / 4,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (ctx, i) {
                  return GestureDetector(
                    // onTap: () => Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (ctx) => DetailsScreen(id: i),
                    //   ),
                    // ),
                    onTap: () => {},
                    child: Container(
                      width: MediaQuery.of(context).size.width / 4 - 20,
                      margin:
                          EdgeInsets.fromLTRB(0, 10, 10, 10),
                          //const EdgeInsets.symmetric(horizontal: 10.0),
                      child: ClipRRect(
                        //borderRadius: BorderRadius.circular(5.0),
                        child: Stack(
                          children: <Widget>[
                            RaisedButton(
                              textColor: Colors.white,
                              color: Color(0xff0078d4),
                              onPressed: () {},
                              // child: Image.network(
                              //   destinationsList[i].imageUrl,
                              //   fit: BoxFit.cover,
                              // ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text('Mon'),
                                  Text('16'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              child: Icon(Icons.access_time),
            ),

            
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              child: Text(
                'Red & Blue Beauty Salon is all booked today',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline6.apply(
                    color: Colors.black,
                  ),
                ),
            ),

            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              child: Text(
                'but you can book for next week, 18 Jun',
                textAlign: TextAlign.center,
                ),
            ),

            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: RaisedButton(
                textColor: Colors.white,
                color: Color(0xff0078d4),
                child: Text('Go to Wednesday 17 Jun'),
                onPressed: () {

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ReviewPage(id: 1)),
                    );
                },
              )),                
          ],
        )
      );
  
  }
}