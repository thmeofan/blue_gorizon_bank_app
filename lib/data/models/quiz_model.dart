class QuizModel {
  final String question;
  final String answerOne;
  final String answerTwo;
  final String answerThree;
  final String theme;

  QuizModel({
    required this.theme,
    required this.question,
    required this.answerOne,
    required this.answerTwo,
    required this.answerThree,
  });
}

final quiz = [
  QuizModel(
      theme: 'Additional features and improvements',
      question:
          'What additional features or services would you like to see in your bank\'s mobile application?',
      answerOne:
          'The ability to manage personal investments and securities portfolio directly through the application.',
      answerTwo:
          'The option to connect and manage additional financial products such as insurance or retirement planning.',
      answerThree:
          'Integration with budgeting systems and expense tracking for better financial control.'),
  QuizModel(
      theme: 'Additional features and improvements',
      question:
          'Do you feel that the mobile application fully meets your needs for financial management, or is there something you feel is lacking?',
      answerOne:
          'The application more than satisfies my needs, but adding support for cryptocurrency investments would be fantastic. ',
      answerTwo:
          'The core functionality is good, but built-in tools for budget planning and tracking are missing.',
      answerThree:
          'The mobile application largely meets my needs, but enhanced analysis capabilities for income and expenses would be useful.'),
  QuizModel(
      theme: 'Additional features and improvements',
      question:
          'How would you feel about adding functionality for investment management or financial goals to the application?',
      answerOne:
          'I definitely welcome the ability to manage investments and set financial goals directly through the mobile application.',
      answerTwo:
          'Adding functionality for automatic investment of surplus funds into investment goals would be great.',
      answerThree:
          'I believe that integrating with investment platforms and tools for investment planning would make the application more comprehensive.'),
  QuizModel(
      theme: 'Additional features and improvements',
      question:
          'Are there any aspects of the mobile banking application that could be improved to increase your interest or engagement?',
      answerOne:
          'It would be great if the application provided more personalized financial recommendations and advice based on my spending and goals.',
      answerTwo:
          'Adding financial courses or articles would make the application more appealing and informative.',
      answerThree:
          'Increased interactivity and the ability to participate in financial literacy games could significantly enhance the user experience.'),
  QuizModel(
      theme: 'Additional features and improvements',
      question:
          'What changes or enhancements in the application could make your experience of using it more convenient or enjoyable?',
      answerOne:
          'I would like to see improved tools for analyzing my financial transactions and transparent reports on expenses and incomes.',
      answerTwo:
          'Adding functionality for quick creation of investment portfolios and tracking their performance could make using the application more convenient.',
      answerThree:
          'Improving the interface and adding personalized notifications about my financial assets would make my experience of using the application more convenient and enjoyable.'),
  //
  QuizModel(
      theme: 'Convenience of using the mobile banking application',
      question:
          'How do you rate the overall convenience of using the mobile banking application for conducting financial transactions?',
      answerOne:
          'I rate the convenience of using the application as high due to its intuitive interface and fast navigation.',
      answerTwo:
          'The overall convenience is good, but I would like to have more personalized features tailored to my needs.',
      answerThree:
          'The convenience of using the application is generally satisfactory, but could be improved to optimize the process of conducting operations.'),
  QuizModel(
      theme: 'Convenience of using the mobile banking application',
      question:
          'Are there any features or operations that you find inconvenient or in need of improvement in the mobile application?',
      answerOne:
          'Some features, such as setting up recurring payments, require too many steps to configure.',
      answerTwo:
          'Currency conversion operations between accounts are challenging due to unclear exchange rates.',
      answerThree:
          'The ability to scan and add checks in the application does not always work reliably and requires improvements.'),
  QuizModel(
      theme: 'Convenience of using the mobile banking application',
      question:
          ' What is your opinion on the authentication process and security in the mobile application?',
      answerOne:
          'The authentication process and security in the application are quite satisfactory and inspire confidence.',
      answerTwo:
          'User authentication could be more convenient, possibly using biometric data.',
      answerThree:
          'Adding additional authentication methods, such as two-factor authentication, would enhance the level of security.'),
  QuizModel(
      theme: 'Convenience of using the mobile banking application',
      question:
          'How do you rate the time it takes to perform basic operations in the application, such as transfers, bill payments, and account management?',
      answerOne:
          'The time it takes to perform operations in the application is quite satisfactory and meets my expectations.',
      answerTwo:
          'Transfers between accounts could be executed more quickly for user convenience.',
      answerThree:
          'The overall time it takes to perform operations is acceptable, although processing payments between different banks requires improvement.'),
  QuizModel(
      theme: 'Convenience of using the mobile banking application',
      question:
          'What additional features or improvements would you like to see in the mobile banking application to enhance its convenience of use?',
      answerOne:
          'I would like to see more intuitive analytical tools for tracking financial goals and expenses.',
      answerTwo:
          'Adding the ability to view and pay bills from a photo would make account management even more convenient.',
      answerThree:
          'Expanding the options for setting transaction alerts and notifications would increase control and convenience of use.12:51'),
];
