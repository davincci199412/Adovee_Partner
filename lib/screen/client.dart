import 'package:adovee_partner/global.dart';
import 'package:adovee_partner/screen/createclient.dart';
import 'package:adovee_partner/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


class ClientPage extends StatefulWidget {
  @override
  _ClientPageState createState() => _ClientPageState();
}
 
class _ClientPageState extends State<ClientPage> {
  TextEditingController _searchController = TextEditingController();
  
  Widget searchBox()
  {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          labelText: "Search",
          hintText: "Search by Reference or Client",
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
    );   
  }
  Widget clientList(BuildContext context)
  {
    List<Widget> list = new List<Widget>();
    list.add(searchBox());
    if(employees != null)
    {
      for(var i = 0; i < employees.length; i++){
        list.add(titleContentButton(context, employees[i]['firstName'] + ' ' + employees[i]['lastName'], 'lexy0127@outlook.com', 'client', 0));
      }
    }
    
    return new ListView(children: list);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
            iconTheme: IconThemeData(
              color: Color(0xff0078d4),
            ),
            backgroundColor: Colors.white,
            title: Text(
              "Client",
              style: TextStyle(color: Color(0xff0078d4)),
            ),
          )
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: clientList(context),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CreateClientPage()),
            );

          },
          tooltip: 'Create client',
          ),
      ), 
      onWillPop: () async {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Home(current: 1)),
        );

        return false;
      },
      
    );
  }
}