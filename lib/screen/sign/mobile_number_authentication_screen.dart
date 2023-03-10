import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:treepet/const/color.dart';
import 'package:treepet/const/style.dart';
import 'package:treepet/screen/sign/profile_register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

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
  // final TextEditingController _MobileController = TextEditingController();
  // final TextEditingController _AuthenticationNumberController = TextEditingController();
  bool _receiveMobileNumber = false;
  bool? _receiveAuthenticationNumber;

  final TextEditingController _phoneNumberController =
  TextEditingController();
  final TextEditingController _smsController = TextEditingController();

  String verificationId = '';


  // Future<void> verifyPhoneNumber(String phoneNumber) async {
  //   await auth.verifyPhoneNumber(
  //     phoneNumber: phoneNumber,
  //     verificationCompleted: (PhoneAuthCredential credential) {},
  //     verificationFailed: (FirebaseAuthException e) {
  //       if (e.code == 'invalid-phone-number') {
  //         print('The provided phone number is not valid.');
  //       }
  //     },
  //     codeSent: (String verificationId, int? resendToken) {},
  //     codeAutoRetrievalTimeout: (String verificationId) {},
  //   );
  // }
  //
  // Future<void> signInWithPhoneNumber(String verificationId, String smsCode) async {
  //   try {
  //     final PhoneAuthCredential credential = PhoneAuthProvider.credential(
  //       verificationId: verificationId,
  //       smsCode: smsCode,
  //     );
  //     await auth.signInWithCredential(credential);
  //     print('Phone number verified and signed in: ${auth.currentUser!.phoneNumber}');
  //   } on FirebaseAuthException catch (e) {
  //     print('Failed to verify phone number: $e');
  //   }
  // }





  // TextEditingController otpController = TextEditingController();
  // /// 모바일 인증 변수들
  // FocusNode otpFocusNode=FocusNode();
  //
  // /// authOk : 폰인증이 정상적으로 완료 됐는지 안됐는지 여부
  // /// requestedAuth : 폰인증 요청을 보냈는지 여부, 인증코드(OTP 6자리)를 칠 수 있는 컨테이너의 visible 결정
  // /// verificationId : 폰인증 시 생성되는 값
  // /// showLoading : 폰인증 보낼때와 로그인할 때까지 뺑뺑이 화면 보일 수 있도록 하는 장치
  // bool authOk = false;
  // bool requestedAuth = false;
  // String? verificationId;
  // bool showLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MobileNumberAuthenticationScreenAppBar(context),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
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
                    ],
                  ),
                ),
              ),
              RenderMobileNumberAuthenticationButton(context),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: RenderWithdrawalButton(context),
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
                controller: _phoneNumberController,
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
              onPressed: () async {
                String phoneNumber = _phoneNumberController.text.trim();
                verifyPhoneNumber(phoneNumber);

                setState(() {
                  // showLoading = true;

                  // _MobileNumber.length == 13
                  //     ? _receiveMobileNumber = true
                  //     : null;
                  // _MobileNumberButtonText = '재전송';
                });

              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: _MobileNumber.length == 13
                      ? MAIN_COLOR
                      : Colors.grey[500]),
              child: Text(_MobileNumberButtonText),
            ),
          ],
        ),
      ],
    );
  }

  void verificationCompleted(AuthCredential credential) async {
    await _auth.signInWithCredential(credential);
  }

  void verificationFailed(FirebaseAuthException e) {
    print('Failed: ${e.message}');
  }

  void codeSent(String verificationId, int? resendToken) {
    print('Verification ID: $verificationId');
    this.verificationId = verificationId;
  }

  void codeAutoRetrievalTimeout(String verificationId) {
    print('SMS code retrieval timeout: $verificationId');
  }

  void verifyPhoneNumber(String phoneNumber) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
      timeout: const Duration(seconds: 60),
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
                controller: _smsController,
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
                // String smsCode = _smsController.text.trim();
                // AuthCredential credential = PhoneAuthProvider.credential(
                //   verificationId: verificationId, smsCode: smsCode
                // );
                // await _auth.signInWithCredential(credential);
                // Navigator.of(context).pop();

                setState(() {
                  if (_AuthenticationNumber == '111111') {
                    _receiveAuthenticationNumber = true;
                  } else {
                    _receiveAuthenticationNumber = false;
                  }
                });
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: _AuthenticationNumber.length == 6
                      ? MAIN_COLOR
                      : Colors.grey[500]),
              child: Text('확인'),
            ),
          ],
        ),
        SizedBox(height: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _receiveAuthenticationNumber == false
                ? Text('인증번호가 잘못됐습니다', style: wrong_input_warning)
                : SizedBox(),
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
  Widget RenderMobileNumberAuthenticationButton(BuildContext context) {
    return BottomAppBar(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 70,
        child: ElevatedButton(
          onPressed: () {
            _receiveAuthenticationNumber == true
                ? Navigator.of(context).pushNamed('/profileRegisterScreen')
                : null;
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: (_receiveAuthenticationNumber == true) &&
                    _AuthenticationNumber == '111111'
                ? MAIN_COLOR
                : Colors.grey[500],
          ),
          child: Text(
            '다음',
            style: big_long_button_text,
          ),
        ),
      ),
    );
  }


  // await auth.verifyPhoneNumber(
  //     forceResendingToken: _res,
  //     )


  // /// signInWithPhoneAuthCredential 이라는 함수를 만들고 PhoneAuthCredential 을 받도록 한다
  // /// PhoneAuthCredential 정보로 phoneAuth 가입을 시도
  // /// signin 으로 함수를 실행해서 기존에 없으면 생성하고, 기존에 있으면 기존값을 쓰는 형태
  // FirebaseAuth _auth = FirebaseAuth.instance;
  // void signInWithPhoneAuthCredential(PhoneAuthCredential phoneAuthCredential) async {
  //   setState(() {
  //     showLoading = true;
  //   });
  //   try {
  //     final authCredential = await _auth.signInWithCredential(phoneAuthCredential);
  //     setState(() {
  //       showLoading = false;
  //     });
  //
  //     /// 가입이 완료되면 authOk = true 로 바꾼다. 즉, 가입이 됐다는 것은 폰번호 인증에 성공했다는 뜻
  //     /// requestedAuth = false 로 바꿈으로써 휴대폰 번호를 적을 수 있는 공간과
  //     /// OTP 적을 수 있는 공간을 비활성화 시켜서 못건들이게 바꿔준다 (왜냐면 인증이 됐으니 더는 건들이지못하게!)
  //     if(authCredential?.user != null){
  //       setState(() {
  //         print('인증완료 및 로그인 성공');
  //         authOk = true;
  //         requestedAuth = false;
  //       });
  //
  //       /// 가입이 성공적으로 끝나면 Firebase 콘솔에 Auth정보가 남기때문에 회월탈퇴처럼 delete 지워주고
  //       /// 앱내에 firebase 현재 유저로 등록되어있으니 SignOut 해준다
  //       await _auth.currentUser?.delete();
  //       print('auth 정보 삭제');
  //       _auth.signOut();
  //       print('phone 로그인된것 로그아웃');
  //     }
  //
  //     /// 폰번호 인증이 인증번호가 틀리든 뭐든 어떠한 이유로서 실패하면 에러를 내뱉게 되고 try catch에 예외처리에 걸린다
  //     /// 에러에 걸리면 sohwLoading = false 만 될뿐 아무일도 일어나지 않는다
  //   } on FirebaseAuthException catch (e) {
  //     setState(() {
  //       print('인증실패...로그인 실패');
  //       showLoading = false;
  //     });
  //
  //     await Fluttertoast.showToast(
  //         msg: e.message!,
  //         toastLength: Toast.LENGTH_SHORT,
  //         timeInSecForIosWeb: 1,
  //         backgroundColor: Colors.red,
  //         fontSize: 16.0
  //     );
  //   }
  // }
}

class NumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
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