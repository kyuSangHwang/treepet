import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:treepet/component/wedding_component.dart';
import 'package:treepet/screen/family/wedding/wedding_post_create_screen_2.dart';
import 'package:treepet/screen/family/wedding/wedding_post_create_screen_3.dart';
import '../../../const/style.dart';

class WeddingPostCreateScreen1 extends StatefulWidget {
  const WeddingPostCreateScreen1({Key? key}) : super(key: key);

  @override
  State<WeddingPostCreateScreen1> createState() =>
      _WeddingPostCreateScreen1State();
}

class _WeddingPostCreateScreen1State extends State<WeddingPostCreateScreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WeddingPostCreateAppBar(context),
      body: WeddingPostCreateScreenBody(context),
      bottomNavigationBar: WeddingBottomAppBarButton(context, const WeddingPostCreateScreen2()),
    );
  }

  /// 반려동물 웨딩 등록 시 보여지는 첫 번째 화면의 내용
  Widget WeddingPostCreateScreenBody(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            const WeddingCreateTitleForm(),
            WeddingPetCircleAvatar(),
            WeddingPostCreateScreenBodyContent(),
          ],
        ),
      ),
    );
  }

  /// 화면에 반려동물 프로필 이미지 [CircleAvatar]에 [Padding]으로 감싸서 return
  Padding WeddingPetCircleAvatar() {
    return const Padding(
      padding: EdgeInsets.fromLTRB(0, 10.0, 0, 30.0),
      child: CircleAvatar(
        backgroundImage: AssetImage('asset/image/mongSil.png'),
        radius: 110,
      ),
    );
  }

  /// 반려동물의 기본 정보를 [SizedBox]로 width, height 지정해서 return
  SizedBox WeddingPostCreateScreenBodyContent() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.80,
      height: 250.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          WeddingPetInfomation("이름", "종", "품종", "나이", "몸무게", "털색"),
          WeddingPetInfomation("몽실이", "강아지", "푸들", "1살", "1.65 Kg", "흰색"),
        ],
      ),
    );
  }

  /// 반려동물의 정보를 보여주는 Widget
  ///
  /// [petName] String, 반려동물 이름
  /// [petSpecies] String, 반려동물 종
  /// [petBreedOfPets] String, 반려동물 품종
  /// [petAge] String, 반려동물 나이 ( "*살"로 표현 )
  /// [petWeight] String, 반려동물 몸무게
  /// [petHairColor] String, 반려동물 털 색
  Column WeddingPetInfomation(String petName, String petSpecies, String petBreedOfPets, String petAge, String petWeight, String petHairColor) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          petName,
          style: wedding_post_create_20_400_012,
        ),
        Text(
          petSpecies,
          style: wedding_post_create_20_400_012,
        ),
        Text(
          petBreedOfPets,
          style: wedding_post_create_20_400_012,
        ),
        Text(
          petAge,
          style: wedding_post_create_20_400_012,
        ),
        Text(
          petWeight,
          style: wedding_post_create_20_400_012,
        ),
        Text(
          petHairColor,
          style: wedding_post_create_20_400_012,
        ),
      ],
    );
  }

}
