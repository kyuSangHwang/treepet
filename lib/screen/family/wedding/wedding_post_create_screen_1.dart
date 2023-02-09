import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:treepet/screen/family/wedding/wedding_post_create_screen_2.dart';
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

  Widget WeddingPostCreateScreenBody(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 100.0,
              child: Container(
                alignment: Alignment.center,
                child: const Text(
                  '신랑&신부 정보',
                  style: wedding_post_22_400_012,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 10.0, 0, 30.0),
              child: CircleAvatar(
                backgroundImage: AssetImage('asset/image/mongSil.png'),
                radius: 110,
              ),
            ),
            SizedBox(
              height: 250.0,
              width: MediaQuery.of(context).size.width * 0.80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('이름', style: wedding_post_create_20_400_012,),
                      Text('종', style: wedding_post_create_20_400_012,),
                      Text('품종', style: wedding_post_create_20_400_012,),
                      Text('나이', style: wedding_post_create_20_400_012,),
                      Text('몸무게', style: wedding_post_create_20_400_012,),
                      Text('털색', style: wedding_post_create_20_400_012,),

                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('몽실이', style: wedding_post_create_20_400_012,),
                      Text('강아지', style: wedding_post_create_20_400_012,),
                      Text('푸들', style: wedding_post_create_20_400_012,),
                      Text('1년 8개월', style: wedding_post_create_20_400_012,),
                      Text('1.65kg', style: wedding_post_create_20_400_012,),
                      Text('흰색', style: wedding_post_create_20_400_012,),
                    ],
                  ),
                ],
              ),
            ),
          ],
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
                MaterialPageRoute(builder: (_) => const WeddingPostCreateScreen2()));
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


}


