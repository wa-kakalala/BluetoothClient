// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:fluttertoast/fluttertoast.dart';


class LigheControl extends StatelessWidget {
  FlutterBlue flutterBlue = FlutterBlue.instance;

  LigheControl({super.key});


  @override
  Widget build(BuildContext context){
    ScreenUtil.init( context, designSize:const Size(360,640));
    flutterBlue.state.listen((state){
      if(state == BluetoothState.on){
        Fluttertoast.showToast(msg:'蓝牙状态为开启');

      }else if(state == BluetoothState.off){
        Fluttertoast.showToast(msg:"蓝牙状态为关闭");
      }
    });
    return Container(
      padding: EdgeInsets.fromLTRB(0, ScreenUtil().setHeight(130), 0, 0),
      alignment: Alignment.center,
      child: Column(   
        children: [
          SizedBox(  // turn on light
            height: ScreenUtil().setHeight(90),
            width: ScreenUtil().setWidth(150),
            
          ),
          Container( // turn off light
            margin: EdgeInsets.fromLTRB(0, ScreenUtil().setHeight(80), 0, 0),
            height: ScreenUtil().setHeight(90),
            width: ScreenUtil().setWidth(150),
            
          ),
      ],
      ),
    );
  }
}