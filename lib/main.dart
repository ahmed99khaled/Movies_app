import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/provider/configProvider.dart';
import 'package:movies_app/view/home/browseCategoryScreen/movie_discover_screen.dart';
import 'package:movies_app/view/home/home_screen.dart';
import 'package:movies_app/core/style/my_theme.dart';
import 'package:movies_app/splash_screen.dart';
import 'package:movies_app/view/home/movieDetailsScreen/movie_details.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';


void main()async{
   await WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(
    create:(context) =>ConfigProvider(),
      child: MyApp()));
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner:false,
       theme:MyTheme.theme,
       routes:{
         SplashScreen.routeName:(context) => SplashScreen(),
         HomeScreen.routeName:(context) => HomeScreen(),
         MovieDetailsScreen.routeName:(context) => MovieDetailsScreen(),
         MovieDiscoverScreen.routeName:(context) => MovieDiscoverScreen(),
       },
      initialRoute:SplashScreen.routeName,
    );
  }

}