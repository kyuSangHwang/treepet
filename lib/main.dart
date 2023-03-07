import 'package:flutter/material.dart';
import 'package:treepet/screen/login/on_boarding_page_ks.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:treepet/screen/onboarding/onboarding_page.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart' as kakao;
import 'package:intl/date_symbol_data_local.dart';


void main() async {
  kakao.KakaoSdk.init(nativeAppKey: 'f05b5a6c8a7cab870019949709340881');
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting();

  if (Firebase.apps.isEmpty) {
    await Firebase.initializeApp();
  } else {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: OnBoardingPageKS(),
      home: OnboardingPage(),
    );
  }
}
