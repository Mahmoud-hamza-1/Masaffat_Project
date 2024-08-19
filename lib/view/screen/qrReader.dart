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
  String? barcodeScanRessult = "Unknown";

  Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#00ffff', 'Cancel', true, ScanMode.QR);
      print("here is the res :");
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

    print("here is the res :");

    setState(() {
      barcodeScanRes = barcodeScanRes;
      barcodeScanRessult = barcodeScanRessult;
      print("here is the res2 :");
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
                            onPressed: () => scanQR(),
                            child: Text('Start QR scan')),
                        Text(
                            'Scan result : $scanResult  && /n $barcodeScanRessult',
                            style: TextStyle(fontSize: 20))
                      ]));
            })));
  }
}
