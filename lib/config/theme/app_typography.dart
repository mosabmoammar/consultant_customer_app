import 'package:flutter/material.dart';

/*
NAME	          SIZE  HEIGHT  WEIGHT	SPACING	
displayLarge	  57.0	64.0	  regular	-0.25	
displayMedium	  45.0	52.0	  regular	0.0	
displaySmall	  36.0	44.0	  regular	0.0	
headlineLarge	  32.0	40.0	  regular	0.0	
headlineMedium  28.0	36.0	  regular	0.0	
headlineSmall	  24.0	32.0	  regular	0.0	
titleLarge	    22.0	28.0	  regular	0.0	
titleMedium	    16.0	24.0	  medium	0.15	
titleSmall	    14.0	20.0	  medium	0.1	
bodyLarge	      16.0	24.0	  regular	0.5	
bodyMedium	    14.0	20.0	  regular	0.25	
bodySmall	      12.0	16.0	  regular	0.4	
labelLarge	    14.0	20.0	  medium	0.1	
labelMedium	    12.0	16.0	  medium	0.5	
labelSmall	    11.0	16.0	  medium	0.5
*/
abstract class AppTypography {
  static const String fontFamily = 'Outfit';

  static TextTheme get textTheme {
    return const TextTheme(
      // Display
      displayLarge: TextStyle(fontFamily: fontFamily),
      displayMedium: TextStyle(fontFamily: fontFamily),
      displaySmall: TextStyle(fontFamily: fontFamily),

      // Headline
      headlineLarge: TextStyle(
        fontFamily: fontFamily,
        fontWeight: .w600,
        fontSize: 24.0,
      ),
      headlineMedium: TextStyle(
        fontFamily: fontFamily,
        fontWeight: .w500,
        fontSize: 18.0,
      ),
      headlineSmall: TextStyle(fontFamily: fontFamily),

      // Title
      titleLarge: TextStyle(fontFamily: fontFamily),
      titleMedium: TextStyle(
        fontFamily: fontFamily,
        fontWeight: .w500,
        fontSize: 18.0,
        height: 1.26,
      ),
      titleSmall: TextStyle(
        fontFamily: fontFamily,
        fontWeight: .w400,
        fontSize: 16.0,
      ),

      // Body
      bodyLarge: TextStyle(
        fontFamily: fontFamily,
        fontWeight: .w500,
        fontSize: 16.0,
      ),
      bodyMedium: TextStyle(
        fontFamily: fontFamily,
        fontWeight: .w400,
        fontSize: 14,
      ),
      bodySmall: TextStyle(
        fontFamily: fontFamily,
        fontWeight: .w300,
        fontSize: 16.0,
      ),

      // Label
      labelLarge: TextStyle(
        fontFamily: fontFamily,
        fontWeight: .w500,
        fontSize: 14.0,
        height: 1.26,
      ),
      labelMedium: TextStyle(
        fontFamily: fontFamily,
        fontWeight: .w400,
        fontSize: 14.0,
        height: 1.26,
      ),
      labelSmall: TextStyle(
        fontFamily: fontFamily,
        fontWeight: .w300,
        fontSize: 16.0,
      ),
    );
  }
}
