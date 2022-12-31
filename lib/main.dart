import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jkmart/core/utils/theme.dart';
import 'package:jkmart/initial_binding.dart';
import 'package:jkmart/screens/auth/sign_in_screen.dart';
import 'package:jkmart/injection_container.dart' as di;
import 'package:jkmart/screens/home/pages/home_screen.dart';
import 'package:jkmart/screens/income/pages/income_screen.dart';
import 'package:jkmart/screens/lottery/pages/lottery_screen.dart';
import 'package:jkmart/screens/order_management/pages/new_order.dart';
import 'package:appwrite/appwrite.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Client client = Client();

  client
      .setEndpoint('http://home.logstacks.com:8080/v1') // Your API Endpoint
      .setProject('62dc48a91676c0ff925a') // Your project ID
      .setSelfSigned(); // Remove in production

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
      scrollBehavior: const CupertinoScrollBehavior(),

      theme: CustomTheme().mainTheme,
      // home: const SplashScreen(),
      // home: const HomePage(),
      home: const SignInScreen(),
    );
  }
}
