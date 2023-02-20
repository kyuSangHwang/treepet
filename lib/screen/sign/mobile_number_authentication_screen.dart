import 'package:flutter/material.dart';
import 'package:treepet/const/color.dart';
import 'package:treepet/const/style.dart';
import 'package:treepet/screen/sign/register_profile_screen.dart';

class MobileNumberAuthenticationScreen extends StatelessWidget {
  const MobileNumberAuthenticationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MobileNumberAuthenticationScreenAppBar(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Column(
                children: [
                  SizedBox(height: 20),
                  MobileNumber(context),
                  SizedBox(height: 40),
                  AuthenticationNumber(context),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('본인확인 절차이며, 다른 용도로 사용되지 않습니다.',
                          style: mobile_number_authentication_placeholder.copyWith(
                              fontSize: 15),),
                    ],
                  ),
                ],
              ),
            ),
          ),
          RenderWithdrawalButton(context),
        ],
      ),
    );
  }

  AppBar MobileNumberAuthenticationScreenAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: false,
      backgroundColor: WHITE_COLOR,
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(
          Icons.arrow_back,
          color: BLACK_COLOR,
        ),
      ),
      title: Text(
        '간단한 인증',
        style: TextStyle(color: BLACK_COLOR),
      ),
    );
  }

  Column MobileNumber(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('휴대폰 번호', style: mobile_number_authentication_title),
        SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                cursorColor: SECOND_COLOR,
                style: textfield_write_number,
                decoration: InputDecoration(
                  // enabledBorder: ,
                  hintText: '- 없이 번호 입력',
                  hintStyle: mobile_number_authentication_placeholder,
                ),
              ),
            ),
            SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {},
              child: Text('인증받기'),
            ),
          ],
        ),
      ],
    );
  }

  Column AuthenticationNumber(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('인증번호', style: mobile_number_authentication_title),
        SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                cursorColor: SECOND_COLOR,
                style: textfield_write_number,
                decoration: InputDecoration(
                  hintText: '인증번호 입력',
                  hintStyle: mobile_number_authentication_placeholder,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  // 버튼
  Widget RenderWithdrawalButton(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 70,
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => ProfileRegisterScreen()));
          },
          child: Text(
            '다음',
            style: big_long_button_text,
          ),
        ),
      ),
    );
  }
}
