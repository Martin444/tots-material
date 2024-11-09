import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final styleGlobalTots = GoogleFonts.dmSans(
  fontStyle: FontStyle.normal,
);

class TotsTextStyles {
  //Login
  static TextStyle loginTItle = styleGlobalTots.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    letterSpacing: 2.5,
  );
  //Inputs
  static TextStyle labelStyle = styleGlobalTots.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 2,
  );
}
