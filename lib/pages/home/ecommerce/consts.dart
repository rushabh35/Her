import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'models/cart_model.dart';
import 'models/shoes_model.dart';


final TextStyle style = GoogleFonts.lato(
    fontSize: 30, color: Colors.white, fontWeight: FontWeight.w700);
const Color bleu = Color(0xFF148BFF);
const Color red = Color(0xFFC3011B);
const Color white = Color(0xFFDCDBEB);

List<ShoesModel> periodslist = [
  ShoesModel(
      name: 'Heat Patch',
      img: 'assets/images/heat-patch (2).png',
      company: 'NUE',
      price: 250,
      isselected: false,
      color: red),
  ShoesModel(
      name: 'Sanitary Pads',
      img: 'assets/images/napkins.png',
      company: 'Whisper',
      price: 103,
      isselected: false,
      color: Colors.amber.shade700),
  ShoesModel(
      name: 'Menstrual Cups',
      img: 'assets/images/cups.png',
      company: 'NUE',
      price: 100,
      isselected: false,
      color: bleu),
];

List<ShoesModel> medicationslist = [
  ShoesModel(
      name: 'Oziva Protein',
      img: 'assets/images/medications3.png',
      company: 'Oziva',
      price: 599,
      isselected: false,
      color: Colors.amber.shade700),
  ShoesModel(
      name: 'Vedvadhi',
      img: 'assets/images/medications1.png',
      company: 'Maharatna',
      price: 350,
      isselected: false,
      color: Colors.teal),
  ShoesModel(
      name: 'PMS Gummy Vitamins',
      img: 'assets/images/medications2.png',
      company: 'Azani',
      price: 109,
      isselected: false,
      color: bleu),
];



List<ShoesModel> allshoes = periodslist + medicationslist ;

// List sizes = [40, 41, 42, 43, 44];

List<CartModel> boughtitems = [];
List<ShoesModel> favouriteitems = [];

double total = 0.00;
