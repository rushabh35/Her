import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../../models/user.dart';
import 'AddInfo.dart';
import 'Calendar.dart';
import 'History.dart';
import 'Overview.dart';
import 'settings.dart';
// import 'package:her2/pages/ui/HomePage.dart';
// import 'package:her2/pages/blogs.dart';
import 'package:line_icons/line_icons.dart';

class Example extends StatefulWidget {

  User? currentUser;
  Example({this.currentUser});
  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {

  int _selectedIndex = 0;

  late List screens = [];

  @override
  void initState() {
    screens = [
      Overview(title: '',),
      AddInfo(),
      Calendar(),
      History(),
      // Blog(),
      // HomePage(title: "Her")
    ];
    super.initState();
  }

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
  //     appBar: AppBar(
  //       elevation: 20,
  //       backgroundColor: Colors.black,
  //       title: const Text('HER'),
  //       actions: <Widget>[
  //   IconButton(
  //     icon: Icon(
  //       Icons.settings,
  //       color: Colors.white,
  //     ),
  //     onPressed: () {
  //        Navigator.push(
  //   context,
  //   MaterialPageRoute(builder: (context) => Settings()),
  // );
  //     },
  //   )
  // ],
  //     ),
      body: screens[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 0, 0, 0),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              // rippleColor: Color.fromARGB(255, 0, 183, 255),
              // hoverColor: Color.fromARGB(255, 38, 141, 132),
              gap: 8,
              activeColor: Color.fromARGB(255, 0, 0, 0),
              iconSize: 24,
              
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Color.fromARGB(255, 143, 143, 143),
              color: Color.fromARGB(255, 153, 153, 153),
              tabs: [
                GButton(
                  backgroundColor: Color.fromARGB(255, 236, 153, 236),
                  iconActiveColor: Color.fromARGB(255, 155, 21, 155),
                  textColor: Color.fromARGB(255, 155, 21, 155),
                  icon: LineIcons.book,
                  text: 'Overview',
                  // onPressed: () {
                  //   Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>Overview()));
                  // },
                ),
                GButton(
                  // backgroundColor: Colo,
                  backgroundColor: Color.fromARGB(255, 147, 235, 96),
                  iconActiveColor: Color.fromARGB(255, 21, 156, 3),
                  textColor: Color.fromARGB(255, 21, 156,3),
                  icon: LineIcons.plusCircle,
                  // onPressed: () {
                  //   Navigator.push(context, MaterialPageRoute(builder: (context)=> AddInfo()));
                  // },
                  text: 'Add Info',
                ),
                GButton(
                  backgroundColor: Color.fromARGB(255, 219, 231, 87),
                  iconActiveColor: Color.fromARGB(255, 110, 122, 2),
                  textColor: Color.fromARGB(255, 133, 124, 6),
                  icon: LineIcons.calendar,
                  text: 'Calendar',
                  // onPressed: () {
                  //   Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>Overview()));
                  // },
                ),
                GButton(
                  iconActiveColor:Color.fromARGB(255, 2, 76, 173), 
                  textColor: Color.fromARGB(255, 2, 76, 173),
                  backgroundColor: Color.fromARGB(255, 3, 233, 250),
                  icon: LineIcons.history,
                  // onPressed: () {
                  //   Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>Overview()));
                  // },
                  text: 'History',
                ),
                // GButton(
                //   iconActiveColor:Color.fromARGB(255, 243, 179, 2), 
                //   textColor: Color.fromARGB(255, 243, 179, 2),
                //   backgroundColor: Color.fromARGB(255, 252, 248, 2),
                //   icon: LineIcons.book,
                //   // onPressed: () {
                //   //   Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>Overview()));
                //   // },
                //   // text: 'Blog',
                // ),
              ],
              // selectedIndex: _selectedIndex,
              // onTabChange: (index) {
              //   setState(() {
              //     _selectedIndex = index;
              //   });
              // },
               onTabChange: (index) => setState(() => this._selectedIndex = index),
          ),
        ),
      ),
    ),
    );
  }
}