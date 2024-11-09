import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTypography{
  static TextTheme baseTextTheme(BuildContext context){
  double screenWidth = MediaQuery.of(context).size.width;
//define a factor to  scale size based on screen width
double scaleFactor = screenWidth < 600 ? 0.8: //mobile
                     screenWidth < 1100 ? 1.0: //tablet
                         1.2;  //desktop
//define the best text theme with responsive size
return TextTheme(
      displayLarge : GoogleFonts.quicksand (fontSize:57 * scaleFactor,fontWeight: FontWeight.bold),
  displayMedium : GoogleFonts.quicksand (fontSize:45 * scaleFactor,fontWeight: FontWeight.bold),
  displaySmall : GoogleFonts.quicksand (fontSize:36 * scaleFactor,fontWeight: FontWeight.bold),
  headlineLarge: GoogleFonts.quicksand (fontSize:32 * scaleFactor,fontWeight: FontWeight.w600),
  headlineMedium : GoogleFonts.quicksand (fontSize:28 * scaleFactor,fontWeight: FontWeight.w600),
  headlineSmall: GoogleFonts.quicksand (fontSize:24 * scaleFactor,fontWeight: FontWeight.w600),
  titleLarge : GoogleFonts.quicksand (fontSize:22 * scaleFactor,fontWeight: FontWeight.w500),
  titleMedium : GoogleFonts.quicksand (fontSize:16 * scaleFactor,fontWeight: FontWeight.w500),
  titleSmall : GoogleFonts.quicksand (fontSize:14* scaleFactor,fontWeight: FontWeight.w500),
  bodyLarge : GoogleFonts.quicksand (fontSize:16* scaleFactor,fontWeight: FontWeight.normal),
  bodyMedium : GoogleFonts.quicksand (fontSize:14 * scaleFactor,fontWeight: FontWeight.normal),
  bodySmall : GoogleFonts.quicksand (fontSize:12* scaleFactor,fontWeight: FontWeight.normal),
  labelLarge : GoogleFonts.quicksand (fontSize:14 * scaleFactor,fontWeight: FontWeight.w500),
  labelMedium: GoogleFonts.quicksand (fontSize:12 * scaleFactor,fontWeight: FontWeight.w500),
  labelSmall: GoogleFonts.quicksand (fontSize:11* scaleFactor,fontWeight: FontWeight.w500),


      );

}
static TextTheme lightTextTheme(BuildContext context){
    return baseTextTheme(context).apply(
      bodyColor: Colors.white,
      displayColor: Colors.white
    );
}
  static TextTheme darkTextTheme(BuildContext context){
    return baseTextTheme(context).apply(
        bodyColor: Colors.white,
        displayColor: Colors.white
    );
  }

}