import 'package:flutter/material.dart';
import 'package:treepet/const/color.dart';
import 'package:treepet/const/style.dart';
import 'package:treepet/screen/sign/pet_register_screen.dart';

class PetTreeViewAll extends StatefulWidget {
  const PetTreeViewAll({Key? key}) : super(key: key);

  @override
  State<PetTreeViewAll> createState() => _PetTreeViewAllState();
}

class _PetTreeViewAllState extends State<PetTreeViewAll> {
  late String option = '1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SettingPetTreeViewAllScreenAppBar(context),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              textA(index),
            ],
          );
        },
      ),
    );
  }

  AppBar SettingPetTreeViewAllScreenAppBar(BuildContext context) {
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
        '가족 전체보기',
        style: TextStyle(color: BLACK_COLOR),
      ),
      actions: [
        GestureDetector(
        behavior: HitTestBehavior.opaque,
          onTap: () {
            Navigator.of(context).pushNamed('/petRegisterScreen');
          },
          child: SizedBox(
            width: 80,
            child: Center(
              child: Text(
                '추가',
                style: pet_tree_pet_add,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget textA(index) {
    return Column(
      children: [
        // 최상단
        PetTreeRepresentation(
          index: index + 1,
          value: null,
          title: '감자로 활동하기',
        ),
        // 반려동물
        SizedBox(
          child: Center(
            child: Column(
              children: [
                // 반려동물 이미지
                CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage('asset/image/dog1.jpeg'),
                ),
                const SizedBox(height: 20),
                // 반려동물 정보
                Text('뭉치', style: pet_tree_pet_name),
                const SizedBox(height: 10),
                Text('골든 리트리버', style: pet_tree_pet_info),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('여아', style: pet_tree_pet_info),
                    VerticalDivider(width: 5),
                    Text('2살', style: pet_tree_pet_info),
                    VerticalDivider(width: 5),
                    Text('3kg', style: pet_tree_pet_info),
                    VerticalDivider(width: 5),
                    Text('중성화 o', style: pet_tree_pet_info),
                  ],
                ),
              ],
            ),
          ),
        ),
        // 반려동물 가족
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.96,
            height: 250,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(width: 1, color: Colors.grey)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.47,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, bottom: 5, left: 15.0),
                        child: Text('부견', style: pet_tree_call_name),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.47,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, bottom: 5, left: 15.0),
                        child: Text('모견', style: pet_tree_call_name),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // 아빠
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.47,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: CircleAvatar(
                                    radius: 35,
                                  ),
                                ),
                                SizedBox(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('로이',
                                          style: pet_tree_family_pet_name),
                                      SizedBox(height: 2),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.24,
                                        child: Text('이탈리안 그레이하운드'),
                                      ),
                                      Row(
                                        children: [
                                          Text('남아'),
                                          VerticalDivider(width: 5),
                                          Text('3살'),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text('3.6kg'),
                                          VerticalDivider(width: 5),
                                          Text('중성화 x'),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      // 엄마
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.47,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: CircleAvatar(
                                    radius: 35,
                                  ),
                                ),
                                SizedBox(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('로이',
                                          style: pet_tree_family_pet_name),
                                      SizedBox(height: 2),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.24,
                                        child: Text('골든 리트리버'),
                                      ),
                                      Row(
                                        children: [
                                          Text('여아'),
                                          VerticalDivider(width: 5),
                                          Text('3살'),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text('3.6kg'),
                                          VerticalDivider(width: 5),
                                          Text('중성화 x'),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // 형제들 타이틀
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    children: [
                      Text('형제들', style: pet_tree_call_name),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                // 형제들 소개
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 70,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 12,
                    itemBuilder: (BuildContext context, int index) {
                      return RenderFamilyPet(title: '미우');
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(width: 10);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        // 경계선
        suit_sized_box_style(),
      ],
    );
  }

  PetTreeRepresentation({index, required value, required String title}) {
    return RadioListTile(
      value: index.toString(),
      groupValue: option,
      onChanged: (value) {
        setState(() {
          option = value.toString()!;
        });
      },
      title: Text(
        title,
        style: pet_tree_title,
      ),
    );
  }
}

RenderFamilyPet({required String title}) {
  return Column(
    children: [
      CircleAvatar(),
      Text(title),
    ],
  );
}
