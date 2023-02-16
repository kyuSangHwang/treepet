import 'package:flutter/material.dart';
import 'package:treepet/component/custom_text_field.dart';
import 'package:treepet/const/color.dart';
import 'package:treepet/const/style.dart';

class SettingsWithdrawalScreen extends StatefulWidget {
  const SettingsWithdrawalScreen({Key? key}) : super(key: key);

  @override
  State<SettingsWithdrawalScreen> createState() =>
      _SettingsWithdrawalScreenState();
}

class _SettingsWithdrawalScreenState extends State<SettingsWithdrawalScreen> {
  late String option = '1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SettingWithdrawalScreenAppBar(context),
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
                    RenderWithdrawalTitle(),
                    RenderWithdrawalCategory(),
                    Divider(height: 40),
                    RenderWithdrawalWrite(),
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

  AppBar SettingWithdrawalScreenAppBar(BuildContext context) {
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
        '회원탈퇴',
        style: TextStyle(color: BLACK_COLOR),
      ),
    );
  }

  Widget RenderWithdrawalTitle() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 5, left: 16, right: 16),
      child: Row(
        children: [
          Text(
            '트리펫이 더 나은 서비스를 제공하기 위해 작성해주세요',
            style: withdrawal_title,
          ),
        ],
      ),
    );
  }

  Widget RenderWithdrawalCategory() {
    return Column(
      children: [
        WithdrawalCategory(title: '탈퇴 후 재가입을 위해서', value: '1'),
        WithdrawalCategory(title: '앱을 사용하지 않아서', value: '2'),
        WithdrawalCategory(title: '서비스 및 고객지원이 만족스럽지 못해서', value: '3'),
        WithdrawalCategory(title: '타 어플의 유사 서비스를 이용하기 위해서', value: '4'),
        WithdrawalCategory(title: '오류가 너무 많아서', value: '5'),
        WithdrawalCategory(title: '기타', value: '6'),
      ],
    );
  }

  WithdrawalCategory({required String title, required value}) {
    return RadioListTile(
      title: Text(
        title,
        style: withdrawal_category,
      ),
      value: value,
      groupValue: option,
      onChanged: (value) {
        setState(() {
          option = value!;
        });
      },
    );
  }

  Widget RenderWithdrawalWrite() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0,right: 16.0, bottom: 20),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black26),
          borderRadius: BorderRadius.circular(20)
        ),
        child: CustomTextField(
          isTitle: false,
          placeHolder: '트리펫에게 바라는 점을 남겨주세요.\n글자 수 제한 500자',
        ),
      ),
    );
  }

  Widget RenderWithdrawalButton(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 70,
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            '탈퇴하기',
            style: big_long_button_text,
          ),
        ),
      ),
    );
  }
}
