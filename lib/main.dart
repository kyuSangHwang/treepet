import 'package:flutter/material.dart';
import 'package:treepet/screen/login/on_boarding_page_ks.dart';
import 'package:treepet/screen/onboarding/onboarding_page.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting();

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
      home: OnBoardingPageKS(),
      // home: OnboardingPage(),
    );
  }
}




// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart' as kakao;
// import 'package:treepet/kakao_login.dart';
// import 'package:treepet/main_view_model.dart';
// import 'firebase_options.dart';
//
// void main() async {
//   kakao.KakaoSdk.init(nativeAppKey: 'f05b5a6c8a7cab870019949709340881');
//   WidgetsFlutterBinding.ensureInitialized();
//
//   if (Firebase.apps.isEmpty) {
//     await Firebase.initializeApp();
//   } else {
//     await Firebase.initializeApp(
//       options: DefaultFirebaseOptions.currentPlatform,
//     );
//   }
//
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   final viewModel = MainViewModel(KakaoLogin());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: StreamBuilder<User?>(
//           stream: FirebaseAuth.instance.authStateChanges(),
//           builder: (context, snapshot) {
//             if (!snapshot.hasData) {
//               return ElevatedButton(
//                 onPressed: () async {
//                   await viewModel.login();
//                   setState(() {});
//                 },
//                 child: const Text('Login'),
//               );
//             }
//
//             return Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Image.network(
//                     viewModel.user?.kakaoAccount?.profile?.profileImageUrl ?? ''),
//                 Text(
//                   '${viewModel.isLogined}',
//                   style: Theme.of(context).textTheme.headlineMedium,
//                 ),
//                 ElevatedButton(
//                   onPressed: () async {
//                     await viewModel.logout();
//                     setState(() {});
//                   },
//                   child: const Text('Logout'),
//                 ),
//               ],
//             );
//           }
//         ),
//       ),
//     );
//   }
// }