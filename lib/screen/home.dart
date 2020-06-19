import 'package:adovee/screen/logindetail.dart';
import 'package:flutter/material.dart';
import 'package:adovee/screen/dashboard.dart';
import 'package:adovee/screen/profile.dart';

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
        child = Dashboard();
        break;

      case 1:
        child = LoginDetailPage();
        break;

      case 2:
        child = Profile();
        break;
    }
    //return child;

    return Scaffold(
        body: SizedBox.expand(child: child),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Padding(padding: EdgeInsets.all(0)),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              title: Padding(padding: EdgeInsets.all(0)),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_box),
              title: Padding(padding: EdgeInsets.all(0)),
            ),
          ],
          currentIndex: _currentIndex,
          selectedItemColor: Colors.amber[800],
          onTap:(newIndex) => setState((){_currentIndex = newIndex;}),
        ),
      );
    }
}