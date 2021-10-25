import 'package:cab_driver/screens/auth/registration.dart';
import 'package:cab_driver/screens/home.dart';
import 'package:cab_driver/screens/auth/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data_providers/app_data.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final FirebaseApp app = await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const String id = 'main_page';
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppData()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: "Brand-Regular",
          primarySwatch: Colors.blue,
        ),
        initialRoute: HomeScreen.id,
        routes: {
          RegistrationScreen.id: (context) => RegistrationScreen(),
          LoginScreen.id: (context) => const LoginScreen(),
          HomeScreen.id: (context) => const HomeScreen(),
          MyApp.id: (context) => const MyApp()
        },
      ),
    );
  }
}

