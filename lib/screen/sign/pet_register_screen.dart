import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:treepet/component/image_pick.dart';
import 'package:treepet/component/warning_text.dart';
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
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  final _formKey = GlobalKey<FormState>();

  int selectedPetTypeButtonIndex = 0;
  int selectedPetSexButtonIndex = 0;
  int selectedPetNeuteredButtonIndex = 0;
  int selectedPetVaccinationButtonIndex = 0;

  bool _showError1 = false;
  bool _showError2 = false;
  bool _showError4 = false;
  bool _showError5 = false;
  bool _showError6 = false;
  bool _showError7 = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController tec = TextEditingController();

  final List<String> _breedList = [
    '선택해주세요',
    '말티즈',
    '비숑',
    '시츄',
    '골드 리트리버',
    '파피용'
  ];
  String _selectedBreed = '선택해주세요';

  String _petTypeController = '';
  String _petBreedController = '';
  String _petNameController = '';
  String _petSexController = '';
  String _petNeuteredController = '';
  String _petWeightController = '';
  String _petVaccinationController = '';

  String _previousValue = '';
  bool contain = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PetRegisterScreenAppBar(context),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        RenderTitle(context),
                        SizedBox(height: 10),
                        ImagePickerButton(),
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
      child: Text('기본 정보(필수)', style: pet_register_category_title),
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
                        _petTypeController = '강아지';
                        _showError1 = false;
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
                        _petTypeController = '고양이';
                        _showError1 = false;
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
          ),
          _showError1 == true ? RenderWrongInput() : const SizedBox(),
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
              underline: Container(
                height: 1,
                color: Colors.black54,
              ),
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
                  _petBreedController = _selectedBreed;
                  if (_petBreedController == '' ||
                      _petBreedController == "선택해주세요") {
                    _showError2 = true;
                  } else {
                    _showError2 = false;
                  }
                });
              },
            ),
          ),
          _showError2 == true ? RenderWrongInput() : const SizedBox(),
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
            controller: nameController,
            style: pet_name,
            decoration: InputDecoration(
              hintText: '이름을 입력하세요',
            ),
            onChanged: (value) {
              _petNameController = value;
            },
            autovalidateMode: autoValidateMode,
            validator: (value) {
              if (value?.isEmpty == true) {
                return '올바른 형식으로 입력해주세요';
              }
            },
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
                        _petSexController = '남아';
                        _showError4 = false;
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
                        _petSexController = '여아';
                        _showError4 = false;
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
          _showError4 == true ? RenderWrongInput() : const SizedBox(),
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
          Text('중성화 유무', style: pet_register_category_title),
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
                        _petNeuteredController = '전';
                        _showError5 = false;
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
                        _petNeuteredController = '후';
                        _showError5 = false;
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
          _showError5 == true ? RenderWrongInput() : const SizedBox(),
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
            controller: tec
              ..selection = TextSelection.fromPosition(
                  TextPosition(offset: tec.text.length)),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [
              // FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,1}')),
              contain == true ? LengthLimitingTextInputFormatter(3) : LengthLimitingTextInputFormatter(4),
              // DecimalTextInputFormatter(),
              // FilteringTextInputFormatter.digitsOnly
            ],
            style: pet_weight,
            decoration: InputDecoration(
              hintText: '3.2',
              suffixText: "Kg",
              helperText: '소수점 첫째 자리까지 입력 가능합니다',
              helperStyle: pet_weight_hel,
            ),
            onChanged: (newValue) {
              /// 입력할 때
              if(newValue.length > _previousValue.length) {
                /// 1. 0을 클릭 했을 때
                if(newValue[0] == '0') {
                  ///   1-1. 길이가 2일 때 ( 0,다음 아무 숫자를 입력 했을때 ))
                  if(newValue.length > 1) {
                    ///     1-1-1. 소수점 2번째 자리까지 입력 가능하게 (앞에 입력한 "0." 이거 유지되게)
                    contain = true;

                    if(newValue[1] == '0') {
                      newValue = '0';
                    } else {
                      newValue = '${newValue.substring(0, newValue.length-1)}.${newValue.substring(newValue.length-1)}';
                      // newValue = '0.$newValue[1]';
                      // newValue[0] = '0';

                    }




                    ///   1-2. 길이가 3이하일 때
                  } else {
                    ///     1-2-1. 아래 짜놓은 로직(전부가 필요한 건 아닐 수 있음)
                    if (newValue.length == 1) {
                      newValue = newValue;
                    } else if (newValue.length == 2) {
                      newValue = (double.parse(newValue) / 10).toString();
                    } else if (newValue.length == 4) {
                      newValue = (double.parse(newValue.replaceAll(RegExp(r'\D'), '')) / 10).toString();
                    }
                  }

                  /// 2. 0 이외의 수를 클릭 했을 때
                // } else if(newValue[0] != '0') {
                } else {

                  ///   2-1. 아래 짜놓은 로직(전부가 필요한 건 아닐 수 있음)
                  if (newValue.length == 1) {
                    newValue = newValue;
                  } else if (newValue.length == 2) {
                    newValue = (double.parse(newValue) / 10).toString();
                  } else if (newValue.length == 4) {
                    newValue = (double.parse(newValue.replaceAll(RegExp(r'\D'), '')) / 10).toString();
                  }

                }

              /// 지울 때
              } else if(newValue.length < _previousValue.length) {
              /// 1. 입력되어 있는 수의 맨 앞자리가 0일 때
              ///   1-1. 길이가 3일 될 때
              ///     1-1-1. 소수점 유지된 채로 맨 뒤에 값만 지우기
              ///   1-2. 길이가 2가 될 때
              ///     1-2-1. 입력창에 있는 값 다 지우기
              ///
              /// 2. 입력되어 있는 수의 맨 앞자리가 0이 아닐 때
              ///   2-1. 길이가 3이 될 때
              ///     2-1-1. 맨 뒷 자리 수를 지우고 남은 수의 맨 뒤에 있는 소수점 제거하고 남은 두 수로 /10 해줘서 소수점 만들어주기 (예. 32.5 -> 32.(X), 3.2(O) )
              ///   2-2. 길이가 2가 될 때 (앞의 말이 정확하지 않음, 정확하게는 내가 입력한 수가 1개 남을 때)
              ///     2-2-1. 앞에 소수점 빼고 입력했던 수(남아있는 수)만 보여주기

              }



              // if (newValue.length == 1) {
              //   newValue = newValue;
              // } else if (newValue.length == 2) {
              //   newValue = (double.parse(newValue) / 10).toString();
              // } else if (newValue.length == 4) {
              //   newValue = (double.parse(newValue.replaceAll(RegExp(r'\D'), '')) / 10).toString();
              // }
              //
              // setState(() {
              //   tec.text = newValue.toString();
              //
              //   _petWeightController = newValue;
              //   _showError6 = false;
              // });
            },
          ),
          _showError6 == true ? RenderWrongInput() : const SizedBox(),
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
          Text('예방접종 유무', style: pet_register_category_title),
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
                        _petVaccinationController = '전';
                        _showError7 = false;
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
                        _petVaccinationController = '후';
                        _showError7 = false;
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
          _showError7 == true ? RenderWrongInput() : const SizedBox(),
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
            if (_formKey.currentState!.validate()) {
              print('성공');
            } else {
              setState(() {
                autoValidateMode = AutovalidateMode.always;
              });
            }

            setState(() {
              if (_petTypeController.isEmpty) _showError1 = true;
              if (_petBreedController == '') _showError2 = true;
              if (_petSexController.isEmpty) _showError4 = true;
              if (_petNeuteredController.isEmpty) _showError5 = true;
              if (_petWeightController.isEmpty) _showError6 = true;
              if (_petVaccinationController.isEmpty) _showError7 = true;
            });

            (_petTypeController.isNotEmpty &&
                        _petBreedController != '선택해주세요' &&
                        _petNameController.isNotEmpty &&
                        _petSexController.isNotEmpty &&
                        _petNeuteredController.isNotEmpty &&
                        _petWeightController.isNotEmpty &&
                        _petVaccinationController.isNotEmpty) ==
                    true
                ? Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => PetRegisterScreen2()))
                : null;
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: (_petTypeController.isNotEmpty &&
                        _petBreedController != '선택해주세요' &&
                        _petNameController.isNotEmpty &&
                        _petSexController.isNotEmpty &&
                        _petNeuteredController.isNotEmpty &&
                        _petWeightController.isNotEmpty &&
                        _petVaccinationController.isNotEmpty) ==
                    true
                ? MAIN_COLOR
                : Colors.grey[500],
          ),
          child: Text(
            '다음',
            style: big_long_button_text,
          ),
        ),
      ),
    );
  }
}

// class DecimalTextInputFormatter extends TextInputFormatter {
//   @override
//   TextEditingValue formatEditUpdate(
//       TextEditingValue oldValue, TextEditingValue newValue) {
//     if (newValue.text.isEmpty) {
//       return newValue.copyWith(text: '');
//     } else if (newValue.text.length == 1) {
//       return newValue.copyWith(text: '${newValue.text}');
//     } else {
//       String newText = newValue.text;
//       if (newText.contains('.')) {
//         newText = newText.replaceAll('.', '');
//       }
//       int value = int.parse(newText);
//       String formattedValue = (value / 10).toStringAsFixed(1);
//       return newValue.copyWith(
//         text: formattedValue,
//         selection: TextSelection.collapsed(offset: formattedValue.length),
//       );
//     }
//   }
// }
