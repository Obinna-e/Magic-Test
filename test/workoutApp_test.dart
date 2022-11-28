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

  group('HomePage Tests', () {
    testWidgets('HomePage Loads', (tester) async {
      await tester.pumpWidget(MediaQuery(
        data: MediaQueryData(),
        child: createWidgetForTesting(child: MyHomePage()),
      ));
    });
  });

  group('Modal textinputs', () {
    testWidgets('ModalBorromSheet accepts params', (tester) async {
      expect(ModalBottomSheet(isAnEdit: true).isAnEdit, true);

      expect(
          ModalBottomSheet(
            isAnEdit: true,
            index: 0,
          ).index,
          0);
    });

    testWidgets(
        'ModalBottomSheet button says "Edit Workout" when isAnEdit is true',
        (tester) async {
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
              index: 0,
            )),
          )));

      expect(find.text('Edit Workout'), findsOneWidget);
    });

    testWidgets(
        'ModalBottomSheet button says "New Workout" when isAnEdit is true',
        (tester) async {
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
              isAnEdit: false,
              index: 0,
            )),
          )));

      expect(find.text('New Workout'), findsOneWidget);
    });
  });
}
