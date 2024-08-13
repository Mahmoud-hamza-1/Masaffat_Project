import 'package:ecommerce_application/view/screen/Updateprofile.dart';
import 'package:ecommerce_application/view/screen/qrGenerater.dart';
import 'package:ecommerce_application/view/widget/home/customProfileMenuWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart' as cc;
import 'package:qr_flutter/qr_flutter.dart';

//import 'package:mobile_scanner/mobile_scanner.dart';
//import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class QRGenerator extends StatefulWidget {
  const QRGenerator({Key? key}) : super(key: key);

  @override
  State<QRGenerator> createState() => QRGeneratorState();
}

class QRGeneratorState extends State<QRGenerator> {
final GlobalKey globalKey = GlobalKey();
String qrdata = "";


 





  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: const Text('Barcode scan')),
            body: Builder(builder: (BuildContext context) {
              return SingleChildScrollView(

                child:
                
                 Column(
                  children: [
                    SizedBox(height: 30,),
                    RepaintBoundary(
                      key: globalKey,
                      child: Container(
                        color: Colors.white,
                        child: Center(
                          
                          child:qrdata.isEmpty? Text("Enter Data please") :
                           QrImageView(data: qrdata,version: QrVersions.auto,size:200 ,)

                          
                          ,
                        ),

                      ),
                    ),

                    SizedBox(height: 50,),
                    TextField(
                      decoration: InputDecoration(
                        hintText:  "Enter a code to generate",
                        border: OutlineInputBorder(),
                        
                      ),
                      
                      onChanged: (value) {
                        
                        setState(() {
                          qrdata = value;

                      });
                      }

                    ),

                      
                  ],
                 )
                        
                        ,
              );
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
