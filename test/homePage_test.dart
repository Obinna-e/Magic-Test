import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:magic_seniordev_test/pages/homePage/homePage.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  Widget createWidgetForTesting({required Widget child}) {
    return MaterialApp(
      home: child,
    );
  }

  testWidgets('HomePage Loads', (tester) async {
    await tester.pumpWidget(MediaQuery(
      data: MediaQueryData(),
      child: createWidgetForTesting(child: MyHomePage()),
    ));
  });
}
