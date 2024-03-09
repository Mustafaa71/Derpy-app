// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class TextStyleManager {
//   static final primaryTextStyle = GoogleFonts.chakraPetch(
//     fontSize: 25.0,
//     fontWeight: FontWeight.bold,
//   );

//   static final secondryTextStyle = GoogleFonts.chakraPetch(
//     fontSize: 15,
//     fontWeight: FontWeight.normal,
//     color: const Color(0xFF50ACA8),
//   );
// }

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyleManager extends TextStyle {
  final Color kColor;
  final FontWeight kFontWeight;
  final double kFontSize;

  TextStyleManager({
    required this.kColor,
    required this.kFontSize,
    required this.kFontWeight,
  }) : super(
          color: kColor,
          fontSize: kFontSize,
          fontWeight: kFontWeight,
          fontFamily: GoogleFonts.chakraPetch().fontFamily,
        );
}
