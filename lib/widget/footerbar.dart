import 'package:flutter/material.dart';

class FooterBar extends StatefulWidget {

  final int current;
  FooterBar({
    Key key,
    @required this.current
  }) : super(key: key);
  @override
  _FooterBarState createState() => _FooterBarState();
}

class _FooterBarState extends State<FooterBar> {
  int _currentIndex;
  @override
  Widget build(BuildContext context) {
    return new Theme(
      data: Theme.of(context).copyWith(
          // sets the background color of the `BottomNavigationBar`
          canvasColor: Color(0xff2446a6),
          // sets the active color of the `BottomNavigationBar` if `Brightness` is light
          primaryColor: Colors.black,
          textTheme: Theme
              .of(context)
              .textTheme
              .copyWith(caption: new TextStyle(color: Color(0xffffffff)))), // sets the inactive color of the `BottomNavigationBar`
      child: new BottomNavigationBar(

        currentIndex: _currentIndex,
        onTap:(newIndex) => setState((){_currentIndex = newIndex;}),
        type: BottomNavigationBarType.fixed,
        items: [
          new BottomNavigationBarItem(
            icon: new Icon(Icons.adjust),
            title: Padding(padding: EdgeInsets.all(0)),
          ),
          
          new BottomNavigationBarItem(
            icon: new Icon(Icons.calendar_today),
            title: Padding(padding: EdgeInsets.all(0)),
          ),

          new BottomNavigationBarItem(
            icon: new Icon(Icons.account_box),
            title: Padding(padding: EdgeInsets.all(0)),
          )
        ],
      ),
    );
  }
}