import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:se7ety/Core/Utils/Colors.dart';

TextStyle getHeadLineTextStyle(
    {double fontsize = 18,
    FontWeight = FontWeight.bold,
    color = AppColors.primary}) {
  return TextStyle(
      fontFamily: GoogleFonts.cairo().fontFamily,
      fontSize: fontsize,
      fontWeight: FontWeight,
      color: color);
}

TextStyle getBodyTextStyle(
    {double fontsize = 14,
    FontWeight = FontWeight.normal,
    color = AppColors.black}) {
  return TextStyle(
      fontFamily: GoogleFonts.cairo().fontFamily,
      fontSize: fontsize,
      fontWeight: FontWeight,
      color: color);
}

TextStyle getSmallTextStyle(
    {double fontsize = 12,
    FontWeight = FontWeight.normal,
    color = AppColors.black}) {
  return TextStyle(
      fontFamily: GoogleFonts.cairo().fontFamily,
      fontSize: fontsize,
      fontWeight: FontWeight,
      color: color);
}
