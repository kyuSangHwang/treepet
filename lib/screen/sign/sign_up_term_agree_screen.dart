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
  bool checkboxValue1 = false;
  bool checkboxValue2 = false;
  bool checkboxValue3 = false;
  bool checkboxValue4 = false;

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
          TermAgreeCheckBox(
            title: '약관 전체 동의',
            value: checkboxValue1,
            all: true,
            initialValue: false,
            index: 0,
            onChanged: (bool? value) {},
          ),
          Divider(height: 10),
          TermAgreeCheckBox(
            title: '이용약관 동의 (필수)',
            value: checkboxValue2,
            all: false,
            index: 1,
            initialValue: false,

            onChanged: (bool? value) {},
          ),
          TermAgreeCheckBox(
            title: '개인정보 수집 및 이용동의 (필수)',
            value: checkboxValue3,
            all: false,
            initialValue: false,
            index: 2,
            onChanged: (bool? value) {},
          ),
          TermAgreeCheckBox(
            title: '마케팅 목적 개인정보 수집 및 이용동의 (선택)',
            value: checkboxValue4,
            all: false,
            initialValue: false,
            index: 3,
            onChanged: (bool? value) {},
          ),
        ],
      ),
    );
  }

  Widget RenderTermAgree({required String title}) {
    return Row(
      children: [
        Checkbox(
          value: checkboxValue1,
          onChanged: (bool? newValue) {
            setState(() {
              checkboxValue1 = newValue!;
            });
            print(checkboxValue1);
          },
        ),
        Text(title),
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
                builder: (_) => MobileNumberAuthenticationScreen()));
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
                  if(widget.index == 1) {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) => TermConditionsAgreeDetailScreen()));
                  }
                  if(widget.index == 2) {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) => PersonalInformationCollectionDetailScreen()));
                  }
                  if(widget.index == 3) {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) => PersonalInformationMarketingPurposesDetailScreen()));
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
