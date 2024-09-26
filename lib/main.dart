import 'package:flutter/material.dart';
import 'package:my_flutter/app/app.bottomsheets.dart';
import 'package:my_flutter/app/app.dialogs.dart';
import 'package:my_flutter/app/app.locator.dart';
import 'package:my_flutter/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  runApp(const FacebookClone());
}

class FacebookClone extends StatelessWidget {
  const FacebookClone({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.startupView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [
        StackedService.routeObserver,
      ],
    );
  }
}
