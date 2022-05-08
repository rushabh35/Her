import 'package:flutter/material.dart';
import 'catalog.dart';

class ItemWidget extends StatelessWidget {
  final Item item;
  const ItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
        child: Card(
          shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15.0),
  ),
          elevation: 0,
          color: Color.fromARGB(255, 225, 28, 28),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap:() {
                
              },
              child: ListTile(
                leading: Image.network(
                  item.image,
                  height: 90,
                  width: 90,
                ),
                title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: Text(item.name, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18))),
                ),
                subtitle: Center(child: Text(item.desc, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15))),
                // onTap: () {launcherUrl('https://stackoverflow.com/questions/64398770/flutter-automaticaly-open-atached-url-on-the-ontap-event-in-listtile');},
                // trailing: Text(
                //   "${item.price}",
                //   style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold, fontSize: 20),
                // ),
              ),
            ),
            ),
          ),
      );
  }
}