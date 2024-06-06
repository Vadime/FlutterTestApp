import 'package:flutter/material.dart';
import 'package:fluttertestapp/animation_processing.dart';
import 'package:fluttertestapp/article_list.dart';
import 'package:fluttertestapp/data_processing.dart';
import 'package:fluttertestapp/image_processing.dart';
import 'package:fluttertestapp/settings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const ArticleListPage(),
    const ImageProcessingPage(),
    const DataProcessingPage(),
    const AnimationProcessingPage(),
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.article_rounded),
                  label: 'Articles',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.image_rounded),
                  label: 'Image',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.data_array_rounded),
                  label: 'Data',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.animation_rounded),
                  label: 'Animation',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings_rounded),
                  label: 'Settings',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
