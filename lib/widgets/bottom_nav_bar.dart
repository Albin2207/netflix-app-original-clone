import 'package:flutter/material.dart';
import 'package:netflix_clone_app/screens/download_screen.dart';
import 'package:netflix_clone_app/screens/home_screen/home_screen.dart';

import 'package:netflix_clone_app/screens/new_hot_screens/new_hot_screen.dart';
import 'package:netflix_clone_app/screens/search_screen.dart';



class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        bottomNavigationBar: Container(
          color: Colors.black,
          height: 70,
          child: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.home),
                text: "Home",
              ),
              Tab(
                icon: Icon(Icons.search),
                text: "Search",
              ),
              Tab(
                icon: Icon(Icons.photo_library_outlined),
                text: "New & Hot",
              ),
              Tab(
                icon: Icon(Icons.arrow_downward_rounded),
                text:" Downloads",
              ),
            ],
            unselectedLabelColor: Color(0xFF999999),
            labelColor: Colors.white,
            indicatorColor: Colors.transparent,
          ),
        ),
        body: const TabBarView(
          children: [
            HomeScreen(),
            SearchScreen(),
            MoreScreen(),
            ScreenDownloads(),
          ],
        ),
      ),
    );
  }
}
