import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jkmart/core/utils/theme.dart';
import 'package:jkmart/initial_binding.dart';
import 'package:jkmart/screens/auth/sign_in_screen.dart';
import 'package:jkmart/injection_container.dart' as di;
import 'package:appwrite/appwrite.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init(); //Inject all the dependencies and wait for it is done (i.e. UI won't built until all the dependencies are injected)
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // locale: Locale('bn'),
      // fallbackLocale: Locale('en'),
      debugShowCheckedModeBanner: false,
      initialBinding: InitialBinding(),
      // scrollBehavior: const CupertinoScrollBehavior(),
      theme: CustomTheme().mainTheme,
      // home: const SplashScreen(),
      // home: const HomePage(),
      home: const SignInScreen(),
    );
  }
}
