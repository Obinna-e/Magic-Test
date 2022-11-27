import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:magic_seniordev_test/pages/homePage/homePage.dart';
import 'package:magic_seniordev_test/pages/modalPage/customModal.dart';
import 'package:magic_seniordev_test/providers/editingWorkout.dart';
import 'package:magic_seniordev_test/providers/userWorkOut.dart';
import 'package:magic_seniordev_test/providers/workOutData.dart';
import 'package:provider/provider.dart';

// import 'package:test/test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  Widget createWidgetForTesting({required Widget child}) {
    return MaterialApp(
      home: child,
    );
  }

  testWidgets('ModalBorromSheet Loads with providers', (tester) async {
    await tester.pumpWidget(MultiProvider(
        providers: [
          ChangeNotifierProvider<WorkOutDataProvider>(
              create: (context) => WorkOutDataProvider()),
          ChangeNotifierProvider<UserWorkOutDataProvider>(
              create: (context) => UserWorkOutDataProvider()),
          ChangeNotifierProvider<EditWorkOutDataProvider>(
              create: (context) => EditWorkOutDataProvider()),
        ],
        child: MediaQuery(
          data: MediaQueryData(),
          child: createWidgetForTesting(
              child: ModalBottomSheet(
            isAnEdit: true,
          )),
        )));
    expect(ModalBottomSheet(isAnEdit: true).isAnEdit, true);
  });
}
