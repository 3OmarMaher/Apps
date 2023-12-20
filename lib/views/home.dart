
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:graduationproject/views/GFitPage.dart';
import 'package:graduationproject/views/current_state_page.dart';
import 'package:graduationproject/views/page_three.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  List<Widget> screens = [
    CurrentStatePage(state: 'null'),
    ActivityPage(),
    const GooglePage(),
     
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: const Color.fromARGB(255, 132, 255, 226),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: GNav(
              onTabChange: (value) {
                setState(() {
                  index = value;
                });
              },
              tabBorderRadius: 15,
              tabActiveBorder: Border.all(
                  color: Colors.black, width: 1), // tab button border
              tabBorder: Border.all(
                  color: Colors.black, width: 1), // tab button border

              curve: Curves.easeOutExpo, // tab animation curves
              duration:
                  const Duration(milliseconds: 200), // tab animation duration
              gap: 8, // the tab button gap between icon and text
              color: Colors.black, // unselected icon color
              activeColor: Colors.white, // selected icon and text color
              iconSize: 28, // tab button icon size
              tabBackgroundColor: Colors.black
                  .withOpacity(0.1), // selected tab background color
              padding: const EdgeInsets.symmetric(
                  horizontal: 20, vertical: 5), // navigation bar padding
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.search,
                  text: 'Search',
                ),
                GButton(
                  icon: Icons.list,
                  text: 'Activity',
                ),
                GButton(
                  icon: Icons.person,
                  text: 'Profile',
                )
              ]),
        ),
      ),
      body: screens[index],
    );
  }
}
