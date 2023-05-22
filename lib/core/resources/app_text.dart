import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_books/core/resources/app_colors.dart';

class Texts {
  static Text text1({required String string, Color? color}) => Text(string,
      style: GoogleFonts.arimo(
          textStyle: TextStyle(color: color ?? AppColor.cello, fontSize: 30)));

  static Text text2({required String string, Color? color}) => Text(string,
      style: GoogleFonts.arimo(
          textStyle: TextStyle(color: color ?? AppColor.cello, fontSize: 20)));
}
