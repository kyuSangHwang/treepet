import 'package:flutter/material.dart';

class TreepetLoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Image.asset('assets/images/onboarding_image.png'),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  // 이전 화면으로 이동
                },
              ),
              IconButton(
                icon: Icon(Icons.arrow_forward),
                onPressed: () {
                  // 다음 화면으로 이동
                },
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // 앱에 로그인
                    },
                    child: Text('로그인'),
                  ),
                  SizedBox(width: 16.0),
                  OutlinedButton(
                    onPressed: () {
                      // 회원가입 화면으로 이동
                    },
                    child: Text('회원가입'),
                  ),
                ],
              ),
              SizedBox(height: 32.0),
              Text(
                '회원가입을 하시면 더 많은 혜택을 누리실 수 있습니다.',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
