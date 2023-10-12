import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:single_app/pages/user_page/user_page.dart';
import 'package:single_app/ui/app_colors.dart';
import 'package:single_app/ui/common/app_bar_content.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const AppBarContent(),
        actions: const [],
      ),
      body: const UsersPage(),
      bottomNavigationBar: _buildNavigation(0, AppColors.Grey),
    );
  }

  Widget _buildNavigation(int _currentIndex, Color backgroundColor) {
    return CurvedNavigationBar(
      onTap: (value) {

      },
      index: _currentIndex,
      height: 40,
      color: AppColors.Black,
      backgroundColor: backgroundColor,
      buttonBackgroundColor: AppColors.Primary,
      animationDuration: const Duration(milliseconds: 300),
      animationCurve: Curves.easeOutCubic,
      items: const <Widget>[
        Icon(
          Icons.chat_bubble,
          color: AppColors.White,
        ),
      ],
    );
  }
}
