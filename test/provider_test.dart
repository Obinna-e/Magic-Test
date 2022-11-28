import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:magic_seniordev_test/constants/widgets/custom_button.dart';
import 'package:magic_seniordev_test/pages/homePage/home_page.dart';
import 'package:magic_seniordev_test/pages/modalPage/widgets/selectable_workout.dart';
import 'package:magic_seniordev_test/pages/modalPage/widgets/workout_dialog.dart';
import 'package:magic_seniordev_test/providers/editing_workout.dart';
import 'package:magic_seniordev_test/providers/userWorkOut.dart';
import 'package:magic_seniordev_test/providers/work_out_data.dart';
import 'package:provider/provider.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  Widget createWidgetForTesting({required Widget child}) {
    return MultiProvider(
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
            child: MaterialApp(
              home: child,
            )));
  }

  group('ModalButtomSheet Adds Workout', () {
    testWidgets('ModalBottomSheet Adds workout to Provider', (tester) async {
      await tester.pumpWidget(
        createWidgetForTesting(
          child: const MyHomePage(),
        ),
      );

      await tester.tap(find.byType(FloatingActionButton));

      await tester.pumpAndSettle();

      await tester.tap(
        find.widgetWithText(CustomButton, 'Add Exercises'),
      );

      await tester.pump();

      await tester.tap(find.widgetWithText(WorkoutItems, 'Barbell Row'));

      await tester.pumpAndSettle();

      await tester.tap(find.widgetWithText(SelectableWorkout, 'Done'));

      await tester.pumpAndSettle();

      await tester.enterText(
          find.widgetWithText(TextField, 'Enter Weight'), '43');
      await tester.enterText(find.widgetWithText(TextField, 'Enter Reps'), '4');

      // expect(UserWorkOutDataProvider().userEditingWorkout[0], 'Barbell Row');
    });
  });
}
