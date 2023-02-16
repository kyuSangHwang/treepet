import 'package:flutter/material.dart';
import 'package:treepet/const/color.dart';

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
        ],
      ),
    );
  }
}

