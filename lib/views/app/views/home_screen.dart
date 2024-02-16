import 'package:blue_gorizon_bank_app/data/models/quiz_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../consts/app_colors.dart';
import '../../../data/models/news_model.dart';
import '../../news/views/news_screen.dart';
import '../../settings/views/settings_screen.dart';
import '../../synopsis/views/synopsis_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> homeWidgets = [
    SynopsisScreen(
      newsModel: news,
      quizModel: quiz,
    ),
    NewsScreen(
      newsModel: news,
    ),
    const SettingsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: homeWidgets[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/home.svg',
              width: size.height * 0.04,
              height: size.height * 0.05,
              color: currentIndex == 0
                  ? AppColors.blueColor
                  : AppColors.darkGreyColor,
            ),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/news.svg',
              width: size.height * 0.04,
              height: size.height * 0.05,
              color: currentIndex == 1
                  ? AppColors.blueColor
                  : AppColors.darkGreyColor,
            ),
            label: 'News',
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/settings.svg',
                width: size.height * 0.04,
                height: size.height * 0.05,
                color: currentIndex == 2
                    ? AppColors.blueColor
                    : AppColors.darkGreyColor,
              ),
              label: 'Settings'),
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        unselectedItemColor: AppColors.lightGreyColor,
        selectedItemColor: AppColors.blueColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}
