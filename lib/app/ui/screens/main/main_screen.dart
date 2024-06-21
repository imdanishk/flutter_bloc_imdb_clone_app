import 'package:flutter/material.dart';

import 'home/home_screen.dart';
import 'home/home_screen_view_model.dart';
import 'main_screen_view_model.dart';
import 'profile/profile_screen.dart';
import 'search/search_screen.dart';
import 'video/video_screen.dart';
import 'widgets/bottom_navigation.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    required this.viewModel,
    super.key,
  });

  final MainScreenViewModel viewModel;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          HomeScreen(viewModel: HomeScreenViewModel()),
          const SearchScreen(),
          const VideoScreen(),
          const ProfileScreen(),
        ],
      ),
      bottomNavigationBar: IMDBBottomNavigationBar(
        pageController: _pageController,
      ),
    );
  }
}