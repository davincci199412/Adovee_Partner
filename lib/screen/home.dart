import 'package:adovee_partner/screen/schedule.dart';
import 'package:adovee_partner/screen/client.dart';
import 'package:adovee_partner/screen/notification.dart';
import 'package:adovee_partner/screen/sales.dart';
import 'package:flutter/material.dart';
import 'package:adovee_partner/screen/profile.dart';
import 'package:adovee_partner/global.dart';

class Home extends StatefulWidget {
  
  final int current;
  Home({
    Key key,
    @required this.current
  }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}
 
class _HomeState extends State<Home> { 
  int _currentIndex = 0;
  int currentWidget = 0;
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget child = Container();
    
    if (currentWidget != widget.current)
    {
      currentWidget = widget.current;
      _currentIndex = widget.current;
    }

    if (currentIndex != _currentIndex)
    {
      currentIndex = _currentIndex;
    }

    switch(_currentIndex) {
      case 0:
        child = SchedulePage();
        break;

      case 1:
        child = SalesPage();
        break;

      case 2:
        child = ClientPage();
        break;

      case 3:
        child = NotificationPage();
        break;

      case 4:
        child = Profile();
        break;
    }
    //return child;

    return Scaffold(
        body: SizedBox.expand(child: child),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              title: Padding(padding: EdgeInsets.all(0)),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.note),
              title: Padding(padding: EdgeInsets.all(0)),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Padding(padding: EdgeInsets.all(0)),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications_none),
              title: Padding(padding: EdgeInsets.all(0)),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.more_vert),
              title: Padding(padding: EdgeInsets.all(0)),
            ),
          ],
          currentIndex: _currentIndex,
          selectedItemColor: ThemeColors.lightBlue,
          unselectedItemColor: Colors.black38,
          onTap:(newIndex) => setState((){_currentIndex = newIndex;}),
        ),
      );
    }
}