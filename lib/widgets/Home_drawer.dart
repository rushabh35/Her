import 'package:flutter/material.dart';
import 'package:her2/services/database.dart';
import 'package:her2/services/sharedPrefServices.dart';
import 'package:her2/widgets/errorWidget.dart';
import 'package:her2/widgets/loadingWidget.dart';
import 'package:provider/provider.dart';
import '../models/user.dart';
import '../pages/home/Home.dart';
import '../pages/home/settings.dart';
import '../services/auth.dart';

class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}

class HomePage extends StatefulWidget {
  final drawerItems = [
    new DrawerItem("Home", Icons.home),
    new DrawerItem("Blogs", Icons.book),
    new DrawerItem("E-Commerce", Icons.shopping_cart),
    new DrawerItem("Signout", Icons.logout)
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
        return Example(currentUser: currentUser,);
        break;

      // case 1:
      //   return new Blog();
      // case 2:
      //   return new AboutusFragment();

      case 3:
        context.read<AuthenticationServices>().signOut();
        break;

      default:
        return new Text("Error");
    }
  }
  
  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }
  
  User? currentUser;
  DatabaseServices _databaseServices = DatabaseServices();

  @override
  Widget build(BuildContext context) {

    debugPrint("building Home drawer");

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

    return FutureBuilder(
      future: _databaseServices.getCurrentUser(),
      //future: getUserFromPrefs(),
      builder: (context, AsyncSnapshot snapshot) {
        if(snapshot.hasData){
          print("snapshot has data");
          currentUser = snapshot.data;
          print("home drawer current user: ${currentUser}");
          return Scaffold(
            appBar: AppBar(
              elevation: 20,
              backgroundColor: Colors.black,
              title: const Text('HER'),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(
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
            drawer: Drawer(
              child: Container(
                // color: Color.fromARGB(255, 62, 162, 175),
                child: Column(

                  children: <Widget>[
                    UserAccountsDrawerHeader(
                      decoration: const BoxDecoration(
                        color: Color(0xFF333A47),
                      ),
                      accountName: Text(currentUser!.name), accountEmail: Text(currentUser!.email),currentAccountPicture: CircleAvatar(
                      backgroundColor:
                      Theme.of(context).platform == TargetPlatform.iOS
                          ? Color.fromARGB(255, 0, 140, 255)
                          : Colors.black,
                      child: Text(
                        "${currentUser!.name[0]}".toUpperCase(),
                        style: TextStyle(fontSize: 40.0),
                      ),
                    ),),
                    Column(children: drawerOptions),
                  ],
                ),
              ),
            ),
            body: _getDrawerItemWidget(_selectedDrawerIndex),
          );
        } else if(snapshot.hasError){
          debugPrint("home drawer error: ${snapshot.error}");
          return CustomErrorWidget();
        } else{
          return LoadingWidget();
        }
      }
    );
  }
}