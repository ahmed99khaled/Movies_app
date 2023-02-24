import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/view/home/browseCategoryScreen/browse_tab.dart';
import 'package:movies_app/view/home/home_tab.dart';
import 'package:movies_app/core/style/my_theme.dart';
import 'package:movies_app/view/home/SearchScreen/search_tab.dart';
import 'package:movies_app/view/home/watch_list/watch_list_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.primary,
      bottomNavigationBar:BottomNavigationBar(
        currentIndex:selectedIndex,
        onTap:(pressedIndex){
          setState(() {
            selectedIndex=pressedIndex;
          });
        },
        items:const [
          BottomNavigationBarItem(
              backgroundColor:MyTheme.lightBlack3,
              icon:ImageIcon(AssetImage('assets/images/home_icon.png')),
              label:'HOME'
          ),
          BottomNavigationBarItem(
              backgroundColor:MyTheme.lightBlack,
              icon:ImageIcon(AssetImage('assets/images/search_icon.png')),
              label:'SEARCH'
          ),
          BottomNavigationBarItem(
              backgroundColor:MyTheme.lightBlack,
              icon:ImageIcon(AssetImage('assets/images/browes_icon.png')),
              label:'BROWSE'
          ),
          BottomNavigationBarItem(
              backgroundColor:MyTheme.lightBlack,
              icon:ImageIcon(AssetImage('assets/images/watch_list.png')),
              label:'WATCHLIST'
          ),
        ],
      ),
      body:tabs[selectedIndex],
    );
  }
  List<Widget> tabs=[HomeTab(),SearchTab(),BrowseTab(),WatchListTab()];
}
