import 'package:flutter/material.dart';
import 'package:reusable_features/constants.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:reusable_features/features/ads.dart';
import 'package:reusable_features/features/flutterwave_pay.dart';
import 'package:reusable_features/features/flutterwave_standard_pay.dart';
import 'package:reusable_features/features/pay.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // MobileAds.instance.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'reusable code',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPay(),
    );
  }
}

class MainPay extends StatelessWidget {
  const MainPay({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: ElevatedButton(
        child: Text("pay", 
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),), 
      onPressed: (){
        bool payhandler = makePayment(
          context: context, 
          amount: 100, 
          currency: 1, 
          encryptionKey: ENCRYPTION_KEY, 
          publicKey: PUBLIC_KEY, 
          phoneNumber: "09092202826", 
          paymentNarration: "some narration", 
          userName: "Anthony Aniobi", 
          userEmail: "anthonyaniobi198@gmail.com", 
          paymentTitle: "Payment for the ads");
          
          print("payment of the flutter application $payhandler");
          },
        ),
      ),
    );
  }
}
