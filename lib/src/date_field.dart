import 'package:flutter/material.dart';

enum DateFormatType {
  type1,
  type2,
  type3,
  type4,
}

class DateFormatField extends StatefulWidget {
  const DateFormatField({super.key});

  @override
  State<DateFormatField> createState() => _DateFormatFieldState();
}

class _DateFormatFieldState extends State<DateFormatField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.datetime,
    );
  }
}
