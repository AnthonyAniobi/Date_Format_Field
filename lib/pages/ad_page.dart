import 'package:flutter/material.dart';
import 'package:reusable_features/features/ads.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'reusable code',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AdPage(title: 'Flutter Reusable Code'),
    );
  }
}

class AdPage extends StatefulWidget {
  const AdPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<AdPage> createState() => _AdPageState();
}

class _AdPageState extends State<AdPage> {
  int _reward = 0;

  @override
  void initState() {
    super.initState();

    bannerAd.load();
    createInterstitialAd();
    createRewardedAd();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            showAd(),
            const Text(
              "an add project",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Result: ${getReward()}",
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    showInterstitialAd();
                  },
                  child: const Text("Interstitial"),
                ),
                ElevatedButton(
                  onPressed: () {
                    showRewardedAd();
                  },
                  child: const Text("reward"),
                ),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {});
                },
                child: Text("reload"))
          ],
        ),
      ),
    );
  }
}
