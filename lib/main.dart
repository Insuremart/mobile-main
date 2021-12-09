import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insure_marts/controllers/appcontroller/appctrl.dart';
import 'package:insure_marts/ui/auth/signup_screen.dart';
import 'package:insure_marts/ui/dashboard/home_screen.dart';
import 'package:insure_marts/ui/navigation_screen.dart';
import 'package:insure_marts/ui/onboard/onboarding_screen.dart';
import 'package:insure_marts/ui/onboard/splash_screen.dart';
import 'package:insure_marts/ui/dashboard/home_screen.dart';
import 'package:insure_marts/util/dialog_manager.dart';
import 'package:insure_marts/util/dialog_service.dart';
import 'package:insure_marts/util/navigator.dart';
import 'package:insure_marts/util/router.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'core/storage/local_storage.dart';
import 'locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppCache.init(); //Initialize Hive for Flutter
  Get.put(AppController(), permanent: true); //Data persistence
  setupLocator();
  runApp(const MyApp());
}

ValueNotifier<int> cartCount;

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: allProviders,
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,

          theme: ThemeData(
              textTheme:
                  GoogleFonts.nunitoTextTheme(Theme.of(context).textTheme),
              primaryColor: Colors.white,
              visualDensity: VisualDensity.adaptivePlatformDensity),

          home: OnboardingScreen1(),
          // home: HomeScreen(),
          builder: (BuildContext context, Widget child) => Navigator(
              key: locator<DialogService>().dialogNavigationKey,
              onGenerateRoute: (settings) => MaterialPageRoute<dynamic>(
                  builder: (BuildContext context) =>
                      DialogManager(child: child))),
          navigatorKey: locator<NavigationService>().navigationKey,
          onGenerateRoute: generateRoute,
        ));
  }
}
