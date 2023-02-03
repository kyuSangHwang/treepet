import 'package:flutter/material.dart';
import 'package:treepet/const/color.dart';
import 'package:treepet/const/style.dart';

class SettingsAlarmScreen extends StatefulWidget {
  const SettingsAlarmScreen({Key? key}) : super(key: key);

  @override
  State<SettingsAlarmScreen> createState() => _SettingsAlarmScreenState();
}

class _SettingsAlarmScreenState extends State<SettingsAlarmScreen> {
  var switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SettingAlarmScreenAppBar(context),
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(
                height: 10,
              ),
              AlarmAllOnOff(context)
            ],
          ),
        ],
      ),
    );
  }

  AppBar SettingAlarmScreenAppBar(BuildContext context) {
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
        '알람 설정',
        style: TextStyle(color: BLACK_COLOR),
      ),
    );
  }

  SizedBox AlarmAllOnOff(BuildContext context) {

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.92,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '푸쉬 알림',
                style: settings_list_textStyle,
              ),
              Switch(
                // This bool value toggles the switch.
                value: switchValue,
                activeColor: MAIN_COLOR,
                onChanged: (bool value) {
                  // This is called when the user toggles the switch.
                  setState(() {
                    print(value);
                    switchValue = value;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
