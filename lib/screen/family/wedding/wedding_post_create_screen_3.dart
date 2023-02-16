import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:treepet/const/color.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:treepet/screen/family/wedding/wedding_post_create_screen_4.dart';

import '../../../const/style.dart';

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
  bool isRowVisible = false;
  int checkRowVisibility = 0;
  DateTime? selectedDay;
  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final defaultBoxDeco = BoxDecoration(
        borderRadius: BorderRadius.circular(6.0),
        color: Colors.grey[200]
    );
    final defaultTextStyle = TextStyle(
      color: Colors.grey[600],
      fontWeight: FontWeight.w700,
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: WeddingPostCreateAppBar(context),
      body: SizedBox(
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
            Expanded(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              width: 100.0,
                              height: 22.0,
                              child: Text(
                                '꽃도장',
                                style: wedding_post_15_400_012,
                              ),
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 97.0,
                                  height: 35.0,
                                  child: OutlinedButton(
                                    onPressed: () {
                                      checkRowVisibility = 1;
                                      toggleRowVisibility();

                                      setState(() {
                                        selectedMenstruationButtonIndex = 1;
                                      });
                                    },
                                    style: OutlinedButton.styleFrom(
                                      foregroundColor:
                                          selectedMenstruationButtonIndex == 1
                                              ? Colors.white
                                              : Colors.grey[700],
                                      backgroundColor:
                                          selectedMenstruationButtonIndex == 1
                                              ? Colors.green
                                              : Colors.grey[300],
                                    ),
                                    child: const Text('하고 있음'),
                                  ),
                                ),
                                const SizedBox(width: 10.0),
                                SizedBox(
                                  width: 97.0,
                                  height: 35.0,
                                  child: OutlinedButton(
                                    onPressed: () {
                                      checkRowVisibility = 2;
                                      toggleRowVisibility();

                                      setState(() {
                                        selectedMenstruationButtonIndex = 2;
                                      });
                                    },
                                    style: OutlinedButton.styleFrom(
                                      foregroundColor:
                                          selectedMenstruationButtonIndex == 2
                                              ? Colors.white
                                              : Colors.grey[700],
                                      backgroundColor:
                                          selectedMenstruationButtonIndex == 2
                                              ? Colors.green
                                              : Colors.grey[300],
                                    ),
                                    child: const Text('하지 않음'),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20.0),
                            Visibility(
                              visible: isRowVisible,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const SizedBox(height: 20.0),
                                  Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            width: 100.0,
                                            height: 22.0,
                                            child: Text(
                                              '꽃도장 시작일',
                                              style: wedding_post_15_400_012,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              const Text("2023년 02월 15일"),
                                              const SizedBox(width: 10.0),
                                              Row(
                                                children: [
                                                  OutlinedButton(
                                                    child: const Icon(
                                                        Icons.calendar_today),
                                                    onPressed: () {
                                                      showModalBottomSheet(
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return SizedBox(
                                                            // height: MediaQuery.of(context).size.height * 0.5,
                                                            child: TableCalendar(
                                                              locale: 'ko_KR',
                                                              focusedDay: focusedDay,
                                                              firstDay: DateTime(1800),
                                                              lastDay: DateTime(3000),
                                                              headerStyle: const HeaderStyle(
                                                                formatButtonVisible: false,
                                                                titleCentered: true,
                                                                titleTextStyle: TextStyle(
                                                                  fontWeight: FontWeight.w700,
                                                                  fontSize: 16.0,
                                                                ),
                                                              ),
                                                              calendarStyle: CalendarStyle(
                                                                isTodayHighlighted: false,
                                                                defaultDecoration: defaultBoxDeco,
                                                                weekendDecoration: defaultBoxDeco,
                                                                selectedDecoration: BoxDecoration(
                                                                  color: Colors.white,
                                                                  borderRadius: BorderRadius.circular(6.0),
                                                                  border: Border.all(
                                                                    color: MAIN_COLOR,
                                                                    width: 1.0,
                                                                  ),
                                                                ),
                                                                outsideDecoration: const BoxDecoration(
                                                                  shape: BoxShape.rectangle,
                                                                ),
                                                                defaultTextStyle: defaultTextStyle,
                                                                weekendTextStyle: defaultTextStyle,
                                                                selectedTextStyle: defaultTextStyle.copyWith(
                                                                  color: MAIN_COLOR,
                                                                ),
                                                              ),
                                                              onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
                                                                print(selectedDay);
                                                                setState(() {
                                                                  this.selectedDay = selectedDay;
                                                                  this.focusedDay = selectedDay;
                                                                });
                                                              },
                                                              selectedDayPredicate: (DateTime date) {
                                                                if(selectedDay == null){
                                                                  return false;
                                                                }

                                                                return date.year == selectedDay!.year &&
                                                                    date.month == selectedDay!.month &&
                                                                    date.day == selectedDay!.day;
                                                              },
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                  const SizedBox(width: 10.0),
                                                  OutlinedButton(
                                                    child: const Text('Cancel'),
                                                    onPressed: () {
                                                      toggleRowVisibility();
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
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              width: 100.0,
                              height: 22.0,
                              child: Text(
                                '꽃도장 주기',
                                style: wedding_post_15_400_012,
                              ),
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 97.0,
                                  height: 35.0,
                                  child: OutlinedButton(
                                    onPressed: () {
                                      setState(() {
                                        selectedMenstrualCycleButtonIndex = 1;
                                      });
                                    },
                                    style: OutlinedButton.styleFrom(
                                      foregroundColor:
                                          selectedMenstrualCycleButtonIndex == 1
                                              ? Colors.white
                                              : Colors.grey[700],
                                      backgroundColor:
                                          selectedMenstrualCycleButtonIndex == 1
                                              ? Colors.green
                                              : Colors.grey[300],
                                    ),
                                    child: const Text('알고 있음'),
                                  ),
                                ),
                                const SizedBox(width: 10.0),
                                SizedBox(
                                  width: 97.0,
                                  height: 35.0,
                                  child: OutlinedButton(
                                    onPressed: () {
                                      setState(() {
                                        selectedMenstrualCycleButtonIndex = 2;
                                      });
                                    },
                                    style: OutlinedButton.styleFrom(
                                      foregroundColor:
                                          selectedMenstrualCycleButtonIndex == 2
                                              ? Colors.white
                                              : Colors.grey[700],
                                      backgroundColor:
                                          selectedMenstrualCycleButtonIndex == 2
                                              ? Colors.green
                                              : Colors.grey[300],
                                    ),
                                    child: const Text('모름'),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              width: 100.0,
                              height: 22.0,
                              child: Text(
                                '혈통서',
                                style: wedding_post_15_400_012,
                              ),
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 97.0,
                                  height: 35.0,
                                  child: OutlinedButton(
                                    onPressed: () {
                                      setState(() {
                                        selectedPedigreeBookButtonIndex = 1;
                                      });
                                    },
                                    style: OutlinedButton.styleFrom(
                                      foregroundColor:
                                          selectedPedigreeBookButtonIndex == 1
                                              ? Colors.white
                                              : Colors.grey[700],
                                      backgroundColor:
                                          selectedPedigreeBookButtonIndex == 1
                                              ? Colors.green
                                              : Colors.grey[300],
                                    ),
                                    child: const Text('있음'),
                                  ),
                                ),
                                const SizedBox(width: 10.0),
                                SizedBox(
                                  width: 97.0,
                                  height: 35.0,
                                  child: OutlinedButton(
                                    onPressed: () {
                                      setState(() {
                                        selectedPedigreeBookButtonIndex = 2;
                                      });
                                    },
                                    style: OutlinedButton.styleFrom(
                                      foregroundColor:
                                          selectedPedigreeBookButtonIndex == 2
                                              ? Colors.white
                                              : Colors.grey[700],
                                      backgroundColor:
                                          selectedPedigreeBookButtonIndex == 2
                                              ? Colors.green
                                              : Colors.grey[300],
                                    ),
                                    child: const Text('없음'),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              width: 100.0,
                              height: 22.0,
                              child: Text(
                                '웨딩 희망장소',
                                style: wedding_post_15_400_012,
                              ),
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 97.0,
                                  height: 35.0,
                                  child: OutlinedButton(
                                    onPressed: () {
                                      setState(() {
                                        selectedWeddingDesiredPlaceButtonIndex =
                                            1;
                                      });
                                    },
                                    style: OutlinedButton.styleFrom(
                                      foregroundColor:
                                          selectedWeddingDesiredPlaceButtonIndex ==
                                                  1
                                              ? Colors.white
                                              : Colors.grey[700],
                                      backgroundColor:
                                          selectedWeddingDesiredPlaceButtonIndex ==
                                                  1
                                              ? Colors.green
                                              : Colors.grey[300],
                                    ),
                                    child: const Text('수컷네 가정'),
                                  ),
                                ),
                                const SizedBox(width: 10.0),
                                SizedBox(
                                  width: 97.0,
                                  height: 35.0,
                                  child: OutlinedButton(
                                    onPressed: () {
                                      setState(() {
                                        selectedWeddingDesiredPlaceButtonIndex =
                                            2;
                                      });
                                    },
                                    style: OutlinedButton.styleFrom(
                                      foregroundColor:
                                          selectedWeddingDesiredPlaceButtonIndex ==
                                                  2
                                              ? Colors.white
                                              : Colors.grey[700],
                                      backgroundColor:
                                          selectedWeddingDesiredPlaceButtonIndex ==
                                                  2
                                              ? Colors.green
                                              : Colors.grey[300],
                                    ),
                                    child: const Text('암컷네 가정'),
                                  ),
                                ),
                                const SizedBox(width: 10.0),
                                SizedBox(
                                  width: 97.0,
                                  height: 35.0,
                                  child: OutlinedButton(
                                    onPressed: () {
                                      setState(() {
                                        selectedWeddingDesiredPlaceButtonIndex =
                                            3;
                                      });
                                    },
                                    style: OutlinedButton.styleFrom(
                                      foregroundColor:
                                          selectedWeddingDesiredPlaceButtonIndex ==
                                                  3
                                              ? Colors.white
                                              : Colors.grey[700],
                                      backgroundColor:
                                          selectedWeddingDesiredPlaceButtonIndex ==
                                                  3
                                              ? Colors.green
                                              : Colors.grey[300],
                                    ),
                                    child: const Text('상관없음'),
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
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: WeddingBottomAppBarButton(context),
    );
  }

  void toggleRowVisibility() {
    setState(() {
      if (checkRowVisibility == 1 && isRowVisible == false) {
        isRowVisible = !isRowVisible;
      } else if (checkRowVisibility == 2 && isRowVisible == true) {
        isRowVisible = !isRowVisible;
      }
    });
  }

  void onBottomSheetClosed() {
    print('BottomSheet');
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
                builder: (_) => MyHomePage11(),
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
}
