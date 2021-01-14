import 'package:flutter/material.dart';
import 'input_page.dart';
import 'package:admob_flutter/admob_flutter.dart';

void main() {
  runApp(BMICalculatorTH());
  WidgetsFlutterBinding.ensureInitialized();
  Admob.initialize();
}

class BMICalculatorTH extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      home: InputPage(),
    );
  }
}
