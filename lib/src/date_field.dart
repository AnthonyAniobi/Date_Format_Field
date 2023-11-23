import 'package:date_format_field/src/formater.dart';
import 'package:flutter/material.dart';

/// [DateFormatType] enum specifies the formating option for the date format
/// field.
///
/// example:
///
/// The date -> 2nd November 2022 is displayed in the different types as:
///
/// [type1] => 02/11/22
/// [type2] => 02/11/2022
/// [type3] => 02-11-22
/// [type4] => 02-11-2022

enum DateFormatType {
  type1, // 12/02/22
  type2, // 12/02/2022
  type3, // 12-02-22
  type4, // 12-02-2022
}

/// Base class for [DateFormatField]
///
/// [DateFormtField] automatically adds serparators to a custom datefield.
/// Specify the type of separators using the [DateFormatType] enumerators
///
/// Required inputs are:
///
/// [type] -> specifies the type of formating option
///
/// [onComplete] -> function providing a nullable [DateTime] object of your
/// selected date. The [onComplete] Datetime parameter remains null untill the
/// [DateFormatField] has been filled as required by the [DateFormatType] then
/// it returns a [DateTime] object based on your input.
///
/// Optional Inputs:
///
/// [addCalendar] -> sets the calendar icon on the [DateFormatField] which
/// can be used to select date using a date selection modal screen. The default
/// value is [true]
///
/// [decoration] -> this is the input for styling the [DateFormatField] this
/// is the same as the [InputDecoration] class for flutter default [TextFields]
/// so all styling on Textfield applies same here.

class DateFormatField extends StatefulWidget {
  const DateFormatField({
    super.key,
    required this.onComplete,
    required this.type,
    this.addCalendar = true,
    this.decoration,
    this.controller,
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

  /// TextEditingController for the date format field
  /// This is used to control the input text
  final TextEditingController? controller;
  @override
  State<DateFormatField> createState() => _DateFormatFieldState();
}

class _DateFormatFieldState extends State<DateFormatField> {
  late final TextEditingController _dobFormater;
  @override
  void initState() {
    _dobFormater = widget.controller ?? TextEditingController();
    super.initState();
  }

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
          icon: const Icon(
            Icons.calendar_month,
          ),
        ),
      );
    }
    return widget.decoration!.copyWith(
      suffixIcon: IconButton(
          onPressed: () {
            pickDate();
          },
          icon: const Icon(Icons.calendar_month)),
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
      String inputText;
      switch (widget.type) {
        case DateFormatType.type1:
          inputText = '${picked.day}/${picked.month}/${picked.year % 100}';
          break;
        case DateFormatType.type2:
          inputText = '${picked.day}/${picked.month}/${picked.year}';
          break;
        case DateFormatType.type3:
          inputText = '${picked.day}-${picked.month}-${picked.year % 100}';
          break;
        case DateFormatType.type4:
          inputText = '${picked.day}-${picked.month}-${picked.year}';
          break;
        default:
          inputText = '';
      }
      setState(() {
        _dobFormater.text = inputText;
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
