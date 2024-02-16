import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import '../../../consts/app_colors.dart';
import '../../../consts/app_text_styles/synopsis_text_style.dart';
import '../../../data/models/news_model.dart';
import '../../../data/models/quiz_model.dart';
import '../../../util/app_routes.dart';

class QuizItemWidget extends StatelessWidget {
  const QuizItemWidget({super.key, required this.quizModel});

  final QuizModel quizModel;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .pushNamed(AppRoutes.article, arguments: quizModel);
        },
        child: Container(
          height: screenSize.height * 0.15,
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(vertical: screenSize.width * 0.01),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Colors.white,
          ),
          child: Row(
            children: [
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '',
                        //    newsModel.title,
                        maxLines: 3,
                        style: SynopsisTextStyle.title,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Spacer(),
                      Text(
                        // newsModel.date,
                        '',
                        style: SynopsisTextStyle.read,
                      ),
                      SizedBox(
                        height: screenSize.height * 0.005,
                      ),
                    ],
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: FancyShimmerImage(
                  width: screenSize.width * 0.3,
                  height: screenSize.height * 0.13,
                  boxFit: BoxFit.cover,
                  imageUrl: 'newsModel.imageUrl',
                ),
              ),
              const SizedBox(
                width: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
