import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:treepet/component/image_pick.dart';
import 'package:treepet/component/warning_text.dart';
import 'package:treepet/const/color.dart';
import 'package:treepet/const/style.dart';
import 'package:intl/intl.dart';
import 'package:treepet/screen/sign/pet_register_screen2.dart';

class PetRegisterScreen extends StatefulWidget {
  bool? first;

  PetRegisterScreen({
    this.first,
    Key? key,
  }) : super(key: key);

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
  bool determiningStartingNumber = false;
  bool firstNumber = false;

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
                        const SizedBox(height: 10),
                        RenderTitle(context),
                        const SizedBox(height: 10),
                        const ImagePickerButton(),
                        const SizedBox(height: 20),
                        RenderPetType(context),
                        const SizedBox(height: 20),
                        RenderPetBreed(context),
                        const SizedBox(height: 20),
                        RenderPetName(context),
                        const SizedBox(height: 20),
                        RenderPetSex(context),
                        const SizedBox(height: 20),
                        RenderPetNeutered(context),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            RenderPetWeight(context),
                          ],
                        ),
                        const SizedBox(height: 20),
                        RenderPetVaccination(context),
                        const SizedBox(height: 20),
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
        icon: const Icon(
          Icons.arrow_back,
          color: BLACK_COLOR,
        ),
      ),
      title: const Text(
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
          const SizedBox(height: 5),
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
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      foregroundColor: selectedPetTypeButtonIndex == 1
                          ? WHITE_COLOR
                          : Colors.grey[700],
                      backgroundColor: selectedPetTypeButtonIndex == 1
                          ? Colors.green
                          : Colors.grey[700],
                    ),
                    child: Text('강아지', style: pet_register_category_button),
                  ),
                ),
              ),
              const SizedBox(width: 10),
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
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      foregroundColor: selectedPetTypeButtonIndex == 2
                          ? WHITE_COLOR
                          : Colors.grey[700],
                      backgroundColor: selectedPetTypeButtonIndex == 2
                          ? Colors.green
                          : Colors.grey[700],
                    ),
                    child: Text('고양이', style: pet_register_category_button),
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
          const SizedBox(height: 5),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 60,
            child: DropdownButton(
              style: option_select,
              underline: Container(
                height: 1,
                color: Colors.black54,
              ),
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
          const SizedBox(height: 5),
          TextFormField(
            controller: nameController,
            style: pet_name,
            decoration: const InputDecoration(
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
          const SizedBox(height: 5),
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
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      foregroundColor: selectedPetSexButtonIndex == 1
                          ? WHITE_COLOR
                          : Colors.grey[700],
                      backgroundColor: selectedPetSexButtonIndex == 1
                          ? Colors.green
                          : Colors.grey[700],
                    ),
                    child: Text('남아', style: pet_register_category_button),
                  ),
                ),
              ),
              const SizedBox(width: 10),
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
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      foregroundColor: selectedPetSexButtonIndex == 2
                          ? WHITE_COLOR
                          : Colors.grey[700],
                      backgroundColor: selectedPetSexButtonIndex == 2
                          ? Colors.green
                          : Colors.grey[700],
                    ),
                    child: Text('여아', style: pet_register_category_button),
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
          const SizedBox(height: 5),
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
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      foregroundColor: selectedPetNeuteredButtonIndex == 1
                          ? WHITE_COLOR
                          : Colors.grey[700],
                      backgroundColor: selectedPetNeuteredButtonIndex == 1
                          ? Colors.green
                          : Colors.grey[700],
                    ),
                    child: Text('중성화 전', style: pet_register_category_button),
                  ),
                ),
              ),
              const SizedBox(width: 10),
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
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      foregroundColor: selectedPetNeuteredButtonIndex == 2
                          ? WHITE_COLOR
                          : Colors.grey[700],
                      backgroundColor: selectedPetNeuteredButtonIndex == 2
                          ? Colors.green
                          : Colors.grey[700],
                    ),
                    child: Text('중성화 완료', style: pet_register_category_button),
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
          const SizedBox(height: 5),
          TextFormField(
            controller: tec
              ..selection = TextSelection.fromPosition(
                  TextPosition(offset: tec.text.length)),
            keyboardType: TextInputType.number,
            inputFormatters: [
              determiningStartingNumber == true
                  ? LengthLimitingTextInputFormatter(3)
                  : LengthLimitingTextInputFormatter(4)
            ],
            style: pet_weight,
            decoration: InputDecoration(
              hintText: '3.2',
              suffixText: "Kg",
              helperText: '소수점 첫째 자리까지 입력 가능합니다',
              helperStyle: pet_weight_hel,
            ),
            onChanged: (newValue) {
              if (newValue.length > _previousValue.length) {
                if (newValue.substring(0, 1) == "0" && newValue.length == 1) {
                  setState(() {
                    determiningStartingNumber = true;
                  });

                  tec.text = "0.";
                  tec.selection = TextSelection.fromPosition(
                      TextPosition(offset: tec.text.length));
                  firstNumber = true;
                } else if (newValue.isNotEmpty &&
                    double.tryParse(newValue) == null) {
                  tec.text = "0.";
                  tec.selection = TextSelection.fromPosition(
                      TextPosition(offset: tec.text.length));
                } else if (double.tryParse(newValue) != null) {
                  if (firstNumber != true) {
                    setState(() {
                      determiningStartingNumber = false;
                    });
                  }

                  if (newValue.length == 2) {
                    tec.text =
                        "${newValue.substring(0, 1)}.${newValue.substring(1, 2)}";
                    tec.selection = TextSelection.fromPosition(
                        TextPosition(offset: tec.text.length));
                  } else if (newValue.length == 4) {
                    tec.text =
                        "${newValue.substring(0, 1)}${newValue.substring(2, 3)}.${newValue.substring(3, 4)}";
                    tec.selection = TextSelection.fromPosition(
                        TextPosition(offset: tec.text.length));
                  } else {
                    tec.selection = TextSelection.fromPosition(
                        TextPosition(offset: tec.text.length));
                  }
                }
                _previousValue = newValue;
              } else if (newValue.length < _previousValue.length) {
                if (newValue.isEmpty) firstNumber = false;

                if (newValue.length == 3 && newValue.substring(2, 3) == ".") {
                  tec.text =
                      "${newValue.substring(0, 1)}.${newValue.substring(1, 2)}";
                  newValue = tec.text;
                  tec.selection = TextSelection.fromPosition(
                      TextPosition(offset: tec.text.length));
                }

                if (newValue.length == 2 &&
                    newValue.substring(0, 1) != "0" &&
                    newValue.substring(1, 2) == ".") {
                  tec.text = newValue.substring(0, 1);
                  newValue = tec.text;
                  tec.selection = TextSelection.fromPosition(
                      TextPosition(offset: tec.text.length));
                }

                _previousValue = newValue;
              }

              if (newValue.isNotEmpty) {
                _petWeightController = newValue;
                _showError6 = false;
              }
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
          const SizedBox(height: 5),
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
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      foregroundColor: selectedPetVaccinationButtonIndex == 1
                          ? WHITE_COLOR
                          : Colors.grey[700],
                      backgroundColor: selectedPetVaccinationButtonIndex == 1
                          ? Colors.green
                          : Colors.grey[700],
                    ),
                    child: Text('접종 전', style: pet_register_category_button),
                  ),
                ),
              ),
              const SizedBox(width: 10),
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
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      foregroundColor: selectedPetVaccinationButtonIndex == 2
                          ? WHITE_COLOR
                          : Colors.grey[700],
                      backgroundColor: selectedPetVaccinationButtonIndex == 2
                          ? Colors.green
                          : Colors.grey[700],
                    ),
                    child: Text('접종 완료', style: pet_register_category_button),
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
                        _petVaccinationController.isNotEmpty) &&
                        widget.first ==
                    true
                ?
              Navigator.of(context).pushNamed('/petRegisterScreen2', arguments: {'first': true})
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
