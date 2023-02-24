import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movies_app/view/home/home_screen.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = 'splash screen';

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.pushNamed(context, HomeScreen.routeName);
    });
    return Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          color: Color(0xFF121312),
        ),
        Center(child: Image.asset('assets/images/movies.png')),
      ],
    );
  }
}
//Color(0xFF121312)
