import 'package:flutter/material.dart';
import 'package:flutterwave_standard/flutterwave.dart';
import 'package:uuid/uuid.dart';

class FlutterWaveStandard extends StatefulWidget {
  FlutterWaveStandard(this.title);

  final String title;

  @override
  _FlutterWaveStandardState createState() => _FlutterWaveStandardState();
}

class _FlutterWaveStandardState extends State<FlutterWaveStandard> {
  //user requirements
  String user_name = "Anthony Aniobi";
  String user_email = "anthonyaniobi198@gmail.com";
  String user_encryptionKey = "FLWSECK_TEST0a4b7bbf9590";
  String user_pulicKey = "FLWPUBK_TEST-f9bdb540634cec99284ef323b60f492c-X";
  String user_phoneNumber = "09092202826";
  String payment_narration = "sample payment";
  String payment_amount = "1000";
  List<String> currencies = ["NGN", "RWF", "UGX", "ZAR", "USD", "GHS"];
  //end user requirements

  final narrationController = TextEditingController();

  String selectedCurrency = "USD";

  bool isTestMode = false;
  // final pbk = "FLWPUBK_TEST";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: ElevatedButton(
          onPressed: this._onPressed,
          child: Text("make payment"),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  _onPressed() {
    this._handlePaymentInitialization();
  }

  _handlePaymentInitialization() async {
    final style = FlutterwaveStyle(
      appBarText: "My Standard Blue",
      buttonColor: Color(0xffd0ebff),
      buttonTextStyle: TextStyle(
        color: Colors.deepOrangeAccent,
        fontSize: 16,
      ),
      appBarColor: Color(0xff8fa33b),
      dialogCancelTextStyle: TextStyle(
        color: Colors.brown,
        fontSize: 18,
      ),
      dialogContinueTextStyle: TextStyle(
        color: Colors.purpleAccent,
        fontSize: 18,
      ),
      mainBackgroundColor: Colors.indigo,
      mainTextStyle:
          TextStyle(color: Colors.indigo, fontSize: 19, letterSpacing: 2),
      dialogBackgroundColor: Colors.greenAccent,
      appBarIcon: Icon(Icons.message, color: Colors.purple),
      buttonText: "Pay $selectedCurrency$payment_amount",
      appBarTitleTextStyle: TextStyle(
        color: Colors.purpleAccent,
        fontSize: 18,
      ),
    );

    final Customer customer = Customer(
        name: user_name, phoneNumber: user_phoneNumber, email: user_email);

    try {
      final Flutterwave flutterwave = Flutterwave(
        context: context,
        style: style,
        publicKey: user_pulicKey,
        currency: this.selectedCurrency,
        txRef: Uuid().v1(),
        amount: payment_amount,
        customer: customer,
        paymentOptions: "card, payattitude",
        customization: Customization(title: "Test Payment"),
        isTestMode: isTestMode, // do something here
      );
      final ChargeResponse response = await flutterwave.charge();
      if (response != null) {
        this.showLoading(response.status.toString());
        print("${response.toJson()}");
      } else {
        this.showLoading("No Response!");
      }
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("Something went wrong"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Cancel")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return FlutterWaveStandard("payment");
                      }));
                    },
                    child: Text("Retry")),
              ],
            );
          });
    }
  }

  Future<void> showLoading(String message) {
    return showDialog(
      context: this.context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            margin: EdgeInsets.fromLTRB(30, 20, 30, 20),
            width: double.infinity,
            height: 50,
            child: Text(message),
          ),
        );
      },
    );
  }
}
