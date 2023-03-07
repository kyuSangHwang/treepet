import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:treepet/component/wedding_component.dart';
import 'package:treepet/const/style.dart';
import 'package:treepet/layout/screen_layout.dart';
import 'package:treepet/screen/family/wedding/wedding_screen.dart';

class WeddingFilterScreen extends StatefulWidget {
  const WeddingFilterScreen({Key? key}) : super(key: key);

  @override
  State<WeddingFilterScreen> createState() => _WeddingFilterScreenState();
}

class _WeddingFilterScreenState extends State<WeddingFilterScreen> {
  int _selectedDogButtonIndex = 0;
  int _selectedCatButtonIndex = 0;
  int _selectedDogCatButtonIndex = 0;
  int _selectedBrideButtonIndex = 0;
  int _selectedGroomButtonIndex = 0;
  int _selectedPedigreeYesButtonIndex = 0;
  int _selectedPedigreeNoButtonIndex = 0;
  int _selectedMenstruationYesButtonIndex = 0;
  int _selectedMenstruationNoButtonIndex = 0;
  int _selectedBrideHomeButtonIndex = 0;
  int _selectedGroomHomeButtonIndex = 0;
  int _selectedAnywhereHomeButtonIndex = 0;

  final List<String> _breedList = ['선택해주세요', '말티즈', '비숑', '시츄', '골드 리트리버', '파피용'];
  String _selectedBreed = '선택해주세요';
  final List<String> _petAgeRangeList1 = ['나이 선택', '1개월', '2개월', '3개월', '4개월', '5개월', '6개월', '7개월', '8개월', '9개월', '10개월', '11개월','1살', '2살', '3살'];
  String _selectedPetAgeRanges1 = '나이 선택';
  final List<String> _petAgeRangeList2 = ['나이 선택', '1개월', '2개월', '3개월', '4개월', '5개월', '6개월', '7개월', '8개월', '9개월', '10개월', '11개월','1살', '2살', '3살'];
  String _selectedPetAgeRanges2 = '나이 선택';
  final List<String> _petWeightRangeList1 = ['몸무게 선택', '1개월', '2개월', '3개월', '4개월', '5개월', '6개월', '7개월', '8개월', '9개월', '10개월', '11개월','1살', '2살', '3살'];
  String _selectedPetWeightRanges1 = '몸무게 선택';
  final List<String> _petWeightRangeList2 = ['몸무게 선택', '1개월', '2개월', '3개월', '4개월', '5개월', '6개월', '7개월', '8개월', '9개월', '10개월', '11개월','1살', '2살', '3살'];
  String _selectedPetWeightRanges2 = '몸무게 선택';
  final List<String> _petHairColorRangeList = ['선택해주세요', '흰색', '검정색', '갈색', '연한 갈색', '흰색, 검정색'];
  String _selectedPetHairColorRanges = '선택해주세요';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenLayout(
        title: '신랑&신부 찾기 필터',
        body: _WeddingFilterScreenBody(context),
        screenKey: 'weddingFilter',
        bottomNavigationBar: WeddingBottomAppBarButton(context, "적 용", const WeddingScreen()),
      ),
    );
  }

  SingleChildScrollView _WeddingFilterScreenBody(context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.85,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  categoryTitle("반려동물 종", null, 25.0),
                  Row(
                    children: [
                      _CategoriesButtons("반려견", "selectedDogButtonIndex", _selectedDogButtonIndex, 1),
                      const SizedBox(width: 10.0),
                      _CategoriesButtons("반려묘", "selectedCatButtonIndex", _selectedCatButtonIndex, 2),
                      const SizedBox(width: 10.0),
                      _CategoriesButtons("전체", "selectedDogCatButtonIndex", _selectedDogCatButtonIndex, 3),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.85,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  categoryTitle("반려동물 품종", null, 15.0),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.85,
                    height: 60,
                    child: DropdownButton(
                      style: option_select_k,
                      underline: Container(height: 1, color: Colors.black54,),
                      hint: const Text('선택해주세요'),
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
                  ),
                  const SizedBox(height: 20.0),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.85,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  categoryTitle("반려동물 성별", null, 25.0),
                  Row(
                    children: [
                      _CategoriesButtons("신랑(수컷)", "selectedBrideButtonIndex", _selectedBrideButtonIndex, 1),
                      const SizedBox(width: 10.0),
                      _CategoriesButtons("신부(암컷)", "selectedGroomButtonIndex", _selectedGroomButtonIndex, 2),
                      const SizedBox(width: 10.0),
                      _CategoriesButtons("전체", "selectedGroomButtonIndex", _selectedGroomButtonIndex, 3),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.85,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  categoryTitle("반려동물 나이", null, 15.0),
                Row(
                  children: [
                    SizedBox(
                      width: (MediaQuery.of(context).size.width * 0.85) * 0.3,
                      height: 60,
                      child: DropdownButton<String>(
                        style: option_select_k,
                        underline: Container(height: 1, color: Colors.black54),
                        isExpanded: true,
                        value: _selectedPetAgeRanges1,
                        items: _petAgeRangeList1.map((value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            _selectedPetAgeRanges1 = newValue!;
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: 30.0),
                    const Text("~", style: TextStyle(fontSize: 20.0),),
                    const SizedBox(width: 30.0),
                    SizedBox(
                      width: (MediaQuery.of(context).size.width * 0.85) * 0.3,
                      height: 60,
                      child: DropdownButton<String>(
                        style: option_select_k,
                        underline: Container(height: 1, color: Colors.black54),
                        isExpanded: true,
                        value: _selectedPetAgeRanges2,
                        items: _petAgeRangeList2.map((value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            _selectedPetAgeRanges2 = newValue!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                  const SizedBox(height: 20.0),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.85,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  categoryTitle("반려동물 몸무게", null, 15.0),
                  Row(
                    children: [
                      SizedBox(
                        width: (MediaQuery.of(context).size.width * 0.85) * 0.3,
                        height: 60,
                        child: DropdownButton<String>(
                          style: option_select_k,
                          underline: Container(height: 1, color: Colors.black54),
                          isExpanded: true,
                          value: _selectedPetWeightRanges1,
                          items: _petWeightRangeList1.map((value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              _selectedPetWeightRanges1 = newValue!;
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 30.0),
                      const Text("~", style: TextStyle(fontSize: 20.0),),
                      const SizedBox(width: 30.0),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width * 0.85) * 0.3,
                        height: 60,
                        child: DropdownButton<String>(
                          style: option_select_k,
                          underline: Container(height: 1, color: Colors.black54),
                          isExpanded: true,
                          value: _selectedPetWeightRanges2,
                          items: _petWeightRangeList2.map((value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              _selectedPetWeightRanges2 = newValue!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.85,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  categoryTitle("반려동물 털색", null, 15.0),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.85,
                    height: 60,
                    child: DropdownButton(
                      style: option_select_k,
                      underline: Container(height: 1, color: Colors.black54,),
                      hint: const Text('선택해주세요'),
                      isExpanded: true,
                      value: _selectedPetHairColorRanges,
                      items: _petHairColorRangeList.map((value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedPetHairColorRanges = value!;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 20.0),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.85,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  categoryTitle("반려동물 혈통서 유무", 130.0, 25.0),
                  Row(
                    children: [
                      _CategoriesButtons("유", "selectedPedigreeYesButtonIndex", _selectedPedigreeYesButtonIndex, 1),
                      const SizedBox(width: 10.0),
                      _CategoriesButtons("무", "selectedPedigreeNoButtonIndex", _selectedPedigreeNoButtonIndex, 2),
                      const SizedBox(width: 10.0),
                      _CategoriesButtons("전체", "selectedPedigreeNoButtonIndex", _selectedPedigreeNoButtonIndex, 3),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.85,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  categoryTitle("반려동물 꽃도장 유무", 130.0, 25.0),
                  Row(
                    children: [
                      _CategoriesButtons("유", "selectedMenstruationYesButtonIndex", _selectedMenstruationYesButtonIndex, 1),
                      const SizedBox(width: 10.0),
                      _CategoriesButtons("무", "selectedMenstruationNoButtonIndex", _selectedMenstruationNoButtonIndex, 2),
                      const SizedBox(width: 10.0),
                      _CategoriesButtons("전체", "selectedMenstruationNoButtonIndex", _selectedMenstruationNoButtonIndex, 3),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.85,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  categoryTitle("웨딩 희망장소", null, 25.0),
                  Row(
                    children: [
                      _CategoriesButtons("신랑집", "selectedBrideHomeButtonIndex", _selectedBrideHomeButtonIndex, 1, 70.0),
                      const SizedBox(width: 10.0),
                      _CategoriesButtons("신부집", "selectedGroomHomeButtonIndex", _selectedGroomHomeButtonIndex, 2, 70.0),
                      const SizedBox(width: 10.0),
                      _CategoriesButtons("전체", "selectedAnywhereHomeButtonIndex", _selectedAnywhereHomeButtonIndex, 3, 70.0),
                      const SizedBox(width: 10.0),
                      _CategoriesButtons("상관없음", "selectedPedigreeNoButtonIndex", _selectedPedigreeNoButtonIndex, 4, 85.0),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.85,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  categoryTitle("반려동물 털 빠짐 정도", 130.0, 25.0),
                  Row(
                    children: [
                      _CategoriesButtons("적음", "selectedBrideHomeButtonIndex", _selectedBrideHomeButtonIndex, 1, 70.0),
                      const SizedBox(width: 10.0),
                      _CategoriesButtons("보통", "selectedGroomHomeButtonIndex", _selectedGroomHomeButtonIndex, 2, 70.0),
                      const SizedBox(width: 10.0),
                      _CategoriesButtons("많음", "selectedAnywhereHomeButtonIndex", _selectedAnywhereHomeButtonIndex, 3, 70.0),
                      const SizedBox(width: 10.0),
                      _CategoriesButtons("매우많음", "selectedPedigreeNoButtonIndex", _selectedPedigreeNoButtonIndex, 4, 85.0),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.85,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  categoryTitle("반려동물 친화력 정도", 130.0, 25.0),
                  Row(
                    children: [
                      _CategoriesButtons("적음", "selectedBrideHomeButtonIndex", _selectedBrideHomeButtonIndex, 1, 70.0),
                      const SizedBox(width: 10.0),
                      _CategoriesButtons("보통", "selectedGroomHomeButtonIndex", _selectedGroomHomeButtonIndex, 2, 70.0),
                      const SizedBox(width: 10.0),
                      _CategoriesButtons("많음", "selectedAnywhereHomeButtonIndex", _selectedAnywhereHomeButtonIndex, 3, 70.0),
                      const SizedBox(width: 10.0),
                      _CategoriesButtons("매우많음", "selectedPedigreeNoButtonIndex", _selectedPedigreeNoButtonIndex, 4, 85.0),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.85,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  categoryTitle("반려동물 낮 가림 정도", 130.0, 25.0),
                  Row(
                    children: [
                      _CategoriesButtons("적음", "selectedBrideHomeButtonIndex", _selectedBrideHomeButtonIndex, 1, 70.0),
                      const SizedBox(width: 10.0),
                      _CategoriesButtons("보통", "selectedGroomHomeButtonIndex", _selectedGroomHomeButtonIndex, 2, 70.0),
                      const SizedBox(width: 10.0),
                      _CategoriesButtons("많음", "selectedAnywhereHomeButtonIndex", _selectedAnywhereHomeButtonIndex, 3, 70.0),
                      const SizedBox(width: 10.0),
                      _CategoriesButtons("매우많음", "selectedPedigreeNoButtonIndex", _selectedPedigreeNoButtonIndex, 4, 85.0),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.85,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  categoryTitle("반려동물 짖음 정도", 130.0, 25.0),
                  Row(
                    children: [
                      _CategoriesButtons("적음", "selectedBrideHomeButtonIndex", _selectedBrideHomeButtonIndex, 1, 70.0),
                      const SizedBox(width: 10.0),
                      _CategoriesButtons("보통", "selectedGroomHomeButtonIndex", _selectedGroomHomeButtonIndex, 2, 70.0),
                      const SizedBox(width: 10.0),
                      _CategoriesButtons("많음", "selectedAnywhereHomeButtonIndex", _selectedAnywhereHomeButtonIndex, 3, 70.0),
                      const SizedBox(width: 10.0),
                      _CategoriesButtons("매우많음", "selectedPedigreeNoButtonIndex", _selectedPedigreeNoButtonIndex, 4, 85.0),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                ],
              ),
            ),
            /// TODO: 병력, 알레르기 선택하는 영역 - 해당 영역 뿐 아니라 "웨딩 등록 화면", "회원가입 영역"도 같이 수정해야 함. Component로 빼는 것도 괜츈할 듯
          ],
        ),
      ),
    );
  }

  /// 카테고리 버튼으로 버튼의 이름을 넣고 클릭 시 값과 색을 변경 해준다.
  ///
  /// [buttonName] String, 변경 하려는 버튼의 이름.
  /// [buttonIndexName] int, 변경 하려는 버튼의 index 이름.
  /// [beforeButtonIndex] int, Buttons의 이전 index.
  /// [newButtonIndex] int, Buttons의 새로운 index.
  ///
  /// [Return] 값과 색이 변경된 [OutlinedButton]을 [SizedBox]로 return.
  Row _CategoriesButtons(String buttonName, String buttonIndexName, int beforeButtonIndex, int newButtonIndex, [double? newWidth, double? newHeight]) {
    return Row(
      children: [
        SizedBox(
          width: newWidth ?? 97.0,
          height: newHeight ?? 35.0,
          child: OutlinedButton(
            onPressed: () {
              setState(() {
                setState(() {
                  if (beforeButtonIndex != newButtonIndex) {
                    _UpdateButtonIndex(buttonIndexName, newButtonIndex, true);
                  } else {
                    _UpdateButtonIndex(buttonIndexName, newButtonIndex, false);
                  }
                });
              });
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: beforeButtonIndex == newButtonIndex ? Colors.white : Colors.grey[700],
              backgroundColor: beforeButtonIndex == newButtonIndex ? Colors.green : Colors.grey[300],
            ),
            child: Text(buttonName),
          ),
        ),
      ],
    );
  }

  /// Button의 상태는 update해준다.
  ///
  /// [buttonIndexName] String, button index의 이름
  /// [newButtonIndex] int, 변경해 줄 button index
  void _UpdateButtonIndex(String buttonIndexName, int newButtonIndex, bool state) {
    setState(() {
      switch (buttonIndexName) {
        case "selectedDogButtonIndex" :
          state ? _selectedDogButtonIndex = newButtonIndex : _selectedDogButtonIndex = 0;
          break;
        case "selectedCatButtonIndex" :
          state ? _selectedCatButtonIndex = newButtonIndex : _selectedCatButtonIndex = 0;
          break;
        case "selectedDogCatButtonIndex" :
          state ? _selectedDogCatButtonIndex = newButtonIndex : _selectedDogCatButtonIndex = 0;
          break;
        case "selectedBrideButtonIndex" :
          state ? _selectedBrideButtonIndex = newButtonIndex : _selectedBrideButtonIndex = 0;
          break;
        case "selectedGroomButtonIndex" :
          state ? _selectedGroomButtonIndex = newButtonIndex : _selectedGroomButtonIndex = 0;
          break;
        case "selectedPedigreeYesButtonIndex" :
          state ? _selectedPedigreeYesButtonIndex = newButtonIndex : _selectedPedigreeYesButtonIndex = 0;
          break;
        case "selectedPedigreeNoButtonIndex" :
          state ? _selectedPedigreeNoButtonIndex = newButtonIndex : _selectedPedigreeNoButtonIndex = 0;
          break;
        case "selectedMenstruationYesButtonIndex" :
          state ? _selectedMenstruationYesButtonIndex = newButtonIndex : _selectedMenstruationYesButtonIndex = 0;
          break;
        case "selectedMenstruationNoButtonIndex" :
          state ? _selectedMenstruationNoButtonIndex = newButtonIndex : _selectedMenstruationNoButtonIndex = 0;
          break;
        case "selectedBrideHomeButtonIndex" :
          state ? _selectedBrideHomeButtonIndex = newButtonIndex : _selectedBrideHomeButtonIndex = 0;
          break;
        case "selectedGroomHomeButtonIndex" :
          state ? _selectedGroomHomeButtonIndex = newButtonIndex : _selectedGroomHomeButtonIndex = 0;
          break;
        case "selectedAnywhereHomeButtonIndex" :
          state ? _selectedAnywhereHomeButtonIndex = newButtonIndex : _selectedAnywhereHomeButtonIndex = 0;
          break;
        default:
          if (kDebugMode) {
            print('Error');
          }
      }
    });
  }










}
