// ignore_for_file: library_private_types_in_public_api, unnecessary_new, non_constant_identifier_names
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'ble_mannager.dart';

class BlueToothControl extends StatefulWidget {
  const BlueToothControl({super.key});
  @override
  _BlueToothControl createState() => _BlueToothControl();
}

int pump = 0;
int light = 0;

int t_dec = 0;

int t_inc = 0;

class _BlueToothControl extends State<BlueToothControl> {
  final TextEditingController _temp_l_controller = new TextEditingController();

  final TextEditingController _temp_h_controller = new TextEditingController();

  final TextEditingController _humi_l_controller = new TextEditingController();

  final TextEditingController _humi_h_controller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 640));
    return Container(
      padding: EdgeInsets.fromLTRB(0, ScreenUtil().setHeight(60), 0, 0),
      alignment: Alignment.center,
      child: Column(
        children: [
          Row(// turn off light
              children: [
            Container(
              margin: const EdgeInsets.all(20),
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
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(5),
              width: ScreenUtil().setWidth(80),
              height: ScreenUtil().setHeight(35),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 155, 137, 236), // 背景色
                // border: new Border.all(color: Color(0xFFFF0000), width: 0.5),// border
                borderRadius: BorderRadius.circular((8)), // 圆角
              ),
              child: TextField(
                controller: _temp_l_controller,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color.fromARGB(255, 224, 218, 218),
                  fontSize: 18,
                  textBaseline: TextBaseline.ideographic,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(5),
              width: ScreenUtil().setWidth(80),
              height: ScreenUtil().setHeight(35),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 155, 137, 236), // 背景色
                // border: new Border.all(color: Color(0xFFFF0000), width: 0.5),// border
                borderRadius: BorderRadius.circular((8)), // 圆角
              ),
              child: TextField(
                controller: _temp_h_controller,
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
              margin: const EdgeInsets.all(20),
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
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(5),
              width: ScreenUtil().setWidth(80),
              height: ScreenUtil().setHeight(35),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 155, 137, 236), // 背景色
                // border: new Border.all(color: Color(0xFFFF0000), width: 0.5),// border
                borderRadius: BorderRadius.circular((8)), // 圆角
              ),
              child: TextField(
                controller: _humi_l_controller,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color.fromARGB(255, 224, 218, 218),
                  fontSize: 18,
                  textBaseline: TextBaseline.ideographic,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(5),
              width: ScreenUtil().setWidth(80),
              height: ScreenUtil().setHeight(35),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 155, 137, 236), // 背景色
                // border: new Border.all(color: Color(0xFFFF0000), width: 0.5),// border
                borderRadius: BorderRadius.circular((8)), // 圆角
              ),
              child: TextField(
                controller: _humi_h_controller,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color.fromARGB(255, 224, 218, 218),
                  fontSize: 18,
                  textBaseline: TextBaseline.ideographic,
                ),
              ),
            ),
          ]),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: MaterialButton(
              textColor: Colors.white,
              color: Colors.blue,
              child: const Text(
                '设置',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onPressed: () {
                int t_l = int.parse(_temp_l_controller.text);
                int t_h = int.parse(_temp_h_controller.text);
                int h_l = int.parse(_humi_l_controller.text);
                int h_h = int.parse(_humi_h_controller.text);

                if (h_l < 0) h_l = 0;
                if (h_l >= 100) h_l = 100;
                if (h_h < 0) h_l = 0;
                if (h_h >= 100) h_l = 100;
                if (h_l > h_h) {
                  h_l = 20;
                  h_h = 80;
                }

                if (t_l < 0) t_l = 0;
                if (t_l > 255) t_l = 255;
                if (t_h < 0) t_h = 0;
                if (t_h > 255) t_h = 255;

                if (t_l > t_h) {
                  t_l = 10;
                  t_h = 40;
                }

                Uint8List data = Uint8List(8);
                data[0] = 0xaa;
                data[1] = 0x55;
                data[2] = 0x02;
                data[3] = t_l;
                data[4] = t_h;
                data[5] = h_l;
                data[6] = h_h;
                data[7] = 0xff;
                bluetooth_senddata(data);
              },
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              margin: const EdgeInsets.all(20),
              child: MaterialButton(
                textColor: Colors.white,
                color: Colors.blue,
                child: const Text(
                  '水泵',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                onPressed: () {
                  if (pump == 0) {
                    pump = 1;
                  } else {
                    pump = 0;
                  }
                  Uint8List data = Uint8List(6);
                  data[0] = 0xaa;
                  data[1] = 0x55;
                  data[2] = 0x03;
                  data[3] = 0x00;
                  data[4] = pump;
                  data[5] = 0xff;
                  bluetooth_senddata(data);
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: MaterialButton(
                textColor: Colors.white,
                color: Colors.blue,
                child: const Text(
                  '补光',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                onPressed: () {
                  if (light == 0) {
                    light = 1;
                  } else {
                    light = 0;
                  }
                  Uint8List data = Uint8List(6);
                  data[0] = 0xaa;
                  data[1] = 0x55;
                  data[2] = 0x03;
                  data[3] = 0x01;
                  data[4] = light;
                  data[5] = 0xff;
                  bluetooth_senddata(data);
                },
              ),
            ),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              margin: const EdgeInsets.all(20),
              child: MaterialButton(
                textColor: Colors.white,
                color: Colors.blue,
                child: const Text(
                  '升温',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                onPressed: () {
                  if (t_inc == 0) {
                    t_inc = 1;
                  } else {
                    t_inc = 0;
                  }
                  Uint8List data = Uint8List(6);
                  data[0] = 0xaa;
                  data[1] = 0x55;
                  data[2] = 0x03;
                  data[3] = 0x02;
                  data[4] = t_inc;
                  data[5] = 0xff;

                  bluetooth_senddata(data);
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: MaterialButton(
                textColor: Colors.white,
                color: Colors.blue,
                child: const Text(
                  '降温',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                onPressed: () {
                  if (t_dec == 0) {
                    t_dec = 1;
                  } else {
                    t_dec = 0;
                  }
                  Uint8List data = Uint8List(6);
                  data[0] = 0xaa;
                  data[1] = 0x55;
                  data[2] = 0x03;
                  data[3] = 0x03;
                  data[4] = t_dec;
                  data[5] = 0xff;

                  bluetooth_senddata(data);
                },
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
