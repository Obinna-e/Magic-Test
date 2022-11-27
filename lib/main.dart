import 'package:flutter/material.dart';
import 'package:magic_seniordev_test/providers/userWorkOut.dart';
import 'package:magic_seniordev_test/providers/workOutData.dart';
import 'package:provider/provider.dart';
import './pages/homePage/homePage.dart';
import './providers/editingWorkout.dart';

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
