<h1>Reusable Flutter Features</h1>

<p>This project saves codes for applications that would be used for various applications such as:</p>
<ul>
<li>Admob Integration</li>
</ul>

<h2>Google Admob</h2>
<p>Google admob application
\b Add your flutter id in the link in your android manifest: </p>

```
<meta-data
            android:name="com.google.android.gms.ads.APPLICATION_ID"
            android:value="your admob id"/>
```

<p>Increase the minimum sdk to 19 and above</p>

```
android{
    defaultConfig{
        minSdkVersion 19
    }
}
```

<p>Add internet permission to your application</p>

```
<uses-permission android:name="android.permission.INTERNET"/>
```

<p>Import the library for the google mobile admob</p>

```
    import 'package:google_mobile_ads/google_mobile_ads.dart';
```

<p>Initialize the admob in your main file</p>

```
    void main() {
    WidgetsFlutterBinding.ensureInitialized();
    MobileAds.instance.initialize();

    runApp(MyApp());
    }
```

<h3>Banner Ads</h3>
load the banner ad using the code below 'bannerAd.load()' in the initState method and call the banner ad widget using the 'showAd()' function. This is placed in the widget tree.

```
// load the banner ad
void initState{
    bannerAd.load();
}

//start the banner ad
showAd()
```

<h3>Interstitial Ads</h3>
load the Interstitial ad in the initstate function using the 'createInterstitialAd()' and show the interstitial ads using the function 'showInterstitialAd()'. Note the interstitial ad is not a widget and should not be placed within the widget tree. It should rather be put in a button or in an event that should be triggered

```
//load the interstitial Ad
void initState{
    createInterstitialAd();
}

//start the interstitial Ad
showInterstitialAd()
```

<h3>Reward Ads</h3>
loading the reward ads like other ads using the 'createRewardedAd()' function and then show the reward ad using 'showRewardAd()'. The reward ad is also not a widget and should be called on an event

```
//load the reward Ad
void initState{
    createRewardedAd();
}

//start the reward Ad
showRewardedAd();
```

Get result reward value from the rewarded ad using the function 'getReward()'. This returns the value of reward in integers

```
//get value of reward
int rewardValue = getReward()
```

for any of the ads, save the ads.dart file and call all the functions from the file