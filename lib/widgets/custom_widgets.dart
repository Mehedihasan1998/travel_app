import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

myStyle(double fs, [Color ?clr, FontWeight ?fw]){
  return GoogleFonts.nunito(
    color: clr,
    fontSize: fs,
    fontWeight: fw,
  );
}

const Color buttonColor = Colors.blue;
const Color buttonTextColor = Colors.white;

const customInputDecoration = InputDecoration(
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(30)),
    borderSide: BorderSide(
      color: Colors.blue,
    ),
  ),

  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(30)),
    borderSide: BorderSide(
      color: Colors.blue,
    ),
  ),
);

