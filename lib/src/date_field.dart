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
    required this.onComplete,
    required this.type,
    this.addCalendar = true,
    this.decoration,
  });

  /// [InputDecoration] a styling class for form field
  ///
  /// This is the default flutter Input decoration used to style input fields
  final InputDecoration? decoration;

  /// [DateFormatType] is an enum for specifying the type
  final DateFormatType type;

  /// [onSubmit] returns a nullable Datetime object
  ///
  /// Returns null when the datetime field is not complete
  /// Returns a datetime object when the field has been completed
  final Function(DateTime?) onComplete;

  /// [addCalendar] sets a button that allows the selection of date from a
  /// calendar pop up
  final bool addCalendar;

  @override
  State<DateFormatField> createState() => _DateFormatFieldState();
}

class _DateFormatFieldState extends State<DateFormatField> {
  final TextEditingController _dobFormater = TextEditingController();

  InputDecoration? decoration() {
    if (!widget.addCalendar) {
      return widget.decoration;
    }
    if (widget.decoration == null) {
      return InputDecoration(
          suffixIcon: IconButton(
              onPressed: () {
                pickDate();
              },
              icon: Icon(Icons.calendar_month)));
    }
    return widget.decoration!.copyWith(
      suffixIcon: IconButton(
          onPressed: () {
            pickDate();
          },
          icon: Icon(Icons.calendar_month)),
    );
  }

  void formatInput(String value) {
    /// formater for the text input field
    DateTime? _completeDate;
    switch (widget.type) {
      case DateFormatType.type1:
        _completeDate = Formater.type1(value, _dobFormater);
        break;
      case DateFormatType.type2:
        _completeDate = Formater.type2(value, _dobFormater);
        break;
      case DateFormatType.type3:
        _completeDate = Formater.type3(value, _dobFormater);
        break;
      case DateFormatType.type4:
        _completeDate = Formater.type4(value, _dobFormater);
        break;
      default:
    }
    setState(() {
      // update the datetime
      widget.onComplete(_completeDate);
    });
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
      onTap: () {
        _dobFormater.selection = TextSelection.fromPosition(
          TextPosition(offset: _dobFormater.text.length),
        );
      },
      decoration: decoration(),
      keyboardType: TextInputType.datetime,
      onChanged: formatInput,
    );
  }
}
