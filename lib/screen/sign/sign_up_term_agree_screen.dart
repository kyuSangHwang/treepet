import 'package:flutter/material.dart';
import 'package:treepet/component/custom_text_field.dart';
import 'package:treepet/const/color.dart';
import 'package:treepet/const/style.dart';
import 'package:treepet/screen/sign/mobile_number_authentication_screen.dart';
import 'package:treepet/screen/sign/detail/personal_infomation_collection_detail_screen.dart';
import 'package:treepet/screen/sign/detail/personal_information_marketing_purposes_detail_screen.dart';
import 'package:treepet/screen/sign/detail/term_conditions_agree_detail_screen.dart';

class SignUpTermAgreeScreen extends StatefulWidget {
  const SignUpTermAgreeScreen({Key? key}) : super(key: key);

  @override
  State<SignUpTermAgreeScreen> createState() => _SignUpTermAgreeScreenState();
}

class _SignUpTermAgreeScreenState extends State<SignUpTermAgreeScreen> {
  bool _isChecked1 = false;
  bool _isChecked2 = false;
  bool _isChecked3 = false;
  bool _isChecked4 = false;

  bool _allChecked() {
    return _isChecked1 && _isChecked2 && _isChecked3 || _isChecked4;
  }

  void _toggleCheck1(bool? value) {
    setState(() {
      _isChecked1 = value!;
      if (_isChecked1) {
        _isChecked2 = true;
        _isChecked3 = true;
        _isChecked4 = true;
      } else {
        _isChecked2 = false;
        _isChecked3 = false;
        _isChecked4 = false;
      }
    });
  }

  void _toggleCheck2(bool? value) {
    setState(() {
      _isChecked2 = value!;
    });
  }

  void _toggleCheck3(bool? value) {
    setState(() {
      _isChecked3 = value!;
    });
  }

