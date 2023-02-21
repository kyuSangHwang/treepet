import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:treepet/component/calender.dart';
import 'package:treepet/component/wedding_component.dart';
import 'package:treepet/component/wedding_component_functions.dart';
import 'package:treepet/const/style.dart';
import 'package:treepet/screen/family/wedding/wedding_post_create_screen_4.dart';
import 'dart:io';
import 'package:http/http.dart' as http;

class WeddingPostCreateScreen3 extends StatefulWidget {
  const WeddingPostCreateScreen3({Key? key}) : super(key: key);

  @override
  State<WeddingPostCreateScreen3> createState() =>
      _WeddingPostCreateScreen3State();
}

class _WeddingPostCreateScreen3State extends State<WeddingPostCreateScreen3> {
  int selectedMenstruationButtonIndex = 0;
  int selectedMenstrualCycleButtonIndex = 0;
  int selectedPedigreeBookButtonIndex = 0;
  int selectedWeddingDesiredPlaceButtonIndex = 0;

  bool isMenstruationStartedRowVisible = false;
  int checkMenstruationStartedRowVisibility = 0;

  bool isMenstrualCycleStartedRowVisible = false;
  int checkMenstrualCycleStartedRowVisibility = 0;
  final List<String> _numbers = createNumberList(1, 30);
  String _selectedNumber = '1';

  bool isPedigreeBookRowVisible = false;
  int checkPedigreeBookRowVisibility = 0;
  List<XFile> _imageList = [];
  List<String> _selectedImages = [];

