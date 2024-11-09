import 'package:akash_flutter_app/Screens/coman/typography.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

class AppTheme{
  ThemeData lightTheme (BuildContext context){
    //text theme using context
    final textTheme = AppTypography .lightTextTheme (context);


    return ThemeData(
      useMaterial3: true,
      colorScheme: AppColors.lightColorScheme,
      textTheme: textTheme,
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.8),
          borderSide: BorderSide(color: AppColors.lightColorScheme.primary),
        ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.8),
            borderSide: BorderSide(color: AppColors.lightColorScheme.primary),
          ),
          focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.8),
      borderSide: BorderSide(color: AppColors.lightColorScheme.secondary),
    ),
        hintStyle: textTheme.bodyMedium!.copyWith(color: Colors.grey),
        labelStyle: textTheme.titleMedium
      ),

        //Button theme

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.lightColorScheme.primary,
          foregroundColor: AppColors.lightColorScheme.onPrimary,
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0)
          )
        )
      ),


      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.lightColorScheme.onPrimary,
        ),
      ),

        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.lightColorScheme.onPrimary,
            side: BorderSide(color:AppColors.lightColorScheme.onPrimary ),
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0)
            )
          )
        )

    );
  }



  ThemeData darkTheme (BuildContext context){
    //text theme using context
    final textTheme = AppTypography .darkTextTheme (context);


    return ThemeData(
        useMaterial3: true,
        colorScheme: AppColors.lightColorScheme,
        textTheme: textTheme,
        inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.8),
              borderSide: BorderSide(color: AppColors.lightColorScheme.primary),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.8),
              borderSide: BorderSide(color: AppColors.lightColorScheme.primary),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.8),
              borderSide: BorderSide(color: AppColors.lightColorScheme.secondary),
            ),
            hintStyle: textTheme.bodyMedium!.copyWith(color: Colors.grey),
            labelStyle: textTheme.titleMedium
        ),

        //Button theme for dark mode

        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.darkColorScheme.primary,
                foregroundColor: AppColors.darkColorScheme.onPrimary,
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)
                ),
            ),
        ),


        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: AppColors.darkColorScheme.onPrimary,
          ),
        ),

        outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.darkColorScheme.onPrimary,
                side: BorderSide(color:AppColors.darkColorScheme.onPrimary ),
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)
                )
            )
        )

    );
  }
}