  void _toggleCheck4(bool? value) {
    setState(() {
      _isChecked4 = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SignUpTermAgreeScreenAppBar(context),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RenderSignUpTermAgreeTitle(),
                    RenderTermAgreeCategory(),
                  ],
                ),
              ),
            ),
            RenderWithdrawalButton(context),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  AppBar SignUpTermAgreeScreenAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: false,
      backgroundColor: WHITE_COLOR,
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(
          Icons.arrow_back,
          color: BLACK_COLOR,
        ),
      ),
      title: const Text(
        '약관동의',
        style: TextStyle(color: BLACK_COLOR),
      ),
    );
  }

  Widget RenderSignUpTermAgreeTitle() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20, left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '트리펫 서비스를 이용하기 위해서',
            style: withdrawal_title,
          ),
          Row(
            children: [
              Text(
                '약관동의',
                style: sign_up_term_agree_title1,
              ),
              Text(
                '가 필요합니다.',
                style: withdrawal_title,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget RenderTermAgreeCategory() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          CheckboxListTile(
            title: Text('약관 전체 동의'),
            value: _isChecked1,
            onChanged: _toggleCheck1,
            controlAffinity: ListTileControlAffinity.leading,
            // 왼쪽 배치 옵션
            contentPadding: EdgeInsets.only(left: 5),
          ),
          thin_sized_box_style(),
          CheckboxListTile(
            title: Text('이용약관 동의 (필수)'),
            value: _isChecked2,
            onChanged: _toggleCheck2,
            controlAffinity: ListTileControlAffinity.leading,
            // 왼쪽 배치 옵션
            contentPadding: EdgeInsets.only(left: 5),
            secondary: IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => TermConditionsAgreeDetailScreen()));
              },
              icon: Icon(
                Icons.arrow_forward_ios,
                size: 16,
              ),
            ),
          ),
          CheckboxListTile(
            title: Text('개인정보 수집 및 이용동의 (필수)'),
            value: _isChecked3,
            onChanged: _toggleCheck3,
            controlAffinity: ListTileControlAffinity.leading,
            // 왼쪽 배치 옵션
            contentPadding: EdgeInsets.only(left: 5),
            secondary: IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) =>
                        PersonalInformationCollectionDetailScreen()));
              },
              icon: Icon(
                Icons.arrow_forward_ios,
                size: 16,
              ),
            ),
          ),
          CheckboxListTile(
            title: Text('마케팅 목적 개인정보 수집 및 이용동의 (선택)'),
            value: _isChecked4,
            onChanged: _toggleCheck4,
            controlAffinity: ListTileControlAffinity.leading,
            // 왼쪽 배치 옵션
            contentPadding: EdgeInsets.only(left: 5),
            secondary: IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) =>
                        PersonalInformationMarketingPurposesDetailScreen()));
              },
              icon: Icon(
                Icons.arrow_forward_ios,
                size: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget RenderTermAgreeCategory() {
  //    return Padding(
  //      padding: const EdgeInsets.symmetric(horizontal: 10),
  //      child: Column(
  //        children: [
  //          TermAgreeCheckBox(
  //            title: '약관 전체 동의',
  //            value: _isChecked1!,
  //            all: true,
  //            initialValue: false,
  //            index: 0,
  //            onChanged: (bool? value) {
  //              setState(() {
  //                _isChecked1 = value;
  //                if (_isChecked1!) {
  //                  _onCheckboxChanged(true);
  //                }
  //              });
  //            },
  //          ),
  //          Divider(height: 10),
  //          TermAgreeCheckBox(
  //            title: '이용약관 동의 (필수)',
  //            value: _isChecked2!,
  //            all: false,
  //            index: 1,
  //            initialValue: false,
  //            onChanged: (bool? value) {
  //              setState(() {
  //                _isChecked2 = value;
  //                if (_isChecked2!) {
  //                  _onCheckboxChanged(true);
  //                }
  //              });
  //            },
  //          ),
  //          TermAgreeCheckBox(
  //            title: '개인정보 수집 및 이용동의 (필수)',
  //            value: _isChecked3!,
  //            all: false,
  //            initialValue: false,
  //            index: 2,
  //            onChanged: (bool? value) {
  //              setState(() {
  //                _isChecked3 = value;
  //                if (_isChecked3!) {
  //                  _onCheckboxChanged(true);
  //                }
  //              });
  //            },
  //          ),
  //          TermAgreeCheckBox(
  //            title: '마케팅 목적 개인정보 수집 및 이용동의 (선택)',
  //            value: _isChecked4!,
  //            all: false,
  //            initialValue: false,
  //            index: 3,
  //            onChanged: (bool? value) {
  //              setState(() {
  //                _isChecked4 = value;
  //                if (_isChecked4!) {
  //                  _onCheckboxChanged(true);
  //                }
  //              });
  //            },
  //          ),
  //        ],
  //      ),
  //    );
  //  }
  //
  // 버튼
  Widget RenderWithdrawalButton(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 70,
        child: ElevatedButton(
          child: Text('다음', style: big_long_button_text,),
          onPressed: (_isChecked1 == true) ||
                  (_isChecked2 == true && _isChecked3 == true)
              ? () {
                  // 모든 체크박스가 선택되어 있을 때만 실행됨
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            MobileNumberAuthenticationScreen()),
                  );
                }
              : null, // 모든 체크박스가 선택되어 있지 않으면 버튼이 비활성화됨
        ),
      ),
    );
  }
}

// 체크 박스 모델
class TermAgreeCheckBox extends StatefulWidget {
  List number = List.generate(3, (index) => index);

  final String title;
  final bool value;
  final ValueChanged<bool?> onChanged;
  final bool all;
  final bool initialValue;
  final int index;

  TermAgreeCheckBox({
    required this.title,
    required this.value,
    required this.onChanged,
    required this.all,
    required this.initialValue,
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  State<TermAgreeCheckBox> createState() => _TermAgreeCheckBoxState();
}

class _TermAgreeCheckBoxState extends State<TermAgreeCheckBox> {
  late bool value;
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            setState(() {
              isChecked = !isChecked;
            });
          },
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Row(
              children: [
                Checkbox(
                  value: isChecked,
                  onChanged: (newValue) {
                    setState(() {
                      isChecked = newValue!;
                    });
                  },
                ),
                Text(
                  widget.title,
                  style: sign_up_term_agree_category,
                ),
              ],
            ),
          ),
        ),
        widget.all == true
            ? const SizedBox()
            : IconButton(
                onPressed: () {
                  if (widget.index == 1) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => TermConditionsAgreeDetailScreen()));
                  }
                  if (widget.index == 2) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) =>
                            PersonalInformationCollectionDetailScreen()));
                  }
                  if (widget.index == 3) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) =>
                            PersonalInformationMarketingPurposesDetailScreen()));
                  }
                },
                icon: Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                ),
              ),
      ],
    );
  }
}
