import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:treepet/const/color.dart';
import 'package:treepet/const/style.dart';
import 'package:treepet/screen/sign/profile_register_screen.dart';

class MobileNumberAuthenticationScreen extends StatefulWidget {
  const MobileNumberAuthenticationScreen({Key? key}) : super(key: key);

  @override
  State<MobileNumberAuthenticationScreen> createState() =>
      _MobileNumberAuthenticationScreenState();
}

class _MobileNumberAuthenticationScreenState
    extends State<MobileNumberAuthenticationScreen> {
  String _MobileNumber = '';
  String _MobileNumberButtonText = '인증받기';
  String _AuthenticationNumber = '';
  final TextEditingController _MobileController = TextEditingController();
  final TextEditingController _AuthenticationNumberController =
  TextEditingController();
  bool _receiveMobileNumber = false;
  bool? _receiveAuthenticationNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MobileNumberAuthenticationScreenAppBar(context),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: SizedBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.9,
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    MobileNumber(context),
                    SizedBox(height: 40),
                    AuthenticationNumber(context),
                  ],
                ),
              ),
            ),
             RenderWithdrawalButton(context) ,
          ],
        ),
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
              child: TextField(
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  NumberFormatter(),
                  LengthLimitingTextInputFormatter(13),
                ],
                cursorColor: SECOND_COLOR,
                style: textfield_write_number,
                controller: _MobileController,
                decoration: InputDecoration(
                  hintText: '- 없이 번호 입력',
                  hintStyle: mobile_number_authentication_placeholder,
                ),
                onChanged: (value) {
                  setState(() {
                    _MobileNumber = value;
                  });
                },
              ),
            ),
            SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _MobileNumber.length == 13
                      ? _receiveMobileNumber = true
                      : null;
                  _MobileNumberButtonText = '재전송';
                });
              },

              style: ElevatedButton.styleFrom(
                  backgroundColor: _MobileNumber.length == 13
                      ? MAIN_COLOR
                      : Colors.grey[500]
              ),
              child: Text(_MobileNumberButtonText),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(6),
                ],
                controller: _AuthenticationNumberController,
                cursorColor: SECOND_COLOR,
                style: textfield_write_number,
                decoration: InputDecoration(
                  hintText: '인증번호 입력',
                  hintStyle: mobile_number_authentication_placeholder,
                ),
                onChanged: (value) {
                  setState(() {
                    _AuthenticationNumber = value;
                  });
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if(_AuthenticationNumber == '111111') {
                    _receiveAuthenticationNumber = true;
                  } else {
                    _receiveAuthenticationNumber = false;
                  }
                });
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: _AuthenticationNumber.length == 6
                      ? MAIN_COLOR
                      : Colors.grey[500]
              ),
              child: Text('확인'),
            ),
          ],
        ),
        SizedBox(height: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _receiveAuthenticationNumber == false ? Text('인증번호가 잘못됐습니다', style: wrong_input_warning) : SizedBox(),
            Text(
              '본인확인 절차이며, 다른 용도로 사용되지 않습니다.',
              style: mobile_number_authentication_warning,
            ),
          ],
        ),
      ],
    );
  }

  // 버튼
  Widget RenderWithdrawalButton(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: 70,
        child: ElevatedButton(
          onPressed: () {
            (_AuthenticationNumber == '111111') == true
                ? Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => ProfileRegisterScreen()))
                : null;
          },
          style: ElevatedButton.styleFrom(backgroundColor: (_receiveAuthenticationNumber == true) && _AuthenticationNumber == '111111' ? MAIN_COLOR : Colors.grey[500],),
          child: Text(
            '다음',
            style: big_long_button_text,
          ),
        ),
      ),
    );
  }
}

class NumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue,
      TextEditingValue newValue) {
    var text = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex <= 3) {
        if (nonZeroIndex % 3 == 0 && nonZeroIndex != text.length) {
          buffer.write('-'); // Add double spaces.
        }
      } else {
        if (nonZeroIndex % 7 == 0 &&
            nonZeroIndex != text.length &&
            nonZeroIndex > 4) {
          buffer.write('-');
        }
      }
    }

    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }
}
