import 'package:flutter/material.dart';

Widget LoadingWidget(){
  return Center(
    child: Container(
      child: CircularProgressIndicator(
        color: Colors.redAccent[100],
      ),
    ),
  );
}