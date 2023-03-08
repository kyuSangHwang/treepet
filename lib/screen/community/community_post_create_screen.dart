import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:treepet/component/custom_text_field.dart';
import 'package:treepet/component/post_bottom_sheet.dart';
import 'package:treepet/const/color.dart';
import 'package:treepet/const/style.dart';
import 'package:treepet/layout/screen_layout.dart';

class CommunityPostCreateScreen extends StatefulWidget {
  const CommunityPostCreateScreen({Key? key}) : super(key: key);

  @override
  State<CommunityPostCreateScreen> createState() =>
      _CommunityPostCreateScreen();
}

class _CommunityPostCreateScreen extends State<CommunityPostCreateScreen> {
  List<dynamic> imageFilesList = [];
  List<Widget> imagesWidgetList = [];
  List<int> iconButtonKeyIndexList = [];
  List<int> iconButtonKeyIndexReplaceList = [];
  String _selectedCategoryOption = '';
  String _selectedBeforeCategoryOption = '';
  List<XFile>? _imageList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenLayout(
          title: "글쓰기",
          body: _CommunityPostCreateScreenBody(context),
          screenKey: "communityPostCreate",
          bottomNavigationBar: _RegisteredButton(context),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    imageFilesList.add(_AddButton());
    imagesWidgetList = imageFilesList.map((item) => item as Widget).toList();
  }

  /// 이미지 선택 했을 때 [imagesWidgetList]에 넣어서 화면에 뿌려주기
  Future<void> _GetImage() async {
    final List<XFile> pickedFile = await ImagePicker().pickMultiImage(imageQuality: 50,);

    setState(() {
      for (int i = 0; i < pickedFile.length; i++) {
        imageFilesList.add(File(pickedFile[i].path));
      }

      for (int i = 1; i < imageFilesList.length; i++) {
        imagesWidgetList.add(_AddImages(i, imageFilesList[i]));
      }

      imageFilesList.length == 6 ? imageFilesList.removeAt(0) : null;
      imagesWidgetList.length == 6 ? imagesWidgetList.removeAt(0) : null;
    });
  }

  /// 커뮤니티 글 등록 화면
  GestureDetector _CommunityPostCreateScreenBody(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const CustomTextField(
                      isTitle: true,
                      placeHolder: '제목을 입력하세요.',
                    ),
                    thin_sized_box_style(),
                    const CustomTextField(
                      isTitle: false,
                      placeHolder:
                      '내용을 작성해주세요. \n\n상대방을 불쾌하게 하는 내용은 삼가해주세요.\n신고를 당하면 커뮤니티 이용이 제한될 수 있어요.',
                    ),
                    thin_sized_box_style(),
                    Column(
                      children: [
                        _CategorySelected(context),
                        thin_sized_box_style(),
                        _ImageVideoSelected(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 카테고리 선택 영역
  Padding _CategorySelected(BuildContext context) {
    return Padding(
      padding: post_item_left_padding(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '카테고리 선택',
            style: co_create_middle_title,
          ),
          Row(
            children: [
              Text(_selectedCategoryOption == "1" ? "자유" : _selectedCategoryOption == "2" ? "일상" : _selectedCategoryOption == "3" ? "질문" : _selectedCategoryOption == "4" ? "육아일기" : "카테고리를 선택해주세요"),
              const SizedBox(width:15.0),
              SizedBox(
                width: 58,
                height: 26,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      foregroundColor: BLACK_COLOR, backgroundColor: Colors.grey[300]),
                  onPressed: () {
                    setState(() {
                      _selectedBeforeCategoryOption == "" ? _selectedCategoryOption = '1' : _selectedCategoryOption = _selectedBeforeCategoryOption;
                    });
                    showModalBottomSheet(
                      context: context,
                      builder: (_) {
                        return PostBottomSheet(onCategoryOptionChanged: selectedCategoryOption, selectedBeforeCategoryOption : _selectedBeforeCategoryOption);
                      },
                    );
                  },
                  child: const Text('선택'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void selectedCategoryOption(String value) {
    setState(() {
      _selectedCategoryOption = value;
      _selectedBeforeCategoryOption = value;
    });
  }

  /// 사진/동영상 선택 영역
  Padding _ImageVideoSelected() {
    return Padding(
      padding: post_item_left_padding(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            '사진/동영상',
            style: co_create_middle_title,
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 79.6,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return imagesWidgetList[index];
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(width: 5);
                  },
                  itemCount: imagesWidgetList.length,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// 사진/동영상 선택 버튼
  Container _AddButton() {
    return Container(
      width: 79.6,
      height: 79.6,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: IconButton(
        onPressed: () {
          _GetImage();
        },
        tooltip: 'Pick Images',
        icon: Icon(
          Icons.add,
          size: 40,
          color: Colors.grey[400],
        ),
      ),
    );
  }

  /// 등록된 이미지 보여지는 영역
  Stack _AddImages(int index, File imageFile) {
    return Stack(
      alignment: AlignmentDirectional.topEnd,
      children: [
        Container(
          width: 79.6,
          height: 79.6,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: FileImage(imageFile),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Positioned(
          top: 5,
          right: 5,
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.8),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                setState(() {
                  int removeImageFilesListIndex = 0;
                  int removeImagesWidgetListIndex = 0;

                  for (int i = 1; i < imageFilesList.length; i++) {
                    if (imageFilesList[i].path != null) {
                      if (imageFile.path == imageFilesList[i].path) {
                        removeImageFilesListIndex = i;
                      }
                    }
                  }

                  for (int i = 1; i < imageFilesList.length; i++) {

                    Stack stack = imagesWidgetList[i] as Stack;
                    Container container = stack.children[0] as Container;
                    BoxDecoration decoration = container.decoration as BoxDecoration;
                    DecorationImage fileImage11 = decoration.image as DecorationImage;
                    FileImage? fileImage = fileImage11.image as FileImage;
                    File imageFile1 = fileImage.file;

                    if (imageFile.path == imageFile1.path) {
                      removeImagesWidgetListIndex = i;
                    }
                  }

                  imageFilesList.removeAt(removeImageFilesListIndex);
                  imagesWidgetList.removeAt(removeImagesWidgetListIndex);

                  if (imageFilesList[0].runtimeType != _AddButton().runtimeType) {
                    imageFilesList.insert(0, _AddButton());
                    imagesWidgetList.insert(0, _AddButton());
                  }
                });
              },
              icon: const Icon(
                Icons.close,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// 등록 버튼
  Padding _RegisteredButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 25.0),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  '등록',
                  style: TextStyle(fontSize: 22),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
