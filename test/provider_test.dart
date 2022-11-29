import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:magic_seniordev_test/constants/widgets/custom_button.dart';
import 'package:magic_seniordev_test/pages/homePage/home_page.dart';
import 'package:magic_seniordev_test/pages/modalPage/widgets/selectable_workout.dart';
import 'package:magic_seniordev_test/pages/modalPage/widgets/workout_dialog.dart';
import 'package:magic_seniordev_test/pages/recordedWorkoutPage/widgets/work_out_page_layout.dart';
import 'package:magic_seniordev_test/providers/editing_workout.dart';
import 'package:magic_seniordev_test/providers/user_workout.dart';
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

      await tester.pumpAndSettle();

      await tester.tap(find.widgetWithText(WorkoutItems, 'Barbell Row'));

      await tester.pumpAndSettle();

      await tester.tap(find.widgetWithText(ElevatedButton, 'Done'));

      await tester.pumpAndSettle();

      expect(find.byType(TextField), findsNWidgets(2));

      await tester.enterText(
          find.widgetWithText(TextField, 'Enter Weight'), '43');
      await tester.enterText(find.widgetWithText(TextField, 'Enter Reps'), '4');

      await tester.tap(
        find.widgetWithText(ElevatedButton, 'Finish'),
      );

      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('bottom')).last);

      await tester.pumpAndSettle();

      expect(find.byKey(Key('history')), findsOneWidget);

      expect(find.byType(ListView), findsWidgets);
    });
  });
}
