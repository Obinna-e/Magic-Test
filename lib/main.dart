import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/user_workout.dart';
import 'providers/work_out_data.dart';
import 'pages/homePage/home_page.dart';
import './providers/editing_workout.dart';

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
        ChangeNotifierProvider<UserWorkOutDataProvider>(
            create: (context) => UserWorkOutDataProvider()),
        ChangeNotifierProvider<EditWorkOutDataProvider>(
            create: (context) => EditWorkOutDataProvider()),
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
