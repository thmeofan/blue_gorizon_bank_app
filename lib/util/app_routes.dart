import 'package:blue_gorizon_bank_app/data/models/quiz_model.dart';
import 'package:blue_gorizon_bank_app/views/news/views/news_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/onboarding_cubit/onboarding_cubit.dart';
import '../data/models/news_model.dart';
import '../data/repository/onboarding_repository.dart';
import '../views/app/views/home_screen.dart';
import '../views/income/views/income_screen.dart';
import '../views/news/views/article_screen.dart';
import '../views/onboarding_screen/view/onboarding_screen.dart';
import '../views/quiz/quiz_screen.dart';
import '../views/settings/views/settings_screen.dart';

abstract class AppRoutes {
  static const home = 'home';
  static const welcome = 'welcome';
  static const profile = 'profile';
  static const quiz = 'quiz';
  static const article = 'article';
  static const income = 'income';
  static const news = 'news';

  static MaterialPageRoute onGenerateRoute(RouteSettings settings) {
    final Widget child;

    OnboardingRepository onboardingRepository = OnboardingRepository();
    OnboardingCubit onboardingCubit = OnboardingCubit(onboardingRepository);

    switch (settings.name) {
      case home:
        child = const HomeScreen();
      case profile:
        child = const SettingsScreen();
      case quiz:
        List<QuizModel> quizzes = settings.arguments as List<QuizModel>;
        child = QuizScreen(
          quizzes: quizzes,
        );
      case income:
        child = IncomeScreen();
      case news:
        List<NewsModel> newsModel = settings.arguments as List<NewsModel>;
        child = NewsScreen(newsModel: newsModel);
      case article:
        NewsModel news = settings.arguments as NewsModel;
        child = ArticleScreen(
          newsModel: news,
        );
      default:
        child = BlocProvider(
          create: (context) => onboardingCubit,
          child: const OnboardingScreen(),
        );
    }
    return MaterialPageRoute(builder: (_) => child);
  }
}
