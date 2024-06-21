import 'package:flutter/material.dart';

import 'main_screen_view_model.dart';

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
          Text("data")
        ],
      ),
      // bottomNavigationBar: IMDBBottomNavigationBar(
      //   pageController: _pageController,
      // ),
    );
  }
}