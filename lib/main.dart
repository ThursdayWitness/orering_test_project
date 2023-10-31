import 'package:flutter/cupertino.dart';
import 'package:orering_test_project/pages/ordering_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: "Ordering",
      theme: CupertinoThemeData(
        primaryColor: Color(0xFFEA560D),
        brightness: Brightness.light,
        textTheme: CupertinoTextThemeData(
          textStyle: TextStyle(
            fontSize: 14,
            color: Color(0xFF323F4B),
            fontFamily: "Roboto",
          ),
        ),
      ),
      home: OrderingPage(),
    );
  }
}
