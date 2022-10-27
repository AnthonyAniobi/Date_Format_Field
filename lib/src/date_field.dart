import 'package:flutter/material.dart';

enum DateFormatType {
  type1, // 12/02/22
  type2, // 12/02/2022
  type3, // 12-02-22
  type4, // 12-02-2022
}

class DateFormatField extends StatefulWidget {
  const DateFormatField({super.key});

  @override
  State<DateFormatField> createState() => _DateFormatFieldState();
}

class _DateFormatFieldState extends State<DateFormatField> {
  final TextEditingController _dobFormater = TextEditingController();

  void formatInput(String value) {
    /// formater for the text input field
    if (value.length > 8) {
      _dobFormater.text = value.substring(0, 8);
    }
    if (value.length == 3) {
      _dobFormater.text = int.parse(value[2]) > 9
          ? '${value.substring(0, 2)}/${value[2]}'
          : '${value.substring(0, 2)}/0${value[2]}/';
    }
    if (value.length == 5) {
      _dobFormater.text = int.parse(value.substring(3, 5)) > 12
          ? '${value.substring(0, 2)}/0${value[2]}'
          : value;
    }
    _dobFormater.selection = TextSelection.fromPosition(
      TextPosition(offset: _dobFormater.text.length),
    );
    setState(() {});
  }

  Future<void> pickDate() async {
    /// pick the date directly from the screen
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != DateTime.now()) {
      setState(() {
        _dobFormater.text =
            '${picked.day}/${picked.month}/${picked.year % 100}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _dobFormater,
      keyboardType: TextInputType.datetime,
      onChanged: formatInput,
    );
  }
}
