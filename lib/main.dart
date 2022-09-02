import 'package:amazon_clone/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone/features/home/screens/home_screen.dart';
import 'package:amazon_clone/providers/users_provider.dart';
import 'package:amazon_clone/router.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:amazon_clone/features/auth/services/auth_screen_ser.dart';

void main() {
  runApp(DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MultiProvider(providers: [
            ChangeNotifierProvider(
              create: (context) => UserProvider(),
            )
          ], child: const MyApp())));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();
  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'PMT CLONE',
        theme: ThemeData(
            colorSchemeSeed: Color.fromARGB(255, 109, 207, 96),
            useMaterial3: true,
            // colorScheme:
            //     const ColorScheme.light(primary: GlobalVariales.secondaryColor),
            // scaffoldBackgroundColor: GlobalVariales.greyBackgroundCOlor,
            appBarTheme: const AppBarTheme(
                elevation: 0, iconTheme: IconThemeData(color: Colors.black))),
        onGenerateRoute: ((settings) => generateRoute(settings)),
        home: Provider.of<UserProvider>(context).user.token.isEmpty
            ? const HomeScreen()
            : const AuthScreen());
  }
}
