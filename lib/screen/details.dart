import 'package:adovee_partner/screen/service.dart';
import 'package:flutter/material.dart';
import 'package:adovee_partner/global.dart';

class DetailsScreen extends StatelessWidget {
  final int id;

  const DetailsScreen({Key key, this.id}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width /1.616,
              alignment: Alignment.center,
              child: new Image(image: AssetImage('assets/images/logo.png')),
            ),

            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                "${destinationsList[id].hotelName}",
                style: Theme.of(context).textTheme.headline6.apply(
                      color: Colors.black,
                    ),
              ),
            ),
            
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                "${destinationsList[id].placeName} - ${destinationsList[id].date}",
                style: Theme.of(context)
                    .textTheme
                    .subtitle2
                    .apply(color: Colors.black38),
              ),
            ),
            
            Spacer(),

            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    Icons.star,
                    
                  ),
                  Text(
                    '5.0 Great(2)',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            Container(
              padding: EdgeInsets.all(10),
              child: Center(
                child: Text("9 services available",
                ),
              ), 
            ),
            
            Container(
              padding: EdgeInsets.all(10),
              child: RaisedButton(
                textColor: Colors.white,
                color: Color(0xff0078d4),
                child: Text(
                  'Book now',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ServicePage(id: 1)),
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
      ),
    );
  }
}
