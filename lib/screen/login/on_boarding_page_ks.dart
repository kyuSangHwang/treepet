import 'package:flutter/material.dart';
import 'package:treepet/const/style.dart';
import 'package:dots_indicator/dots_indicator.dart';

class OnBoardingPageKS extends StatefulWidget {
  const OnBoardingPageKS({Key? key}) : super(key: key);

  @override
  State<OnBoardingPageKS> createState() => _OnBoardingPageKSState();
}

class _OnBoardingPageKSState extends State<OnBoardingPageKS> {
  final PageController _pageController = PageController(initialPage: 0);
  double _currentPage = 0;
  final List<String> _images = [
    'asset/image/logo/treepet_logo_green_only_text.png',
    'asset/image/logo/treepet_logo_green_only_image.png',
    'asset/image/logo/treepet_logo_green_full.png',
  ];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _OnBoardingImageAndExplanation(context),
            _OnBoardingButtonsAndFindAccountArea(context),
          ],
        ),
      ),
    );
  }

  /// OnBoarding 이미지와 설명 영역
  ///
  /// [context] BuildContext, build widget의 context
  Stack _OnBoardingImageAndExplanation(BuildContext context) {
    return Stack(
      children: <Widget>[
        _OnBoardingImages(context),
        if (_currentPage != 0)
          _OnBoardingArrows(context, "left"),
        if (_currentPage != _images.length - 1)
          _OnBoardingArrows(context, "right"),
        _OnBoardingPaging(context),
      ],
    );
  }

  /// OnBoarding 이미지 영역
  ///
  /// [context] BuildContext, build widget의 context
  SizedBox _OnBoardingImages(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.7,
      child: PageView.builder(
        controller: _pageController,
        itemCount: _images.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(_images[index]),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }

  /// OnBoarding 이미지 위의 좌우 화살표 버튼
  ///
  /// [context] BuildContext, build widget의 context
  /// [direction] String, 화살표 방향
  Positioned _OnBoardingArrows(BuildContext context, String direction) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.7 / 2,
      left: direction == "left" ? 10 : null,
      right: direction == "right" ? 10 : null,
      child: IconButton(
        icon: Icon(direction == "left" ? Icons.arrow_back_ios : direction == "right" ? Icons.arrow_forward_ios : null),
        color: Colors.white,
        onPressed: () {
          if (direction == "left") {
            _pageController.previousPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          } else if (direction == "right") {
            _pageController.nextPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          }
        },
      ),
    );
  }

  /// OnBoarding 이미지 위의 하단의 페이징 영역
  ///
  /// [context] BuildContext, build widget의 context
  Positioned _OnBoardingPaging(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.65,
      right: MediaQuery.of(context).size.width / 2.35,
      child: DotsIndicator(
        dotsCount: _images.length,
        position: _currentPage,
        decorator: const DotsDecorator(
          activeColor: Colors.white,
        ),
      ),
    );
  }

  /// OnBoarding 화면 하단의 로그인, 회원가입 버튼과 계정찾기 영역
  ///
  /// [context] BuildContext, build widget의 context
  Column _OnBoardingButtonsAndFindAccountArea(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _OnBoardingButtons(context, "login"),
              const SizedBox(width: 10.0),
              _OnBoardingButtons(context, "join"),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("계정이 기억나지 않나요?"),
            const SizedBox(width: 5.0),
            // const Text("계정 찾기"),

            TextButton(
              onPressed: () {
                // 버튼이 눌렸을 때 실행되는 코드
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.transparent, // 배경색 투명하게 설정
                padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: const Text(
                '계정찾기',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  decoration: TextDecoration.underline, // 밑줄 추가
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  /// OnBoarding 화면의 버튼
  ///
  /// [context] BuildContext, build widget의 context
  /// [buttonName] String, 버튼에 들어가는 이름
  OutlinedButton _OnBoardingButtons(BuildContext context, String buttonName) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: buttonName == "login"
            ? Colors.black
            : buttonName == "join"
                ? Colors.white
                : Colors.black,
        backgroundColor: buttonName == "login"
            ? Colors.white
            : buttonName == "join"
                ? Colors.black
                : Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: Colors.grey,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        fixedSize: const Size(160, 48),
      ),
      onPressed: () {
        buttonName == "login" ? _LoginBottomSheet(context) : null;
      },
      child: Text(
        buttonName == "login"
            ? "로그인"
            : buttonName == "join"
                ? "회원가입"
                : buttonName,
        style: buttonName == "login"
            ? on_boarding_login_button
            : buttonName == "join"
                ? on_boarding_join_button
                : null,
      ),
    );
  }

  /// 로그인 버튼 클릭 시 보여지는 영역
  ///
  /// [context] BuildContext, build widget의 context
  _LoginBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 300,
          color: Colors.white,
          child: Center(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Text("로그인 방법 선택"),
                ),
                Column(
                  children: [
                    Row(
                      children: [

                      ],
                    ),
                    Row(
                      children: [

                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
