import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:treepet/const/style.dart';
import 'package:treepet/screen/family/wedding/wedding_post_create_screen_3.dart';

class WeddingPostCreateScreen2 extends StatefulWidget {
  const WeddingPostCreateScreen2({
    Key? key,
  }) : super(key: key);

  @override
  State<WeddingPostCreateScreen2> createState() =>
      _WeddingPostCreateScreen2State();
}

class _WeddingPostCreateScreen2State extends State<WeddingPostCreateScreen2> {
  Map<String, List<Object>> degreeMapList = {
    'selectedHairLossRadio': ['selectedHairLossRadio', 0],
    'selectedAffinityRadio': ['selectedAffinityRadio', 0],
    'selectedShameRadio': ['selectedShameRadio', 0],
    'selectedBarkingRadio': ['selectedBarkingRadio', 0],
  };
  Map<String, List<Object>> diseaseMapList = {
    'disease_001': [0, '외이염'],
    'disease_002': [1, '슬개골 탈구'],
    'disease_003': [3, '코로나'],
    'disease_004': [4, '설사'],
    'disease_005': [5, '구토'],
    'disease_006': [6, '피부염'],
    'disease_007': [7, '파행'],
    'disease_008': [8, '상부호흡기계질환'],
  };
  Map<String, List<Object>> allergyMapList = {
    'disease_001': [1, '빙어'],
    'disease_002': [2, '오리'],
    'disease_003': [3, '집 진드기'],
    'disease_004': [4, '미세 먼지'],
    'disease_005': [5, '꽃가루'],
    'disease_006': [6, '유제품'],
    'disease_007': [7, '밀가루'],
    'disease_008': [8, '달걀'],
  };

