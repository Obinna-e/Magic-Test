import 'package:flutter/material.dart';
import 'package:magic_seniordev_test/models/recordedWorkOut.dart';
import 'package:magic_seniordev_test/models/workOutData.dart';
import 'package:provider/provider.dart';
import './pages/homePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<WorkOutData>(create: (context) => WorkOutData()),
        ChangeNotifierProvider<RecordedWorkOutData>(
            create: (context) => RecordedWorkOutData()),
      ],
      child: MaterialApp(
        title: 'Magic',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}
