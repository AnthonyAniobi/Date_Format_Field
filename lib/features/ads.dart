import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter/material.dart';
import 'package:reusable_features/constants.dart';

String _adUnitId = adUnitId; // this is where you put your banner ad unit id

String _bannerUnitId = "ca-app-pub-3940256099942544/6300978111";
String _interstitialUnitId = "ca-app-pub-3940256099942544/1033173712";
String _rewardUnitId = "ca-app-pub-3940256099942544/5224354917";

BannerAdListener _bannerAdListener = BannerAdListener(
  onAdLoaded: (Ad ad) => print('the ad is loaded'),
  onAdFailedToLoad: (Ad ad, LoadAdError error) {
    ad.dispose();
    print('Ad failed to load: $error');
  },
  onAdOpened: (Ad ad) => print('Ad opened'),
  onAdClosed: (Ad ad) => print('Ad closed'),
  onAdImpression: (Ad ad) => print('Ad impression'),
);

BannerAd bannerAd = BannerAd(
  size: AdSize.banner,
  adUnitId: _bannerUnitId,
  listener: _bannerAdListener,
  request: AdRequest(),
);

AdWidget adWidget = AdWidget(ad: bannerAd);

showAd() {
  return Container(
    alignment: Alignment.center,
    child: adWidget,
    width: bannerAd.size.width.toDouble(),
    height: bannerAd.size.height.toDouble(),
  );
}

//interstitial ads
InterstitialAd? interstitialAd;

InterstitialAdLoadCallback interstitialCallback = InterstitialAdLoadCallback(
  onAdLoaded: (InterstitialAd ad) {
    print('$ad loaded');
    interstitialAd = ad;
    interstitialAd!.setImmersiveMode(true);
  },
  onAdFailedToLoad: (LoadAdError error) {
    print('InterstitialAd failed to load: $error.');
    interstitialAd = null;
    createInterstitialAd();
  },
);

void createInterstitialAd() {
  InterstitialAd.load(
    adUnitId: _interstitialUnitId,
    request: AdRequest(),
    adLoadCallback: interstitialCallback,
  );
}

void showInterstitialAd() {
  if (interstitialAd == null) {
    print('Warning: attempt to show interstitial before loaded.');
    return;
  }
  interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
    onAdShowedFullScreenContent: (InterstitialAd ad) =>
        print('ad onAdShowedFullScreenContent.'),
    onAdDismissedFullScreenContent: (InterstitialAd ad) {
      print('$ad onAdDismissedFullScreenContent.');
      ad.dispose();
      createInterstitialAd();
    },
    onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
      print('$ad onAdFailedToShowFullScreenContent: $error');
      ad.dispose();
      createInterstitialAd();
    },
  );
  interstitialAd!.show();
  interstitialAd = null;
}

//reward application
RewardedAd? rewardedAd;
dynamic _rewardEarned;

void createRewardedAd() {
  RewardedAd.load(
    adUnitId: _rewardUnitId,
    request: AdRequest(),
    rewardedAdLoadCallback: RewardedAdLoadCallback(
      onAdLoaded: (RewardedAd ad) {
        print('$ad loaded.');
        rewardedAd = ad;
      },
      onAdFailedToLoad: (LoadAdError error) {
        print('RewardedAd failed to load: $error');
        rewardedAd = null;
        createRewardedAd();
      },
    ),
  );
}

void showRewardedAd() {
  if (rewardedAd == null) {
    print('Warning: attempt to show rewarded before loaded.');
    return;
  }
  rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
    onAdShowedFullScreenContent: (RewardedAd ad) =>
        print('ad onAdShowedFullScreenContent.'),
    onAdDismissedFullScreenContent: (RewardedAd ad) {
      print('$ad onAdDismissedFullScreenContent.');
      ad.dispose();
      createRewardedAd();
    },
    onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
      print('$ad onAdFailedToShowFullScreenContent: $error');
      ad.dispose();
      createRewardedAd();
    },
  );

  rewardedAd!.setImmersiveMode(true);
  rewardedAd!.show(onUserEarnedReward: (RewardedAd ad, RewardItem reward) {
    print('$ad with reward $RewardItem(${reward.amount}, ${reward.type}');
    _rewardEarned = reward.amount;
  });
  rewardedAd = null;
}

int getReward() {
  int value = _rewardEarned ?? 0;
  return value;
}
