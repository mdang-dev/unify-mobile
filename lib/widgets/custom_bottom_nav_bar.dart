import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:unify/screens/home_screen.dart';

class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({super.key});

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  int _currentIndex = 0;
  final List<Widget> _screens = [HomeScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
          selectedItemColor: Colors.blueGrey,
          unselectedItemColor: const Color(0xFF526400),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  FluentSystemIcons.ic_fluent_home_regular,
                ),
                label: 'Home',
                activeIcon: Icon(
                  FluentSystemIcons.ic_fluent_home_filled,
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  FluentSystemIcons.ic_fluent_search_regular,
                ),
                label: 'Search',
                activeIcon: Icon(
                  FluentSystemIcons.ic_fluent_search_filled,
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  FluentSystemIcons.ic_fluent_add_circle_regular,
                ),
                label: 'Posts',
                activeIcon: Icon(
                  FluentSystemIcons.ic_fluent_add_circle_filled,
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  FluentSystemIcons.ic_fluent_video_clip_regular,
                ),
                label: 'Reels',
                activeIcon: Icon(
                  FluentSystemIcons.ic_fluent_video_clip_filled,
                )),
            BottomNavigationBarItem(
              icon: CircleAvatar(
                radius: 15,
                backgroundImage: NetworkImage(
                  "https://mir-s3-cdn-cf.behance.net/project_modules/1400_opt_1/4b1f4452438909.5910f3a745874.png",
                ),
              ),
              label: 'Profile',
            )
          ]),
    );
  }
}
