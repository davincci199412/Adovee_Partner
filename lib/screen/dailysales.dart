import 'package:flutter/material.dart';

class DailySalesPage extends StatefulWidget {
  @override
  _DailySalesPageState createState() => _DailySalesPageState();
}
 
class _DailySalesPageState extends State<DailySalesPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
            iconTheme: IconThemeData(
              color: Color(0xff0078d4),
            ),
            backgroundColor: Colors.white,
            title: Text(
              "Sales",
              style: TextStyle(color: Color(0xff0078d4)),
            ),
          )
        ),
      body: ListView(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(50),
            child: new Image(image: AssetImage('assets/images/logo.png')),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              'Transaction Summary',
              style: Theme.of(context).textTheme.headline6.apply(
                      color: Colors.black,
                    ),
              ),
          ),
          
          transactionSummaryTable()
          ],
      ),
    );
  }
  Widget transactionSummaryTable()
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

  Widget salesButton(Icon icon, String strTitle, String strContent, int buttonIndex)
  {
    return Container(   
            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
            height: MediaQuery.of(context).size.height / 8,
            decoration: BoxDecoration(
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
                          icon,
                          SizedBox(
                            width: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.all(0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  strTitle,
                                  style: Theme.of(context).textTheme.headline6.apply(
                                    color: Colors.black,
                                  ),
                                ),
                                Container(
                                  constraints: new BoxConstraints(
                                    maxWidth: MediaQuery.of(context).size.width * 0.8
                                  ),
                                  child: Text(
                                    strContent,
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
                      
                    ],
                  ), 
                  
                ), 
                    
              )
          );
  } 
}