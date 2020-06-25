import 'package:adovee_partner/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class InvoicePage extends StatefulWidget {
  @override
  _InvoicePageState createState() => _InvoicePageState();
}
 
class _InvoicePageState extends State<InvoicePage> {
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
              "Invoice",
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
                
              ],
            )
        ),

      ), 
      onWillPop: () async {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Home(current: 1, )),
        );

        return false;
      },
      
    );
  }
}