import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors{
  //based seed colors(Material3 will generate varients from this)
  static const Color seedPrimary = Color(0xFF80E27E);
  static const Color seedSecondry= Color(0xFF09141B);
  static const Color seedError = Color(0xFFB71C1C);



  //generate a light color scheme based on the seed colors
static ColorScheme lightColorScheme = ColorScheme .fromSeed(
    seedColor: seedPrimary,
  brightness: Brightness.light,
  error: seedError,
);
//generate a dark color scheme based on the seed colors

  static ColorScheme darkColorScheme = ColorScheme .fromSeed(
  seedColor: seedPrimary,
  brightness: Brightness.dark,
  error: seedError,
  );
}