  DateTime selectedDay = DateTime.utc(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );
  DateTime focusedDay = DateTime.now();
  String formattedDate = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: WeddingPostCreateAppBar(context),
      body: WeddingPostCreateScreen3Body(),
      bottomNavigationBar: WeddingBottomAppBarButton(context, "다 음", MyHomePage11()),
    );
  }

  /// 반려동물 웨딩 등록 시 보여지는 세 번째 화면의 내용
  SingleChildScrollView WeddingPostCreateScreen3Body() {
    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            const WeddingCreateTitleForm(),
            Expanded(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Column(
                  children: [
                    WeddingMenstruationArea(), // 꽃도장
                    const SizedBox(height: 20.0),
                    WeddingMenstrualCycleArea(), // 꽃 도장 주기
                    const SizedBox(height: 20.0),
                    WeddingPedigreeBookArea(), // 혈통서
                    const SizedBox(height: 20.0),
                    WeddingDesiredArea(), // 웨딩 희망장소
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// "꽃 도장" 유무를 선택하는 Widget
  Row WeddingMenstruationArea() {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            categoryTitle("꽃 도장"),
            Row(
              children: [
                CategoryButton(selectedMenstruationButtonIndex, "selectedMenstruationButtonIndex",  1, "하고 있음", 1),
                const SizedBox(width: 10.0),
                CategoryButton(selectedMenstruationButtonIndex, "selectedMenstruationButtonIndex",  2, "하지 않음", 2),
              ],
            ),
            const SizedBox(height: 15.0),
            WeddingMenstruationStartedArea(),
          ],
        ),
      ],
    );
  }

  /// "꽃 도장 주기" 유무를 선택하는 Widget
  Row WeddingMenstrualCycleArea() {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            categoryTitle("꽃 도장 주기"),
            Row(
              children: [
                CategoryButton(selectedMenstrualCycleButtonIndex, "selectedMenstrualCycleButtonIndex", 1, "알고 있음", 1),
                const SizedBox(width: 10.0),
                CategoryButton(selectedMenstrualCycleButtonIndex, "selectedMenstrualCycleButtonIndex", 2, "모름", 2),
              ],
            ),
            const SizedBox(height: 15.0),
            WeddingMenstrualCycleInsertArea(),
          ],
        ),
      ],
    );
  }

  /// "혈통서" 유무를 선택하는 Widget
  Row WeddingPedigreeBookArea() {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            categoryTitle("혈통서"),
            Row(
              children: [
                CategoryButton(selectedPedigreeBookButtonIndex, "selectedPedigreeBookButtonIndex",  1, "있음", 1),
                const SizedBox(width: 10.0),
                CategoryButton(selectedPedigreeBookButtonIndex, "selectedPedigreeBookButtonIndex",  2, "없음", 2),
              ],
            ),
            const SizedBox(height: 15.0),
            WeddingPedigreeBookImageArea(),
          ],
        ),
      ],
    );
  }

  /// "웨딩 희망장소" 카테고리명과 옵션 버튼이 있는 Widget
  ///
  /// 옵션 Button들과 Title을 return.
  Row WeddingDesiredArea() {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            categoryTitle("웨딩 희망장소"),
            Row(
              children: [
                CategoryButton(selectedWeddingDesiredPlaceButtonIndex, "selectedWeddingDesiredPlaceButtonIndex", 1, "수컷네 가정"),
                const SizedBox(width: 10.0),
                CategoryButton(selectedWeddingDesiredPlaceButtonIndex, "selectedWeddingDesiredPlaceButtonIndex", 2, "암컷네 가정"),
                const SizedBox(width: 10.0),
                CategoryButton(selectedWeddingDesiredPlaceButtonIndex, "selectedWeddingDesiredPlaceButtonIndex", 3, "상관 없음"),
              ],
            ),
          ],
        ),
      ],
    );
  }

  /// "꽃 도장" 유무에 따라 "꽃 도장 시작일" 카테고리가 보여지는 Widget
  Visibility WeddingMenstruationStartedArea() {
    return Visibility(
      visible: isMenstruationStartedRowVisible,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(height: 20.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              categoryTitle("꽃 도장 시작일"),
              Row(
                children: [
                  Text(
                    formattedDate == "" ? "날짜를 선택해주세요." : formattedDate,
                    style: (formattedDate == "" ? wedding_post_create_14_300_012_f : wedding_post_create_14_300_012),
                  ),
                  const SizedBox(width: 10.0),
                  Row(
                    children: [
                      TextButton(
                        child: const Icon(
                          Icons.calendar_today,
                          size: 20.0,
                        ),
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return SizedBox(
                                height: MediaQuery.of(context).size.height * 0.5,
                                /// TODO: 1. 캘린더에서 날짜 클릭하면 클릭한 날 on 되게 하기
                                /// TODO: 2. 꽃도장 -> 하고 있음 으로 되어 있는데 시작일 선택 안되어 있는 것 -> 다음 버튼 클릭할 때 Null Check
                                child: Calendar(
                                  selectedDay: selectedDay,
                                  focusedDay: focusedDay,
                                  onDaySelected: onDaySelected,
                                ),
                              );
                            },
                          );
                        },
                      ),
                      const SizedBox(width: 10.0),
                      TextButton(
                        child: const Icon(
                          Icons.close,
                          size: 20.0,
                        ),
                        onPressed: () {
                          formattedDate = "";
                          _updateButtonState("selectedMenstruationButtonIndex", 2);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// "꽃 도장 주기" 유무에 따라 "평균 주기일 수" 카테고리가 보여지는 Widget
  Visibility WeddingMenstrualCycleInsertArea() {
    return Visibility(
      visible: isMenstrualCycleStartedRowVisible,
      child: Row(
        children: [
          categoryTitle("평균 주기일 수"),
          SizedBox(
            width: 100.0,
            height: 50,
            /// TODO: Dropdown 안에 숫자 옆에 "일" 붙이기
            child: DropdownButton(
              isExpanded: true,
              menuMaxHeight: 300,
              alignment: AlignmentDirectional.topEnd,
              value: _selectedNumber,
              items: _numbers.map((String number) {
                return DropdownMenuItem<String>(
                  value: number,
                  child: Center(child: Text(number)),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _selectedNumber = newValue.toString();
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  /// "혈통성" 유무에 따라 "평균 주기일 수" 카테고리가 보여지는 Widget
  Visibility WeddingPedigreeBookImageArea() {
    return Visibility(
      visible: isPedigreeBookRowVisible,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // const SizedBox(height: 20.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              categoryTitle("혈통서 이미지 추가", 130.0),
              const SizedBox(height: 10),
              Row(
                children: [
                  const SizedBox(width: 8),
                  //TODO : 상우가 기능 개발 마무리하면 옮겨 넣기
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: _selectImage,
                        child: const Text('Select Image'),
                      ),
                      SizedBox(
                        height: 100,
                        width: (MediaQuery.of(context).size.width * 0.9) * 0.1,
                        child: Visibility(
                          visible: _selectedImages.isNotEmpty,
                          child: GridView.builder(
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1,
                            ),
                            itemCount: _selectedImages.length,
                            itemBuilder: (context, index) {
                              return Image.network(_selectedImages[index]);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _selectImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImages.add(pickedFile.path);
      });
    } else if (kDebugMode) {
      print('이미지를 선택하지 않았습니다.');
    }
  }

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageList.add(pickedFile);
      });
    } else if (kDebugMode) {
      print('이미지를 선택하지 않았습니다.');
    }
  }

  /// 카테고리 버튼으로 버튼의 이름을 넣고 클릭 시 값과 색을 변경 해준다.
  ///
  /// [beforeButtonIndex] int, Buttons의 이전 index.
  /// [buttonName] String, 변경 하려는 버튼의 이름.
  /// [buttonIndex] int, 변경 하려는 버튼의 상태를 나타내는 index.
  /// [buttonContent] String, 버튼에 들어가는 내용.
  /// [visibleIndex] int, 버튼의 o/x에 따라 visibilityWidget을 결정짖는 index.
  ///
  /// [Return] 값과 색이 변경된 [OutlinedButton]을 [SizedBox]로 return.
  SizedBox CategoryButton(int beforeButtonIndex, String buttonName,  int buttonIndex, String buttonContent, [int? visibleIndex]) {
    return SizedBox(
      width: 97.0,
      height: 35.0,
      child: OutlinedButton(
        onPressed: () {
          setState(() {
            if (visibleIndex != null) {
              _updateButtonState(buttonName, buttonIndex, visibleIndex);
            } else {
              _updateButtonState(buttonName, buttonIndex);
            }
          });
        },
        style: OutlinedButton.styleFrom(
          foregroundColor: beforeButtonIndex == buttonIndex ? Colors.white : Colors.grey[700],
          backgroundColor: beforeButtonIndex == buttonIndex ? Colors.green : Colors.grey[300],
        ),
        child: Text(buttonContent),
      ),
    );
  }

  /// 선택한 날짜를 selectedDay, focusedDay에 넣주고 formatDate에는 form에 맞게 넣어준다.
  ///
  /// [selectedDay] DateTime, 선택된 날짜.
  /// [focusedDay] DateTime, 현재 focus된 날짜.
  onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      this.selectedDay = selectedDay;
      this.focusedDay = selectedDay;
      formattedDate = DateFormat('yyyy년 MM월 dd일').format(selectedDay);
    });
  }

  void toggleRowVisibility1() {
    setState(() {
      if (checkMenstrualCycleStartedRowVisibility == 1 &&
          isMenstrualCycleStartedRowVisible == false) {
        isMenstrualCycleStartedRowVisible = !isMenstrualCycleStartedRowVisible;
      } else if (checkMenstrualCycleStartedRowVisibility == 2 &&
          isMenstrualCycleStartedRowVisible == true) {
        isMenstrualCycleStartedRowVisible = !isMenstrualCycleStartedRowVisible;
      }
    });
  }

  /// Button의 상태는 update해준다.
  ///
  /// [name] String, button index의 이름
  /// [value] int, 변경해 줄 button index
  /// [visibleValue] : visibilityWidget의 결정 index
  void _updateButtonState(String name, int value, [int? visibleValue]) {
    setState(() {
      if (visibleValue != null) {
        switch (name) {
          case "selectedMenstruationButtonIndex" :
            selectedMenstruationButtonIndex = value;
            checkMenstruationStartedRowVisibility = visibleValue;
            if (checkMenstruationStartedRowVisibility == 1 && isMenstruationStartedRowVisible == false) {
              isMenstruationStartedRowVisible = !isMenstruationStartedRowVisible;
            } else if (checkMenstruationStartedRowVisibility == 2 && isMenstruationStartedRowVisible == true) {
              isMenstruationStartedRowVisible = !isMenstruationStartedRowVisible;
            }
            break;
          case "selectedMenstrualCycleButtonIndex" :
            selectedMenstrualCycleButtonIndex = value;
            checkMenstrualCycleStartedRowVisibility = visibleValue;
            if (checkMenstrualCycleStartedRowVisibility == 1 && isMenstrualCycleStartedRowVisible == false) {
              isMenstrualCycleStartedRowVisible = !isMenstrualCycleStartedRowVisible;
            } else if (checkMenstrualCycleStartedRowVisibility == 2 && isMenstrualCycleStartedRowVisible == true) {
              isMenstrualCycleStartedRowVisible = !isMenstrualCycleStartedRowVisible;
            }
            break;
          case "selectedPedigreeBookButtonIndex" :
            selectedPedigreeBookButtonIndex = value;
            checkPedigreeBookRowVisibility = visibleValue;
            if (checkPedigreeBookRowVisibility == 1 && isPedigreeBookRowVisible == false) {
              isPedigreeBookRowVisible = !isPedigreeBookRowVisible;
            } else if (checkPedigreeBookRowVisibility == 2 && isPedigreeBookRowVisible == true) {
              isPedigreeBookRowVisible = !isPedigreeBookRowVisible;
            }
            break;
          default:
            if (kDebugMode) {
              print('Error');
            }
        }
      } else if (name == "selectedWeddingDesiredPlaceButtonIndex") {
        selectedWeddingDesiredPlaceButtonIndex = value;
      }
    });
  }

}