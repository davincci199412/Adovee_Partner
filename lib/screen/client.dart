import 'package:adovee_partner/screen/clientdetail.dart';
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
  
  Widget appointmentsTable()
  {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: DataTable(
        columns: [
          DataColumn(label: Text('Item Type')),
          DataColumn(label: Text('Sales'), numeric: true),
          DataColumn(label: Text('Refund'), numeric: true),
          DataColumn(label: Text('Total')),
        ], 
        rows: [
          DataRow(cells: [
           DataCell(Text('Service')), 
           DataCell(Text('0')), 
           DataCell(Text('0')), 
           DataCell(Text('USD 0.00')), 
          ]),
          DataRow(cells: [
           DataCell(Text('Products')), 
           DataCell(Text('0')), 
           DataCell(Text('0')), 
           DataCell(Text('USD 0.00')), 
          ]),
          DataRow(cells: [
           DataCell(Text('Vouchers')), 
           DataCell(Text('0')), 
           DataCell(Text('0')), 
           DataCell(Text('USD 0.00')), 
          ]),
          DataRow(cells: [
           DataCell(Text('Late cancellation fees')), 
           DataCell(Text('0')), 
           DataCell(Text('0')), 
           DataCell(Text('USD 0.00')), 
          ]),
          DataRow(cells: [
           DataCell(Text('No show fees')), 
           DataCell(Text('0')), 
           DataCell(Text('0')), 
           DataCell(Text('USD 0.00')), 
          ]),
          DataRow(cells: [
           DataCell(Text('Total Sales')), 
           DataCell(Text('0')), 
           DataCell(Text('0')), 
           DataCell(Text('USD 0.00')), 
          ]),
          
        ]
        )
    );
  }

  Widget clientButton(Icon icon, String strTitle, String strEmail, int buttonIndex)
  {
    return Container(      
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      height: MediaQuery.of(context).size.height / 8,
      child: new RaisedButton(
        color: Colors.white,
        onPressed: () {
          switch (buttonIndex) {
            case 0:    
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ClientDetailPage(id: 1)),
              );   
              break;
            // case 1:    
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => FavouritePage()),
            //   );   
            //   break;
            default:
          }
        },
        padding: EdgeInsets.all(8.0),
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
                          Text(strTitle,
                            style: Theme.of(context).textTheme.headline6.apply(
                              color: Colors.black,
                            ),
                          ),
                          Text(strEmail),
                        ],
                      ),
                    ),
                  ],
                ),
                // Column(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: <Widget>[
                //     Text('From'),
                //     Text('20 USD'),
                //   ],
                // ),
              
              ],
            ), 
            
          ), 
              
        )
      ),
    );
  } 


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
              "Client",
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
                ),
                
                clientButton(Icon(Icons.search), 'Lexy', 'lexy0127@outlook.com', 0),
              ],
            )
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