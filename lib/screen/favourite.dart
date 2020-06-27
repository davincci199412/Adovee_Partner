import 'package:flutter/material.dart';


class FavouritePage extends StatefulWidget {
  @override
  _FavouritePageState createState() => _FavouritePageState();
}
 
class _FavouritePageState extends State<FavouritePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
            iconTheme: IconThemeData(
              color: Color(0xff0078d4),
            ),
            backgroundColor: Colors.white,
            title: Text(
              "My Favourite",
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
                  child: Text(
                      'Discover',
                      style: TextStyle(fontSize: 30),
                  ),
                ),

                Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                      'Book what you love'
                  ),
                ),

                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name',
                    ),
                  ),
                ),
                
                Container(
                  height: 400,
                    padding: EdgeInsets.all(10),
                    child: GridView.count(
                      crossAxisCount: 2,
                      children: List.generate(4, (index) {
                        return Center(
                          child: Text(
                            'Item $index',
                          ),
                        );
                      }),
                    ),
                 ),
              ],
            )
        ),

      );
  
  }
}