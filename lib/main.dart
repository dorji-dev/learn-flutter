import 'package:flutter/material.dart';
import 'package:twitter_clone/app/app.bottomsheets.dart';
import 'package:twitter_clone/app/app.dialogs.dart';
import 'package:twitter_clone/app/app.locator.dart';
import 'package:twitter_clone/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:twitter_clone/app/themes/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  runApp(const Shopping());
}

class Shopping extends StatelessWidget {
  const Shopping({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.startupView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [
        StackedService.routeObserver,
      ],
      theme: AppTheme.theme,
    );
  }
}
