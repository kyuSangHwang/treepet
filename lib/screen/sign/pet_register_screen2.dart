import 'package:flutter/material.dart';
import 'package:treepet/const/color.dart';
import 'package:treepet/const/style.dart';
import 'package:treepet/screen/sign/pet_register_complete_screen.dart';

class PetRegisterScreen2 extends StatefulWidget {
  const PetRegisterScreen2({Key? key}) : super(key: key);

  @override
  State<PetRegisterScreen2> createState() => _PetRegisterScreen2State();
}

class _PetRegisterScreen2State extends State<PetRegisterScreen2> {
  final List<String> _medicalHistoryList = [
    '선택해주세요',
    '감기',
    '몸살',
    '코로나',
    '골드 리트리버',
    '파피용'
  ];
  String _selectedMedicalHistory = '선택해주세요';

  final List<String> _AllergyList = [
    '선택해주세요',
    '감기',
    '몸살',
    '코로나',
    '골드 리트리버',
    '파피용'
  ];
  String _selectedAllergy = '선택해주세요';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PetRegisterScreen2AppBar(context),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    RenderTitle2(context),
                    SizedBox(height: 30),
                    RenderPetMedicalHistory(context),
                    SizedBox(height: 10),
                    RenderPetAllergy(context),
                    SizedBox(height: 20),
                    RenderProfileIntroduce(context),
                    SizedBox(height: 50),
                    RenderWarning(),
                    SizedBox(height: 10),
                    RenderOner(),
                    SizedBox(height: 20),
                    RenderRegisterNumber(),
                    SizedBox(height: 20),
                    RenderAdoptionRoute(),
                    SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
          RenderProfileRegisterButton2(context),
        ],
      ),
    );
  }

  AppBar PetRegisterScreen2AppBar(BuildContext context) {
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
        '반려동물 등록',
        style: TextStyle(color: BLACK_COLOR),
      ),
    );
  }

  // 추가 정보
  Widget RenderTitle2(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Text('추가 정보', style: pet_register_category_title),
    );
  }

  // 반려동물 병력
  Widget RenderPetMedicalHistory(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('병력 (선택)', style: pet_register_category_title),
          SizedBox(height: 5),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 60,
            child: DropdownButton(
              style: option_select,
              underline: Container(
                height: 1,
                color: Colors.black54,
              ),
              hint: Text('선택해주세요'),
              isExpanded: true,
              value: _selectedMedicalHistory,
              items: _medicalHistoryList.map((value) {
                return DropdownMenuItem(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedMedicalHistory = value!;
                });
              },
            ),
          )
        ],
      ),
    );
  }

  // 반려동물 알러지
  Widget RenderPetAllergy(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('병력 (선택)', style: pet_register_category_title),
          SizedBox(height: 5),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 60,
            child: DropdownButton(
              style: option_select,
              underline: Container(
                height: 1,
                color: Colors.black54,
              ),
              hint: Text('선택해주세요'),
              isExpanded: true,
              value: _selectedAllergy,
              items: _AllergyList.map((value) {
                return DropdownMenuItem(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedMedicalHistory = value!;
                });
              },
            ),
          )
        ],
      ),
    );
  }

  // 프로필 소개글
  Widget RenderProfileIntroduce(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('자기소개', style: pet_register_category_title),
          SizedBox(height: 10),
          TextFormField(
            minLines: 5,
            maxLines: 5,
            decoration: const InputDecoration(
              // border: OutlineInputBorder(
              //     borderRadius: BorderRadius.all(Radius.circular(20.0)),
              //     borderSide: BorderSide(color: Colors.grey)),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 1.5),
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 1.5),
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 경고 글자
  Widget RenderWarning() {
    return SizedBox(
        child: Text(
      '아래의 정보는 외부에 공개되지 않습니다',
      style: TextStyle(color: Colors.red),
    ));
  }

  // 반려동물 소유주
  Widget RenderOner() {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('소유주', style: pet_register_category_title),
          SizedBox(height: 5),
          TextFormField(
            decoration: InputDecoration(
              hintText: '반려동물의 소유주를 입력해주세요',
              hintStyle: register_profile_placeholder,
            ),

          ),
        ],
      ),
    );
  }

  // 반려동물 등록번호
  Widget RenderRegisterNumber() {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('등록번호', style: pet_register_category_title),
          SizedBox(height: 5),
          TextFormField(
            decoration: InputDecoration(
              hintText: '등록번호를 입력해주세요',
              hintStyle: register_profile_placeholder,
            ),

          ),
        ],
      ),
    );
  }

  // 반려동물 입양경로
  Widget RenderAdoptionRoute() {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('입양경로', style: pet_register_category_title),
          SizedBox(height: 5),
          TextFormField(
            decoration: InputDecoration(
              hintText: '입양경로를 입력해주세요',
              hintStyle: register_profile_placeholder,
            ),

          ),
        ],
      ),
    );
  }


  // 다음 버튼
  Widget RenderProfileRegisterButton2(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 70,
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => PetRegisterCompleteScreen()));
          },
          child: Text(
            '등록 완료',
            style: big_long_button_text,
          ),
        ),
      ),
    );
  }
}
