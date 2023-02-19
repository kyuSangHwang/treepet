import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:treepet/screen/onboarding/onboarding_page.dart';
import 'firebase_options.dart';
import 'package:intl/date_symbol_data_local.dart';

void main()  async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: HomeScreen(),
      home: OnboardingPage(),
    );
  }
}
