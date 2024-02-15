import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/onboarding_cubit/onboarding_cubit.dart';
import '../../../consts/app_colors.dart';
import '../../../consts/app_text_styles/onboarding_text_style.dart';
import '../../../util/app_routes.dart';
import '../../app/widgets/chosen_action_button_widget.dart';
import '../widgets/introduction_widget.dart';
import '../widgets/review_widget.dart';
import '../widgets/welcome_widget.dart';

class OnboardingScreen extends StatefulWidget {
  final bool? isFirstTime;

  const OnboardingScreen({
    Key? key,
    this.isFirstTime,
  }) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final CarouselController _carouselController = CarouselController();
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: Container(
        // color: AppColors.blackColor,
        child: Column(
          children: [
            Expanded(
              child: CarouselSlider(
                items: const [
                  IntroductionWidget(),
                  ReviewWidget(),
                  WelcomeWidget(),
                ],
                carouselController: _carouselController,
                options: CarouselOptions(
                  height: size.height * 0.6,
                  autoPlay: false,
                  //  enlargeCenterPage: true,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  },
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                  //   color: AppColors.blackColor,
                  borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              )),
              width: double.infinity,
              height: size.height * 0.36,
              child: Padding(
                padding: EdgeInsets.all(size.height * 0.02),
                child: Column(
                  children: [
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //   children: [
                    //     Text(
                    //       _current == 0
                    //           ? 'Добро пожаловать!'
                    //           : _current == 1
                    //               ? 'Хотите купить жилье? '
                    //               : 'Будьте в курсе новостей!',
                    //       style: OnboardingTextStyle.introduction,
                    //       textAlign: TextAlign.start,
                    //       softWrap: true,
                    //       overflow: TextOverflow.ellipsis,
                    //     ),
                    //   ],
                    // ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            _current == 0
                                ? 'Discover all the features of our convenient and secure mobile banking. '
                                : _current == 1
                                    ? 'Manage your finances, make payments, and receive notifications about your transactions - all in one app!'
                                    : 'Track your expenses and income to always stay informed about your financial situation.',
                            style: OnboardingTextStyle.description,
                            textAlign: TextAlign.start,
                            softWrap: true,
                            overflow: TextOverflow.visible,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: List.generate(3, (index) {
                        return AnimatedContainer(
                          duration: Duration(milliseconds: 200),
                          curve: Curves.easeInOut,
                          width: _current == index
                              ? size.width * 0.075
                              : size.width * 0.02,
                          height: size.width * 0.02,
                          margin: const EdgeInsets.symmetric(
                              vertical: 1.0, horizontal: 2.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius:
                                BorderRadius.circular(size.width * 0.01),
                            color: _current == index
                                ? AppColors.darkGreyColor
                                : AppColors.lightGreyColor,
                          ),
                        );
                      }),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    ChosenActionButton(
                      onTap: () async {
                        context.read<OnboardingCubit>().setFirstTime();
                        Navigator.pushReplacementNamed(context, AppRoutes.home);
                      },
                      text: 'Next',
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
