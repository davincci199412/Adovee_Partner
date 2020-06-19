import 'package:adovee/screen/search.dart';
import 'package:flutter/material.dart';
import 'package:adovee/global.dart';
import 'package:adovee/screen/details.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}
 
class _DashboardState extends State<Dashboard> {
  TextEditingController _searchController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
 
  FocusNode _textFocus = new FocusNode();

  void onChange()
  {
    bool hasFocus = _textFocus.hasFocus;
    //do your text transforming
    if (hasFocus) 
    {
      hasFocus = false;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) => SearchPage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    _textFocus.addListener(onChange);
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0), // here the desired height
          child: AppBar(
            iconTheme: IconThemeData(
              color: Color(0xff0078d4), //change your color here
            ),
            backgroundColor: Colors.white,
            title: Text(
              "Book what you love",
              style: TextStyle(color: Color(0xff0078d4)),
            ),
          )
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                
                // Container(
                //   padding: EdgeInsets.all(10),
                //   child: Text(
                //       'Book what you love',
                //       style: TextStyle(fontSize: 20),
                //   ),
                // ),

                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      labelText: "Search",
                      hintText: "Search for a service or venue",
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: _searchController.text.isEmpty
                          ? null
                          : InkWell(
                              onTap: () => _searchController.clear(),
                              child: Icon(Icons.clear),
                            ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                    ),
                    focusNode: _textFocus,
                  ),
                ),

                Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                      'Hotel Booking',
                      style: TextStyle(fontSize: 30),
                  ),
                ),
                
                Container(
                  padding: EdgeInsets.all(10),
                  height: MediaQuery.of(context).size.width - 60,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: destinationsList.length,
                    itemBuilder: (ctx, i) {
                      return GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) => DetailsScreen(id: i),
                          ),
                        ),
                        //onTap: () => {},
                        child: Container(
                          width: MediaQuery.of(context).size.width - 60,
                          margin:
                              EdgeInsets.fromLTRB(0, 10, 10, 10),
                              //const EdgeInsets.symmetric(horizontal: 10.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: Stack(
                              children: <Widget>[
                                Positioned.fill(
                                  // child: Image.network(
                                  //   destinationsList[i].imageUrl,
                                  //   fit: BoxFit.cover,
                                  // ),
                                  child: new Image(image: AssetImage('assets/images/login.png')),
                                ),
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 9.0, vertical: 5.0),
                                    decoration: BoxDecoration(
                                      color: Color(0xff0078d4),
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(15),
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                            "${destinationsList[i].placeName}",
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white)),
                                        Text(
                                          "${destinationsList[i].date}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2
                                              .apply(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                      'Hotel Booking',
                      style: TextStyle(fontSize: 30),
                  ),
                ),
                
                Container(
                  padding: EdgeInsets.all(10),
                  height: MediaQuery.of(context).size.width - 60,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: destinationsList.length,
                    itemBuilder: (ctx, i) {
                      return GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) => DetailsScreen(id: i),
                          ),
                        ),
                        //onTap: () => {},
                        child: Container(
                          width: MediaQuery.of(context).size.width - 60,
                          margin:
                              EdgeInsets.fromLTRB(0, 10, 10, 10),
                              //const EdgeInsets.symmetric(horizontal: 10.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: Stack(
                              children: <Widget>[
                                Positioned.fill(
                                  // child: Image.network(
                                  //   destinationsList[i].imageUrl,
                                  //   fit: BoxFit.cover,
                                  // ),
                                  child: new Image(image: AssetImage('assets/images/logo.png')),
                                ),
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 9.0, vertical: 5.0),
                                    decoration: BoxDecoration(
                                      color: Color(0xff0078d4),
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(15),
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                            "${destinationsList[i].placeName}",
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white)),
                                        Text(
                                          "${destinationsList[i].date}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2
                                              .apply(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              
              ],
            )
        ),

      );
  
  }
}