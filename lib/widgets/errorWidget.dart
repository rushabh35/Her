import 'package:flutter/material.dart';

Widget CustomErrorWidget(){
  return Center(
    child: Container(
      child: Text(
        "Something seems to have gone wrong",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.white,
            fontSize: 16
        ),
      ),
    ),
  );
}