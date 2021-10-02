import 'package:flutter/material.dart';
import 'package:flutterwave_standard/flutterwave.dart';
import 'package:uuid/uuid.dart';


bool makePayment({
  required BuildContext context,
  required int amount,
  required int currency,
  required String encryptionKey,
  required String publicKey,
  required String phoneNumber,
  required String paymentNarration,
  required String userName,
  required String userEmail,
  required String paymentTitle,
  })
{
  bool val = false; // the output value

  handlePaymentInitialization(
    context: context,
    amount: amount,
    currency: currency,
    encryptionKey: encryptionKey,
    publicKey: publicKey,
    phoneNumber: phoneNumber,
    paymentNarration: paymentNarration,
    userName: userName,
    userEmail: userEmail,
    paymentTitle: paymentTitle
  ).then((result){ val = result;});

  return val;
}


// simplified payment using the standard flutterwave package
Future<bool> handlePaymentInitialization({
  required BuildContext context,
  required int amount,
  required int currency,
  required String encryptionKey,
  required String publicKey,
  required String phoneNumber,
  required String paymentNarration,
  required String userName,
  required String userEmail,
  required String paymentTitle,
}) async {
  const List<String> currencies = ["USD", "NGN", "RWF", "UGX", "ZAR", "GHS"];

  String userEmail = "anthonyaniobi198@gmail.com";
  String phoneNumber = "09092202826";
  String paymentNarration = "sample payment";
  String paymentAmount = amount.toString();
  String selectedCurrency = currencies[currency];

  final style = FlutterwaveStyle(
    appBarText: "PaymentTitle",
    buttonColor: Color(0xffd0ebff),
    buttonTextStyle: const TextStyle(
      color: Colors.black,
      fontSize: 16,
    ),
    appBarColor: Theme.of(context).bottomAppBarColor,
    dialogCancelTextStyle: const TextStyle(
      color: Colors.grey,
      fontSize: 18,
    ),
    dialogContinueTextStyle: const TextStyle(
      color: Colors.black,
      fontSize: 18,
    ),
    mainBackgroundColor: Colors.white,
    mainTextStyle:
        const TextStyle(color: Colors.black, fontSize: 19, letterSpacing: 2),
    dialogBackgroundColor: Colors.white,
    appBarIcon: const Icon(Icons.payment, color: Colors.black),
    buttonText: "Pay $selectedCurrency$paymentAmount",
    appBarTitleTextStyle: const TextStyle(
      color: Colors.black,
      fontSize: 18,
    ),
  );

  final Customer customer =
      Customer(name: userName, phoneNumber: phoneNumber, email: userEmail);

  try {
    final Flutterwave flutterwave = Flutterwave(
      context: context,
      style: style,
      publicKey: publicKey,
      currency: selectedCurrency,
      txRef: Uuid().v1(),
      amount: paymentAmount,
      customer: customer,
      paymentOptions: "card, payattitude",
      customization: Customization(title: "Test Payment"),
      isTestMode: false, // do something here
    );
    final ChargeResponse response = await flutterwave.charge();
    // if (response != null) {
    //   this.showLoading(response.status.toString());
    //   print("${response.toJson()}");
    // } else {
    //   this.showLoading("No Response!");
    // }
    if (response.toJson().toString().contains("successful")) {
      return true;
    } else {
      return false;
    }
  } catch (e) {
    // print(e);
    // Navigator.pop(context);
    return false;
  }
}
