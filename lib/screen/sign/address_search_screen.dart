import 'package:flutter/material.dart';
import 'package:treepet/const/color.dart';
import 'package:treepet/const/style.dart';
import 'package:treepet/screen/sign/user_sign_up_complete_screen.dart';
// import 'package:kopo/kopo.dart';

class AddressSearchScreen extends StatefulWidget {
  const AddressSearchScreen({Key? key}) : super(key: key);

  @override
  State<AddressSearchScreen> createState() => _AddressSearchScreenState();
}

class _AddressSearchScreenState extends State<AddressSearchScreen> {
  String postCode = '-';
  String address = '-';
  String latitude = '-';
  String longitude = '-';
  String kakaoLatitude = '-';
  String kakaoLongitude = '-';

  String adressValue = "주소를 검색해주세요";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AddressSearchScreenAppBar(context),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(height: 20),
            RenderTitle(context),
            SizedBox(height: 20),
            RenderAddressSearchButton(context),
          ],
        ),
      ),
    );
  }

  AppBar AddressSearchScreenAppBar(BuildContext context) {
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
        '주소 검색',
        style: TextStyle(color: BLACK_COLOR),
      ),
    );
  }

  Widget RenderTitle(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.92,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('회원님의 주소를 입력해주세요'),
          SizedBox(height: 5),
          Text('다른 회원들에게는 지역만 공개됩니다. ex)서울,인천,'),

          // ElevatedButton(
          //   onPressed: () async {
          //     var result = await Navigator.of(context).push(
          //         MaterialPageRoute(
          //             builder: (context) => Kopo()
          //         )
          //     );
          //
          //     if(result != null){
          //       setState(() {
          //         this.adressValue = result;
          //       });
          //     }
          //   },
          //   child: Text('주소검색'),
          // ),
        ],
      ),
    );
  }

  Widget RenderAddressSearchButton(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 70,
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => UserSignUpCompleteScreen()));
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
