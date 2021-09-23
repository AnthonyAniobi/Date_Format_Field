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

load the banner ad using the code below 'bannerAd.load()' in the initState method

```
bannerAd.load();
```

put t