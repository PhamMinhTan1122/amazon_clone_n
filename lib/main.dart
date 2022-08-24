import 'package:amazon_clone/Constants/global_variables.dart';
import 'package:amazon_clone/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone/router.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(DevicePreview(
      enabled: !kReleaseMode, builder: (context) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Amazon Clone',
        theme: ThemeData(
            colorScheme:
                ColorScheme.light(primary: GlobalVariales.secondaryColor),
            scaffoldBackgroundColor: GlobalVariales.greyBackgroundCOlor,
            appBarTheme: const AppBarTheme(
                elevation: 0, iconTheme: IconThemeData(color: Colors.black))),
        onGenerateRoute: ((settings) => generateRoute(settings)),
        home: const AuthScreen());
  }
}
