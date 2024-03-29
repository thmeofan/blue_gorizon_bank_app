import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

import '../../../consts/app_colors.dart';
import '../../../consts/app_text_styles/news_text_style.dart';
import '../../../data/models/news_model.dart';
import '../../../util/app_routes.dart';

class NewsWidget extends StatelessWidget {
  const NewsWidget({super.key, required this.newsModel});

  final NewsModel newsModel;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .pushNamed(AppRoutes.article, arguments: newsModel);
        },
        child: Container(
          height: screenSize.height * 0.45,
          width: screenSize.width * 0.98,
          padding: EdgeInsets.symmetric(vertical: screenSize.width * 0.01),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Colors.white,
          ),
          child: Column(
            children: [
              SizedBox(
                height: screenSize.height * 0.01,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: FancyShimmerImage(
                  width: screenSize.width * 0.9,
                  height: screenSize.height * 0.25,
                  boxFit: BoxFit.cover,
                  imageUrl: newsModel.imageUrl,
                ),
              ),
              SizedBox(
                height: screenSize.height * 0.01,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: screenSize.width * 0.02,
                    right: screenSize.width * 0.01,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        newsModel.date,
                        style: NewsTextStyle.date,
                      ),
                      SizedBox(
                        height: screenSize.height * 0.02,
                      ),
                      Text(
                        newsModel.title,
                        style: NewsTextStyle.title,
                        maxLines: 3,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: screenSize.height * 0.01,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
