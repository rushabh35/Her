import 'package:flutter/material.dart';

Widget NoContentWidget(){
  return Center(
    child: Container(
      child: Text(
          "Add your first period to start tracking!",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16
        ),
      ),
    ),
  );
}