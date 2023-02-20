import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:treepet/const/color.dart';
import 'package:treepet/const/style.dart';
import 'package:intl/intl.dart';
import 'package:treepet/screen/sign/pet_register_screen2.dart';

class PetRegisterScreen extends StatefulWidget {
  PetRegisterScreen({Key? key}) : super(key: key);

  @override
  State<PetRegisterScreen> createState() => _PetRegisterScreenState();
}

class _PetRegisterScreenState extends State<PetRegisterScreen> {
  int selectedPetTypeButtonIndex = 0;
  int selectedPetSexButtonIndex = 0;
  int selectedPetNeuteredButtonIndex = 0;
  int selectedPetVaccinationButtonIndex = 0;

  TextEditingController tec = TextEditingController();

  // final weightFormat = NumberFormat('##,#');

  final List<String> _breedList = ['선택해주세요','말티즈', '비숑', '시츄', '골드 리트리버', '파피용'];
  String _selectedBreed = '선택해주세요';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PetRegisterScreenAppBar(context),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      RenderTitle(context),
                      SizedBox(height: 10),
                      CircleAvatar(radius: 60),
                      SizedBox(height: 20),
                      RenderPetType(context),
                      SizedBox(height: 20),
                      RenderPetBreed(context),
                      SizedBox(height: 20),
                      RenderPetName(context),
                      SizedBox(height: 20),
                      RenderPetSex(context),
                      SizedBox(height: 20),
                      RenderPetNeutered(context),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          RenderPetWeight(context),
                        ],
                      ),
                      SizedBox(height: 20),
                      RenderPetVaccination(context),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
            RenderProfileRegisterButton(context),
          ],
        ),
      ),
    );
  }

  AppBar PetRegisterScreenAppBar(BuildContext context) {
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

  Widget RenderTitle(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Text('기본 정보', style: pet_register_category_title),
    );
  }

  // 반려동물 타입 (종류)
  Widget RenderPetType(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('반려동물', style: pet_register_category_title),
          SizedBox(height: 5),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedPetTypeButtonIndex = 1;
                      });
                    },
                    child: Text('강아지', style: pet_register_category_button),
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      foregroundColor: selectedPetTypeButtonIndex == 1
                          ? WHITE_COLOR
                          : Colors.grey[700],
                      backgroundColor: selectedPetTypeButtonIndex == 1
                          ? Colors.green
                          : Colors.grey[700],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedPetTypeButtonIndex = 2;
                      });
                    },
                    child: Text('고양이', style: pet_register_category_button),
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      foregroundColor: selectedPetTypeButtonIndex == 2
                          ? WHITE_COLOR
                          : Colors.grey[700],
                      backgroundColor: selectedPetTypeButtonIndex == 2
                          ? Colors.green
                          : Colors.grey[700],
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  // 반려동물 품종
  Widget RenderPetBreed(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('품종', style: pet_register_category_title),
          SizedBox(height: 5),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 60,
            child: DropdownButton(
              style: option_select,
              underline: Container(height: 1, color: Colors.black54,),
              hint: Text('선택해주세요'),
              isExpanded: true,
              value: _selectedBreed,
              items: _breedList.map((value) {
                return DropdownMenuItem(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedBreed = value!;
                });
              },
            ),
          )
        ],
      ),
    );
  }

  // 반려동물 이름
  Widget RenderPetName(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('이름', style: pet_register_category_title),
          SizedBox(height: 5),
          TextFormField(
            style: pet_name,
            decoration: InputDecoration(
              hintText: '이름을 입력하세요',
            ),
          ),
        ],
      ),
    );
  }

  // 반려동물 성별
  Widget RenderPetSex(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('성별', style: pet_register_category_title),
          SizedBox(height: 5),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedPetSexButtonIndex = 1;
                      });
                    },
                    child: Text('남아', style: pet_register_category_button),
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      foregroundColor: selectedPetSexButtonIndex == 1
                          ? WHITE_COLOR
                          : Colors.grey[700],
                      backgroundColor: selectedPetSexButtonIndex == 1
                          ? Colors.green
                          : Colors.grey[700],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedPetSexButtonIndex = 2;
                      });
                    },
                    child: Text('여아', style: pet_register_category_button),
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      foregroundColor: selectedPetSexButtonIndex == 2
                          ? WHITE_COLOR
                          : Colors.grey[700],
                      backgroundColor: selectedPetSexButtonIndex == 2
                          ? Colors.green
                          : Colors.grey[700],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 반려동물 몸무게
  Widget RenderPetWeight(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('몸무게', style: pet_register_category_title),
          SizedBox(height: 5),
          TextFormField(
            controller: tec,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [
              LengthLimitingTextInputFormatter(4),
            ],
            style: pet_weight,
            decoration: InputDecoration(
                hintText: '3.2',
                suffixText: "Kg",
                helperText: '소수점 첫째 자리까지 입력 가능합니다',
                helperStyle: pet_weight_hel),
          ),
        ],
      ),
    );
  }

  // 반려동물 중성화
  Widget RenderPetNeutered(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('성별', style: pet_register_category_title),
          SizedBox(height: 5),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedPetNeuteredButtonIndex = 1;
                      });
                    },
                    child: Text('중성화 전', style: pet_register_category_button),
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      foregroundColor: selectedPetNeuteredButtonIndex == 1
                          ? WHITE_COLOR
                          : Colors.grey[700],
                      backgroundColor: selectedPetNeuteredButtonIndex == 1
                          ? Colors.green
                          : Colors.grey[700],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedPetNeuteredButtonIndex = 2;
                      });
                    },
                    child: Text('중성화 완료', style: pet_register_category_button),
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      foregroundColor: selectedPetNeuteredButtonIndex == 2
                          ? WHITE_COLOR
                          : Colors.grey[700],
                      backgroundColor: selectedPetNeuteredButtonIndex == 2
                          ? Colors.green
                          : Colors.grey[700],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 반려동물 예방접종
  Widget RenderPetVaccination(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('성별', style: pet_register_category_title),
          SizedBox(height: 5),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedPetVaccinationButtonIndex = 1;
                      });
                    },
                    child: Text('접종 전', style: pet_register_category_button),
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      foregroundColor: selectedPetVaccinationButtonIndex == 1
                          ? WHITE_COLOR
                          : Colors.grey[700],
                      backgroundColor: selectedPetVaccinationButtonIndex == 1
                          ? Colors.green
                          : Colors.grey[700],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedPetVaccinationButtonIndex = 2;
                      });
                    },
                    child: Text('접종 완료', style: pet_register_category_button),
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      foregroundColor: selectedPetVaccinationButtonIndex == 2
                          ? WHITE_COLOR
                          : Colors.grey[700],
                      backgroundColor: selectedPetVaccinationButtonIndex == 2
                          ? Colors.green
                          : Colors.grey[700],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget RenderProfileRegisterButton(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 70,
        child: ElevatedButton(
          onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => PetRegisterScreen2()));
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
