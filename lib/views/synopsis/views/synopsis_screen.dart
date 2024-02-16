import 'package:blue_gorizon_bank_app/consts/app_colors.dart';
import 'package:blue_gorizon_bank_app/data/models/quiz_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../consts/app_text_styles/synopsis_text_style.dart';
import '../../../data/models/news_model.dart';
import '../../../util/app_routes.dart';
import '../../../util/shared_pref_service.dart';
import '../../income/views/income_screen.dart';
import '../widgets/news_item_widget.dart';
import '../widgets/quiz_item_widget.dart';
import 'constructor_screen.dart';

class SynopsisScreen extends StatefulWidget {
  const SynopsisScreen(
      {super.key, required this.newsModel, required this.quizModel});

  final List<NewsModel> newsModel;
  final List<QuizModel> quizModel;

  @override
  State<SynopsisScreen> createState() => _SynopsisScreenState();
}

class _SynopsisScreenState extends State<SynopsisScreen> {
  bool showNews = true;

  List<Map<String, dynamic>> operations = [];
// String _operationType = 'Доходы';

  @override
  void initState() {
    super.initState();
    _loadOperations();
  }

  void _loadOperations() async {
    operations = await SharedPreferencesService.loadOperations();
    setState(() {});
  }

  void _addOperation(Map<String, dynamic> operation) async {
    setState(() {
      operations.add(operation);
    });
    await SharedPreferencesService.saveOperations(operations);
  }

// List<Map<String, dynamic>> get _filteredOperations {
//   return operations.where((op) => op['type'] == _operationType).toList();
// }

//Widget build(BuildContext context) {
//     final screenSize = MediaQuery.of(context).size;
//
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: AppColors.lightGreyColor,
//           elevation: 0,
//           title: const Text(
//             'Good morning',
//             style: SynopsisTextStyle.appbar,
//           ),
//           actions: [
//             IconButton(
//               iconSize: 24,
//               onPressed: () {
//                 Navigator.of(context).pushNamed(AppRoutes.profile);
//               },
//               icon: SvgPicture.asset('assets/icons/profile.svg'),
//             ),
//           ],
//         ),
//         body: Container(
//           color: AppColors.lightGreyColor,
//           child:
//               Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//             GestureDetector(
//               onTap: () async {
//                 final result = await Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => ConstructorScreen()),
//                 );
//
//                 // if (result != null) {
//                 //   _addOperation(result);
//                 // }
//               },
//               child: const Column(
//                 children: [
//                   Text(
//                     'Income amount',
//                     textAlign: TextAlign.start,
//                   ),
//                   Text(
//                     'data',
//                     textAlign: TextAlign.start,
//                   ),
//                 ],
//               ),
//             ),
//             const Text(
//               'Income  source',
//               textAlign: TextAlign.start,
//             ),
//             ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: 0,
//               itemBuilder: (BuildContext context, int index) {
//                 return NewsItemWidget(newsModel: widget.newsModel[index]);
//               },
//             ),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: widget.newsModel.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return NewsItemWidget(newsModel: widget.newsModel[index]);
//                 },
//               ),
//             ),
//             SizedBox(
//               height: screenSize.height * 0.01,
//             ),
//           ]),
//         ));
//   }
// }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Screen'),
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => IncomeScreen()),
              );
            },
            child: Container(
              height: MediaQuery.of(context).size.height * 0.25,
              color: Colors.blue,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Income amount',
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                  Text('Income',
                      style: TextStyle(fontSize: 24, color: Colors.white)),
                ],
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.15,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10, // Replace with your actual item count
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: 100, // Set your desired width for each item
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Item $index'), // Replace with your actual data
                      Text('Detail $index'), // Replace with your actual data
                    ],
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildSwitchButton('News', true),
              _buildSwitchButton('Quiz', false),
            ],
          ),
          Expanded(
            child: showNews
                ? ListView.builder(
                    itemCount: widget.newsModel.length,
                    itemBuilder: (BuildContext context, int index) {
                      return NewsItemWidget(newsModel: widget.newsModel[index]);
                    },
                  )
                : ListView.builder(
                    itemCount: widget.quizModel.length,
                    itemBuilder: (BuildContext context, int index) {
                      return QuizItemWidget(quizModel: widget.quizModel[index]);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildSwitchButton(String title, bool isNews) {
    return GestureDetector(
      onTap: () {
        setState(() {
          showNews = isNews;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        decoration: BoxDecoration(
          color: showNews == isNews ? Colors.blue : Colors.grey,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
