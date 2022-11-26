import 'package:flutter/material.dart';
import 'package:magic_seniordev_test/providers/recordedWorkOut.dart';
import 'package:magic_seniordev_test/providers/workOutData.dart';
import 'package:provider/provider.dart';
import 'pages/homePage/homePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<WorkOutDataProvider>(
            create: (context) => WorkOutDataProvider()),
        ChangeNotifierProvider<RecordedWorkOutProvider>(
            create: (context) => RecordedWorkOutProvider()),
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
