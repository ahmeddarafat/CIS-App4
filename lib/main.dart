import 'package:cis_app4/netwrok/dio_helper.dart';
import 'package:cis_app4/view/choose_view.dart';
import 'package:cis_app4/view/home_view.dart';
import 'package:flutter/material.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: ChooseView(),
    );
  }
}
