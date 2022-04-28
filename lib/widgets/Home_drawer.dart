
import 'package:flutter/material.dart';
import '../pages/home/Home.dart';
import '../pages/home/settings.dart';

class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}

class HomePage extends StatefulWidget {
  final drawerItems = [
    new DrawerItem("Home", Icons.home),
    new DrawerItem("Blogs", Icons.book),
    new DrawerItem("E-Commerce", Icons.shopping_cart)
  ];

  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int _selectedDrawerIndex = 0;

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new Example();
      // case 1:
      //   return new Blog();
      // case 2:
      //   return new AboutusFragment();

      default:
        return new Text("Error");
    }
  }
  
  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> drawerOptions = [];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(
        new ListTile(
          leading: new Icon(d.icon),
          title: new Text(d.title),
          selected: i == _selectedDrawerIndex,
          onTap: () => _onSelectItem(i),
        )
      );
    }

    return new Scaffold(
      appBar: AppBar(
        elevation: 20,
        backgroundColor: Colors.black,
        title: const Text('HER'),
        actions: <Widget>[
    IconButton(
      icon: Icon(
        Icons.settings,
        color: Colors.white,
      ),
      onPressed: () {
         Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Settings()),
  );
      },
    ) 
  ],
      ),
        drawer: new Drawer(
        child: Container(
          // color: Color.fromARGB(255, 62, 162, 175),
          child: new Column(
            
            children: <Widget>[
              new UserAccountsDrawerHeader(
                    decoration: BoxDecoration(
                       color: Color(0xFF333A47),
                    ),              
                  accountName: new Text("Michel Clerk"), accountEmail: new Text("Michel@gmail.com"),currentAccountPicture: CircleAvatar(
                backgroundColor:
                Theme.of(context).platform == TargetPlatform.iOS
                    ? Color.fromARGB(255, 0, 140, 255)
                    : Colors.black,
                child: Text(
                  "M",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),),
              new Column(children: drawerOptions),
            ],
          ),
        ),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
    );
  }
}