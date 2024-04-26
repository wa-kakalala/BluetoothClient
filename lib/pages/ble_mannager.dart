// 参考： https://github.com/qq2223996838/flutter_ble_mannager/blob/master/ble_mannager.dart
// ignore_for_file: avoid_print
import 'dart:typed_data';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:fluttertoast/fluttertoast.dart';
import "../pagetabs.dart";

late BluetoothConnection connection;

// ignore: non_constant_identifier_names
void connect_bluetooth() async {
  // Some simplest connection :F
  try {
    connection = await BluetoothConnection.toAddress("98:DA:50:03:35:C7");
    print('Connected to the device');
    Fluttertoast.showToast(
        msg: "connected",
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 1,
        fontSize: 16.0);
    connection.input!.listen((Uint8List data) {
      print(data);
      if (data[0] == 0xaa &&
          data[1] == 0x55 &&
          data[2] == 0x00 &&
          data[data.length - 1] == 0xff) {
        print("get data in protocol");

        blueshow.state
            .Update(data[3], data[4], data[5], data[6], data[7], data[8]);
      }

      // if (ascii.decode(data).contains('exit')) {
      //   connection.finish(); // Closing connection
      //   print('Disconnecting by local host');
      // }
    }).onDone(() {
      print('Disconnected by remote request');
      Fluttertoast.showToast(
          msg: "disconnected",
          toastLength: Toast.LENGTH_SHORT,
          timeInSecForIosWeb: 1,
          fontSize: 16.0);
    });
  } catch (exception) {
    print('Cannot connect, exception occured');
    Fluttertoast.showToast(
        msg: "disconnected",
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 1,
        fontSize: 16.0);
  }
}

// ignore: non_constant_identifier_names
void bluetooth_senddata(Uint8List data) {
  connection.output.add(data); // Sending data
}
