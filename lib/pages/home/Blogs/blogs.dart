import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'catalog.dart';
import 'item_widgets.dart';

class Blogs extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: CatalogModel.items.length,
            itemBuilder: (context, index) {
              return ItemWidget(item: CatalogModel.items[index]);
            }),
      );
    
  }
}