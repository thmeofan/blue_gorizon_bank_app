import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../consts/app_colors.dart';
import '../../../data/models/news_model.dart';
import '../../news/views/news_screen.dart';
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
    ),
    NewsScreen(
      newsModel: news,
    ),
    // const CalculatorScreen(),
    // OperationScreen(),
    // const ProfileScreen()
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
              width: size.height * 0.032,
              height: size.height * 0.032,
              color: currentIndex == 0
                  ? AppColors.blueColor
                  : AppColors.darkGreyColor,
            ),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/activity.svg',
              width: size.height * 0.032,
              height: size.height * 0.032,
              color: currentIndex == 1
                  ? AppColors.blueColor
                  : AppColors.darkGreyColor,
            ),
            label: 'Новости',
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/statistics.svg',
                width: size.height * 0.032,
                height: size.height * 0.032,
                color: currentIndex == 2
                    ? AppColors.blueColor
                    : AppColors.darkGreyColor,
              ),
              label: 'Калькулятор'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/wallet.svg',
                width: size.height * 0.032,
                height: size.height * 0.032,
                color: currentIndex == 3
                    ? AppColors.blueColor
                    : AppColors.darkGreyColor,
              ),
              label: 'Операции'),
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
        selectedLabelStyle: const TextStyle(
            // color: AppColors.lightBlueColor,
            ),
        unselectedLabelStyle: const TextStyle(
          color: AppColors.midGreyColor,
        ),
      ),
    );
  }
}
