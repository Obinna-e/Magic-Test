import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:magic_seniordev_test/constants/widgets/custom_button.dart';
import 'package:magic_seniordev_test/pages/homePage/home_page.dart';
import 'package:magic_seniordev_test/pages/modalPage/custom_modal.dart';
import 'package:magic_seniordev_test/providers/editing_workout.dart';
import 'package:magic_seniordev_test/providers/user_workout.dart';
import 'package:magic_seniordev_test/providers/work_out_data.dart';
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
        data: const MediaQueryData(),
        child: createWidgetForTesting(child: const MyHomePage()),
      ));
    });
  });

  group('ModalButtomSheet tests', () {
    testWidgets('ModalBottomSheet accepts params', (tester) async {
      expect(const ModalBottomSheet(isAnEdit: true).isAnEdit, true);

      expect(
          const ModalBottomSheet(
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
            data: const MediaQueryData(),
            child: createWidgetForTesting(
                child: const ModalBottomSheet(
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
            data: const MediaQueryData(),
            child: createWidgetForTesting(
                child: const ModalBottomSheet(
              isAnEdit: false,
              index: 0,
            )),
          )));

      expect(find.text('New Workout'), findsOneWidget);
      expect(
          find.widgetWithText(CustomButton, 'Add Exercises'), findsOneWidget);
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
            data: const MediaQueryData(),
            child: createWidgetForTesting(
                child: const ModalBottomSheet(
              isAnEdit: false,
              index: 0,
            )),
          )));

      expect(find.text('New Workout'), findsOneWidget);
      expect(
          find.widgetWithText(CustomButton, 'Add Exercises'), findsOneWidget);
    });
  });
}
