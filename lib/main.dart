import 'package:flutter/material.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:reusable_features/features/ads.dart';
import 'package:reusable_features/features/flutterwave_pay.dart';
import 'package:reusable_features/features/flutterwave_standard_pay.dart';

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
      home: FlutterWaveStandard(
        "payment",
      ),
    );
  }
}
