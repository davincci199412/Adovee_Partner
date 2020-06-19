import 'package:adovee/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:adovee/global.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}
 
class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();
  TextEditingController _regionController = TextEditingController();
  
  List wonders = [
    Place(
        imageUrl:
            "https://d36tnp772eyphs.cloudfront.net/blogs/1/2018/02/Taj-Mahal.jpg",
        name: "Taj Mahal",
        country: "India"),
    Place(
        imageUrl:
            "https://d36tnp772eyphs.cloudfront.net/blogs/1/2018/02/Christ-the-Redeemer.jpg",
        name: "Christ the Redeemer",
        country: "Brazil"),
    Place(
        imageUrl:
            "https://d36tnp772eyphs.cloudfront.net/blogs/1/2016/03/petra-jordan9.jpg",
        name: "Petra",
        country: "Jordan"),
    Place(
        imageUrl:
            "https://d36tnp772eyphs.cloudfront.net/blogs/1/2018/02/Great-Wall-of-China-view.jpg",
        name: "The Great Wall of China",
        country: "China"),
    Place(
        imageUrl:
            "https://d36tnp772eyphs.cloudfront.net/blogs/1/2018/02/View-of-the-Colosseum.jpg",
        name: "The Colosseum",
        country: "Rome"),
    Place(
        imageUrl:
            "https://d36tnp772eyphs.cloudfront.net/blogs/1/2018/02/Machu-Picchu-around-sunset.jpg",
        name: "Machu Picchu",
        country: "Peru"),
    Place(
        imageUrl:
            "https://d36tnp772eyphs.cloudfront.net/blogs/1/2018/02/Chichen-Itza-at-night.jpg",
        name: "Chichén Itzá",
        country: "Mexico"),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0), // here the desired height
          child: AppBar(
            iconTheme: IconThemeData(
              color: Color(0xff0078d4), //change your color here
            ),
            backgroundColor: Colors.white,
            title: Text(
              "Search",
              style: TextStyle(color: Color(0xff0078d4)),
            ),
          )
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      labelText: "Search",
                      hintText: "Search",
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
                  ),
                ),

                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: _regionController,
                    decoration: InputDecoration(
                      labelText: "Region",
                      hintText: "Region",
                      prefixIcon: Icon(Icons.lightbulb_outline),
                      suffixIcon: _regionController.text.isEmpty
                          ? null
                          : InkWell(
                              onTap: () => _regionController.clear(),
                              child: Icon(Icons.clear),
                            ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                ),

                Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                      'Venues',
                      style: TextStyle(fontSize: 30),
                  ),
                ),
                
                Container(
                  padding: EdgeInsets.all(10),
                  height: MediaQuery.of(context).size.width - 60,
                  child: ListView.builder(
                    itemCount: wonders.length,
                    itemBuilder: (context, index) {
                        return ListTile(leading: Image.network(wonders[index].imageUrl), title: Text(wonders[index].name), subtitle: Text(wonders[index].country),);
                    },
                  ),
                ),
              
              ],
            )
        ),

      ), 
      onWillPop: () async {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Home(current: 0)),
        );

        return false;
      },
      
    );
  
  }
}