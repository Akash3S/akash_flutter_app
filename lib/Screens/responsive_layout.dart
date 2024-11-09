import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget{
  Widget mobile;
  Widget desktop;

  ResponsiveLayout(
      {required this.mobile, required this.desktop})
      :super();
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
    if (constraints.maxWidth < 600) {
      return mobile;
    }
    else if (constraints.maxWidth < 1100) {
     return desktop;
    }
    else {
      return desktop;
    }
  });
  }

}