  @override
  Widget build(BuildContext context) {
    final mediaQuerySize = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset:
          false, // Scaffold 의 높이를 조정하지 않고 텍스트 필드 또는 폼 항목을 가리는 것을 허용
      appBar: WeddingPostCreateAppBar(context),
      body: SingleChildScrollView(
        child: SizedBox(
          width: mediaQuerySize.width,
          height: mediaQuerySize.height,
          child: Column(
            children: [
              SizedBox(
                width: mediaQuerySize.width,
                height: 100.0,
                child: Container(
                  alignment: Alignment.center,
                  child: const Text(
                    '신랑&신부 정보',
                    style: wedding_post_22_400_012,
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  width: mediaQuerySize.width * 0.9,
                  child: Column(
                    children: [
                      subjectiveItem(mediaQuerySize, degreeMapList),
                      objectiveItem("병력", diseaseMapList),
                      objectiveItem("알레르기", allergyMapList),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: WeddingBottomAppBarButton(context),
    );
  }

  AppBar WeddingPostCreateAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: false,
      backgroundColor: Colors.white,
      title: const Text(
        '신랑&신부 등록',
        style: TextStyle(color: Colors.black),
      ),
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
      ),
    );
  }

  BottomAppBar WeddingBottomAppBarButton(BuildContext context) {
    return BottomAppBar(
      child: SizedBox(
        height: 60.0,
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => const WeddingPostCreateScreen3(),
              ),
            );
          },
          child: Container(
            width: double.infinity,
            color: Colors.grey,
            child: const Center(
              child: Text(
                '다 음',
                style: wedding_post_create_20_400_012,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding objectiveItem(String objectiveCategory, diseaseOrAllergyMapList) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(objectiveCategory, style: wedding_post_15_400_012),
          const SizedBox(height: 10.0),
          diseaseSelect("감기", "슬개골 탈구", "코로나", "광견병"),
          const SizedBox(height: 13.0),
          diseaseSelect("감기", "슬개골 탈구", "코로나", "광견병"),
          const SizedBox(height: 13.0),
        ],
      ),
    );
  }

  Row diseaseSelect(String disease1, String disease2, [String? disease3, String? disease4]) {
    /// TODO: 나중에 데이터가 넘어오면 해당 Map(diseaseOrAllergyMapList)을 가지고 4개씩 썰어서 값을 넘겨받아서 버튼을 그려줘야 한다.
    /// TODO: 병력과 질병에 대한 버튼 클릭 시 색 변경하고 map에 가지고 있는 값(선택된걸 인식할 수 있는)을 check하여야 한다.
    // final int mapLength = diseaseOrAllergyMapList.length;
    //
    // Map<int, Object> diseaseOrAllergyValueMap = Map.fromEntries(
    //   diseaseOrAllergyMapList.values.map((value) => MapEntry(int.parse(value[0].toString()), value[1])),
    // );


    List diseaseList = [disease1, disease2];
    if (disease3 != null) diseaseList.add(disease3);
    if (disease4 != null) diseaseList.add(disease4);

    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          diseaseList.length,
          (index) => SizedBox(
            width: 80.0,
            height: 35.0,
            child: OutlinedButton(
              onPressed: () => handleRadioValueChange(index + 1, degreeMapList),
              style: degreeMapList[1] == index + 1
                  ? ElevatedButton.styleFrom(backgroundColor: Colors.green)
                  : ElevatedButton.styleFrom(
                      backgroundColor: null,
                      side: const BorderSide(width: 0.5, color: Colors.grey),
                    ),
              child: Text(
                index == 0
                    ? diseaseList[0]
                    : index == 1
                        ? diseaseList[1]
                        : index == 2
                            ? diseaseList[2]
                            : index == 3
                                ? diseaseList[3]
                                : diseaseList[4],
                style: TextStyle(
                  fontSize: 12,
                  color: degreeMapList[1] == index + 1
                      ? Colors.white
                      : Colors.grey,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        ));
  }

  SizedBox subjectiveItem(mediaQuerySize, degreeMap) {
    List<String> subjectiveItemList = ["털빠짐", "친화력", "낮가림", "짖음", "값 없음"];

    return SizedBox(
      height: (mediaQuerySize.height * 0.9) * 0.42,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
            4,
            (index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(subjectiveItemList[index],
                        style: wedding_post_15_400_012),
                    const SizedBox(height: 10.0),
                    degreeSelect(index == 0
                        ? degreeMap['selectedHairLossRadio']
                        : index == 1
                            ? degreeMap['selectedAffinityRadio']
                            : index == 2
                                ? degreeMap['selectedShameRadio']
                                : index == 3
                                    ? degreeMap['selectedBarkingRadio']
                                    : null),
                    SizedBox(height: index == 4 ? 0 : 13.0),
                  ],
                )),
      ),
    );
  }

  Row degreeSelect(selectedRadio) {
    List<String> degreeList = ["적음", "보통", "많음", "매우 많음", "값이 없음"];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        4,
        (index) => SizedBox(
          width: 80.0,
          height: 35.0,
          child: OutlinedButton(
            onPressed: () => handleRadioValueChange(index + 1, selectedRadio),
            style: selectedRadio[1] == index + 1
                ? ElevatedButton.styleFrom(backgroundColor: Colors.green)
                : ElevatedButton.styleFrom(
                    backgroundColor: null,
                    side: const BorderSide(width: 0.5, color: Colors.grey),
                  ),
            child: Text(
              index == 0
                  ? degreeList[0]
                  : index == 1
                      ? degreeList[1]
                      : index == 2
                          ? degreeList[2]
                          : index == 3
                              ? degreeList[3]
                              : degreeList[4],
              style: TextStyle(
                fontSize: 12,
                color:
                    selectedRadio[1] == index + 1 ? Colors.white : Colors.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void handleRadioValueChange(int value, selectedRadio) {
    setState(() {
      final radioName = selectedRadio[0].toString();

      if (radioName == 'selectedAffinityRadio') {
        selectedRadio[1] = value;
      } else if (radioName == 'selectedHairLossRadio') {
        selectedRadio[1] = value;
      } else if (radioName == 'selectedShameRadio') {
        selectedRadio[1] = value;
      } else if (radioName == 'selectedBarkingRadio') {
        selectedRadio[1] = value;
      }
    });
  }
}
