// ignore_for_file: must_be_immutable, non_constant_identifier_names, duplicate_ignore
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sprintf/sprintf.dart';

class BlueToothShow extends StatefulWidget {
  BlueToothShow({super.key});
  // ignore: library_private_types_in_public_api
  late _BlueToothShow state;

  @override
  // ignore: library_private_types_in_public_api, no_logic_in_create_state
  _BlueToothShow createState() {
    state = _BlueToothShow();
    return state;
  }
}

// ignore: duplicate_ignore
class _BlueToothShow extends State<BlueToothShow> {
  // ignore: non_constant_identifier_names
  int temp = 97;
  int humi = 192;
  // ignore: non_constant_identifier_names
  int temp_l_t = 10;
  // ignore: non_constant_identifier_names
  int temp_h_t = 38;
  // ignore: non_constant_identifier_names
  int humi_l_t = 30;
  // ignore: non_constant_identifier_names
  int humi_h_t = 90;

  String temp_str = "25";
  String humi_str = "75";
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 640));

    return Container(
      padding: EdgeInsets.fromLTRB(0, ScreenUtil().setHeight(100), 0, 0),
      alignment: Alignment.center,
      child: Column(
        children: [
          Row(// turn off light
              children: [
            Container(
              margin: const EdgeInsets.all(15),
              // padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),

              child: const Text(
                "温度信息",
                style: TextStyle(
                  // backgroundColor: Color.fromARGB(255, 68, 85, 114),
                  color: Color.fromARGB(255, 11, 7, 197),
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  // letterSpacing: 20,
                  textBaseline: TextBaseline.ideographic,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.all(5),
              width: ScreenUtil().setWidth(70),
              height: ScreenUtil().setHeight(35),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 155, 137, 236), // 背景色
                // border: new Border.all(color: Color(0xFFFF0000), width: 0.5),// border
                borderRadius: BorderRadius.circular((8)), // 圆角
              ),
              child: Text(
                sprintf("%.2f", [(temp) / 256 * 200 - 50]),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color.fromARGB(255, 224, 218, 218),
                  fontSize: 18,
                  textBaseline: TextBaseline.ideographic,
                ),
              ),
            )
          ]),
          Row(// turn off light
              children: [
            Container(
              margin: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: const Text(
                "湿度信息",
                style: TextStyle(
                  //backgroundColor: Color.fromARGB(255, 68, 85, 114),
                  color: Color.fromARGB(255, 11, 7, 197),
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  // fontWeight: FontWeight.w700,
                  // letterSpacing: 20,
                  textBaseline: TextBaseline.ideographic,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.all(5),
              width: ScreenUtil().setWidth(70),
              height: ScreenUtil().setHeight(35),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 155, 137, 236), // 背景色
                // border: new Border.all(color: Color(0xFFFF0000), width: 0.5),// border
                borderRadius: BorderRadius.circular((8)), // 圆角
              ),
              child: Text(
                sprintf("%.2f", [(humi) / 256 * 100]),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color.fromARGB(255, 224, 218, 218),
                  fontSize: 18,
                  textBaseline: TextBaseline.ideographic,
                ),
              ),
            )
          ]),
          Row(// turn off light
              children: [
            Container(
              margin: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: const Text(
                "温度阈值",
                style: TextStyle(
                  //backgroundColor: Color.fromARGB(255, 68, 85, 114),
                  color: Color.fromARGB(255, 11, 7, 197),
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  // fontWeight: FontWeight.w700,
                  // letterSpacing: 20,
                  textBaseline: TextBaseline.ideographic,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.all(5),
              width: ScreenUtil().setWidth(70),
              height: ScreenUtil().setHeight(35),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 155, 137, 236), // 背景色
                // border: new Border.all(color: Color(0xFFFF0000), width: 0.5),// border
                borderRadius: BorderRadius.circular((8)), // 圆角
              ),
              child: Text(
                sprintf("%d", [temp_l_t]),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color.fromARGB(255, 224, 218, 218),
                  fontSize: 18,
                  textBaseline: TextBaseline.ideographic,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.all(5),
              width: ScreenUtil().setWidth(70),
              height: ScreenUtil().setHeight(35),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 155, 137, 236), // 背景色
                // border: new Border.all(color: Color(0xFFFF0000), width: 0.5),// border
                borderRadius: BorderRadius.circular((8)), // 圆角
              ),
              child: Text(
                sprintf("%d", [temp_h_t]),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color.fromARGB(255, 224, 218, 218),
                  fontSize: 18,
                  textBaseline: TextBaseline.ideographic,
                ),
              ),
            ),
          ]),
          Row(// turn off light
              children: [
            Container(
              margin: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: const Text(
                "湿度阈值",
                style: TextStyle(
                  //backgroundColor: Color.fromARGB(255, 68, 85, 114),
                  color: Color.fromARGB(255, 11, 7, 197),
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  // fontWeight: FontWeight.w700,
                  // letterSpacing: 20,
                  textBaseline: TextBaseline.ideographic,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.all(5),
              width: ScreenUtil().setWidth(70),
              height: ScreenUtil().setHeight(35),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 155, 137, 236), // 背景色
                // border: new Border.all(color: Color(0xFFFF0000), width: 0.5),// border
                borderRadius: BorderRadius.circular((8)), // 圆角
              ),
              child: Text(
                sprintf("%d", [humi_l_t]),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color.fromARGB(255, 224, 218, 218),
                  fontSize: 18,
                  textBaseline: TextBaseline.ideographic,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.all(5),
              width: ScreenUtil().setWidth(70),
              height: ScreenUtil().setHeight(35),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 155, 137, 236), // 背景色
                // border: new Border.all(color: Color(0xFFFF0000), width: 0.5),// border
                borderRadius: BorderRadius.circular((8)), // 圆角
              ),
              child: Text(
                sprintf("%d", [humi_h_t]),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color.fromARGB(255, 224, 218, 218),
                  fontSize: 18,
                  textBaseline: TextBaseline.ideographic,
                ),
              ),
            ),
          ]),
        ],
      ),
    );
  }

  void Update(int temp, int humi, int temp_l_t, int temp_h_t, int humi_l_t,
      int humi_h_t) {
    setState(() {
      this.temp = temp;
      this.humi = humi;
      // ignore: non_constant_identifier_names
      this.temp_l_t = temp_l_t;
      // ignore: non_constant_identifier_names
      this.temp_h_t = temp_h_t;
      // ignore: non_constant_identifier_names
      this.humi_l_t = humi_l_t;
      // ignore: non_constant_identifier_names
      this.humi_h_t = humi_h_t;
    });
  }
}
