import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

InputDecoration kTextFieldDecor =  InputDecoration(
  filled: true,
  fillColor: Colors.transparent,
   hintStyle: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: const Color(0xFFD5AC94)
            ),
  border: UnderlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
  ),
  enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Color(0xFFE9D2C2), width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
  ),
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(color:Color(0xFFE9D2C2), width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(15.0)),
  ),
);
