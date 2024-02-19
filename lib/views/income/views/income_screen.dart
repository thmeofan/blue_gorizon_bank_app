import 'package:blue_gorizon_bank_app/consts/app_text_styles/settings_text_style.dart';
import 'package:blue_gorizon_bank_app/views/app/widgets/chosen_action_button_widget.dart';
import 'package:blue_gorizon_bank_app/views/synopsis/views/synopsis_screen.dart';
import 'package:flutter/material.dart';
import '../../../consts/app_colors.dart';
import '../../../consts/app_text_styles/income_text_style.dart';
import '../../../data/models/news_model.dart';
import '../../../data/models/quiz_model.dart';
import '../../../util/shared_pref_service.dart';

class IncomeScreen extends StatefulWidget {
  @override
  _IncomeScreenState createState() => _IncomeScreenState();
}

class _IncomeScreenState extends State<IncomeScreen> {
  List<Map<String, dynamic>> operations = [];
  String _operationType = 'Доходы';
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _loadOperations();
    _descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
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

  List<Map<String, dynamic>> get _filteredOperations {
    return operations.where((op) => op['type'] == _operationType).toList();
  }

  void _showAddIncomeBottomSheet() {
    double tempAmount = 0.0;
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextField(
                      controller: _descriptionController,
                      decoration: InputDecoration(
                        labelText: 'Income description',
                        labelStyle: IncomeTextStyle.addIncome,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Select amount: ${tempAmount.toInt()}\$',
                      style: IncomeTextStyle.addIncome,
                    ),
                    Slider(
                      min: 0,
                      max: 50000,
                      value: tempAmount,
                      onChanged: (value) {
                        setState(() {
                          tempAmount = value;
                        });
                      },
                    ),
                    ChosenActionButton(
                      text: 'Add Income',
                      onTap: () {
                        if (_descriptionController.text.isNotEmpty) {
                          _addOperation({
                            'description': _descriptionController.text,
                            'amount': tempAmount,
                            'type': _operationType,
                          });
                          _descriptionController.clear();
                          Navigator.pop(context);
                        }
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  double _calculateTotalIncome() {
    return _filteredOperations.fold(
        0, (sum, op) => sum + (op['amount'] as double));
  }

  Widget _incomeTotalDisplay() {
    Size size = MediaQuery.of(context).size;
    double totalIncome = _calculateTotalIncome();
    return Container(
      padding: EdgeInsets.all(size.height * 0.02),
      decoration: const BoxDecoration(
        color: AppColors.lightGreyColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Personal Income',
            style: IncomeTextStyle.titleIncome,
          ),
          const SizedBox(height: 4),
          Text('${totalIncome.toStringAsFixed(0)} \$',
              style: _filteredOperations.isEmpty
                  ? IncomeTextStyle.amountZero
                  : IncomeTextStyle.amount),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: AppColors.blueColor,
          onPressed: () {
            // Navigator.pushReplacement(
            //   context,
            //   MaterialPageRoute(
            //       builder: (context) =>
            //           SynopsisScreen(newsModel: news, quizModel: quiz)),
            // );
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
        backgroundColor: AppColors.lightGreyColor,
        title: const Text(
          'Back',
          style: SettingsTextStyle.back,
        ),
        actions: [
          TextButton(
            onPressed: () async {
              _showAddIncomeBottomSheet();
            },
            child: const Text(
              'Add income',
              style: SettingsTextStyle.back,
            ),
          )
        ],
      ),
      body: Container(
        color: AppColors.lightGreyColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _incomeTotalDisplay(),
            SizedBox(
              height: size.height * 0.01,
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: size.height * 0.01, left: size.height * 0.02),
              child: const Text(
                'Income history',
                style: IncomeTextStyle.titleHistory,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: size.height * 0.01,
                left: size.height * 0.02,
                bottom: size.height * 0.01,
              ),
              child: Text(
                '${_filteredOperations.length.toString()} transactions',
                style: IncomeTextStyle.transactions,
              ),
            ),
            Expanded(
              child: _filteredOperations.isEmpty
                  ? Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                      ),
                      child: Center(
                          child: Text(
                        'No information on income yet,\n click on the "Add income" button ',
                        style: IncomeTextStyle.transactions,
                      )),
                    )
                  : Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                      ),
                      child: ListView.builder(
                        itemCount: _filteredOperations.length,
                        itemBuilder: (ctx, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                      width: 1.0,
                                      color: AppColors.lightGreyColor),
                                ),
                              ),
                              child: ListTile(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                tileColor: AppColors.lightGreyColor,
                                title: Text(
                                  '${_filteredOperations[index]['description']}  ',
                                  style: IncomeTextStyle.tileSubtitle,
                                ),
                                trailing: Text(
                                  '${_filteredOperations[index]['amount'].toStringAsFixed(0)} \$ ',
                                  style: IncomeTextStyle.tileSum,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
