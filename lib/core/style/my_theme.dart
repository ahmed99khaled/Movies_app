import 'package:flutter/material.dart';

class MyTheme{
  static const Color primary=Color(0xFF121312);
  static const Color lightBlack=Color(0xFF514F4F);
  static const Color lightBlack2=Color(0xFF707070);
  static const Color lightBlack3=Color(0xFF1D1E1D);
  static const Color gold=Color(0xFFFFBB3B);
  static ThemeData theme=ThemeData(
    appBarTheme: AppBarTheme(
      color: lightBlack,
    ),
    scaffoldBackgroundColor:Colors.transparent,
    bottomNavigationBarTheme:BottomNavigationBarThemeData(
       showSelectedLabels:true,
       showUnselectedLabels:true,
       selectedIconTheme:IconThemeData(
         color:gold,
         size:28
       ),
       unselectedIconTheme:IconThemeData(
           color:Colors.white,
       ),
       selectedLabelStyle:TextStyle(
         color:gold,
       ),
       unselectedLabelStyle:TextStyle(
         color:Colors.white,
       ),
       selectedItemColor:gold,
       unselectedItemColor:Colors.white
    ),
  );
}