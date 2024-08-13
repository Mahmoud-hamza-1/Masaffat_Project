import 'package:ecommerce_application/view/screen/Updateprofile.dart';
import 'package:ecommerce_application/view/screen/qrGenerater.dart';
import 'package:ecommerce_application/view/widget/home/customProfileMenuWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart' as cc;
//import 'package:mobile_scanner/mobile_scanner.dart';
//import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class QRScanner extends StatefulWidget {
  const QRScanner({Key? key}) : super(key: key);

  @override
  State<QRScanner> createState() => QRScannerState();
}

class QRScannerState extends State<QRScanner> {
  String? scanResult = "Unknown";

  Future<void> startBarcodeScanStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
            '#ff6666', 'Cancel', true, ScanMode.BARCODE)!
        .listen((barcode) => print(barcode));
  }

  Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#00ffff', 'Cancel', true, ScanMode.QR);
      print("///////////////////////");
      print(barcodeScanRes);
      scanResult = "succed";
      print("///////////////////////");
    } on PlatformException {
      print("///////////////////////");
      barcodeScanRes = 'Failed to get platform version.';
      print("///////////////////////");
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      barcodeScanRes = barcodeScanRes;
    });
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      barcodeScanRes = barcodeScanRes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(title: const Text('Barcode scan')),
            body: Builder(builder: (BuildContext context) {
              return Container(
                  alignment: Alignment.center,
                  child: Flex(
                      direction: Axis.vertical,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ElevatedButton(
                            onPressed: () => scanBarcodeNormal(),
                            child: Text('Start barcode scan')),
                        ElevatedButton(
                            onPressed: () => scanQR(),
                            child: Text('Start QR scan')),
                        ElevatedButton(
                            onPressed: () => startBarcodeScanStream(),
                            child: Text('Start barcode scan stream')),
                        Text('Scan result : $scanResult\n',
                            style: TextStyle(fontSize: 20))
                      ]));
            })));

    //   Future<void> startBarcodeScanStream() async {
    //   FlutterBarcodeScanner.getBarcodeStreamReceiver(
    //           '#ff6666', 'Cancel', true, ScanMode.BARCODE)!
    //       .listen((barcode) => print(barcode));
    // }

    //   Future<void> scanCode() async {
    //     String barcodeScanRes;
    //     try{
    //     barcodeScanRes = await FlutterBarcodeScanner.scanBarcode("#ff6666", "cancel", true, ScanMode.QR);
    //     print(barcodeScanRes);
    //     }on PlatformException{
    //       barcodeScanRes = "failed to scan";
    //     }
    //     setState(() {
    //       scanResult = barcodeScanRes;
    //        print(barcodeScanRes);
    //     });
    //   }
    // @override
    // Widget build(BuildContext context) {

    //   return Scaffold(

    //     appBar:  AppBar(
    //       title: Text('QR Code Scannerrator'),
    //       actions: [

    //         IconButton(onPressed: (){
    //         scanCode();
    //         },
    //          icon: Icon(Icons.qr_code))
    //       ],

    //     ),

    //     // body: MobileScanner(
    //     //   onDetect: (capture){

    //     //   },

    //    // ),

    //   );
  }
}
