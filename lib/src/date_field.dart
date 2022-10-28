import 'package:date_format_field/date_format_field.dart';
import 'package:date_format_field/src/formater.dart';
import 'package:flutter/material.dart';

enum DateFormatType {
  type1, // 12/02/22
  type2, // 12/02/2022
  type3, // 12-02-22
  type4, // 12-02-2022
}

class DateFormatField extends StatefulWidget {
  const DateFormatField({
    super.key,
    required this.type,
    this.decoration,
  });

  /// textfield decoration
  final InputDecoration? decoration;

  /// date format type
  final FormaterType type;

  @override
  State<DateFormatField> createState() => _DateFormatFieldState();
}

class _DateFormatFieldState extends State<DateFormatField> {
  final TextEditingController _dobFormater = TextEditingController();

  void formatInput(String value) {
    /// formater for the text input field
    switch (widget.type) {
      case FormaterType.Type1:
        Formater.type1(value, _dobFormater);
        break;
      case FormaterType.Type2:
        Formater.type2(value, _dobFormater);
        break;
      case FormaterType.Type3:
        Formater.type3(value, _dobFormater);
        break;
      case FormaterType.Type4:
        Formater.type4(value, _dobFormater);
        break;
      default:
    }
    Formater.type2(value, _dobFormater);
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
