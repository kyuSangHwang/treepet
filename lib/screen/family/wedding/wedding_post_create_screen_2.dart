import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../const/style.dart';

class WeddingPostCreateScreen2 extends StatefulWidget {
  const WeddingPostCreateScreen2({Key? key}) : super(key: key);

  @override
  State<WeddingPostCreateScreen2> createState() =>
      _WeddingPostCreateScreen2State();
}

class _WeddingPostCreateScreen2State extends State<WeddingPostCreateScreen2> {
  @override
  Widget build(BuildContext context) {
    final mediaQuerySize = MediaQuery.of(context).size;
    
    return Scaffold(
      appBar: WeddingPostCreateAppBar(context),
      body: SafeArea(
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
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            children: const [
                              Text('친화력', style:wedding_post_15_400_012),
                              Text('data1'),
                              Text('data1'),
                              Text('data1'),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            children: const [
                              Text('털빠짐'),
                              Text('data2'),
                              Text('data2'),
                              Text('data2'),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            children: const [
                              Text('낮가림'),
                              Text('data3'),
                              Text('data3'),
                              Text('data3'),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            children: const [
                              Text('짖음'),
                              Text('data4'),
                              Text('data4'),
                              Text('data4'),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            children: const [
                              Text('data5'),
                              Text('data5'),
                              Text('data5'),
                              Text('data5'),
                            ],
                          ),
                        ],
                      ),
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
            if (kDebugMode) {
              print('object');
            }
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
