import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:treepet/const/style.dart';
import 'package:treepet/screen/home_screen.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: 'Welcome to my app',
          body: 'This is the fist page',
          image: Image.asset('asset/image/logo/treepet-logo.png'),
          decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: 'Welcome to my app',
          body: 'This is the fist page',
          image: Image.asset('asset/image/postTest2.jpg'),
          decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: 'Welcome to my app',
          body: 'This is the fist page',
          image: Image.asset('asset/image/treepetMale.jpeg'),
          decoration: getPageDecoration(),
        ),
      ],
      done: const Text('시작하기'),
      onDone: () {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => HomeScreen()));
      },
      next: const Text('다음'),

    );
  }
}
