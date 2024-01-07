import 'package:flutter/services.dart';

class InputFormater{
  static TextInputFormatter get type1(){}
}

class _Type1 extends TextInputFormatter{
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    // TODO: implement formatEditUpdate
    TextEditingValue result = TextEditingValue()
    throw UnimplementedError();
  }
}

class _Type2 extends TextInputFormatter {
  final String sep;

  _Type2(this.sep);

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Short-circuit if the new value is empty
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    }

    // Handle "deletion" of separator character
    String oldValueText = oldValue.text.replaceAll(' ', '');
    String newValueText = newValue.text.replaceAll(' ', '');

    // return old text if new text is not a number
    // this would fail if the separator is not available
    if(int.tryParse(newValue.text)==null){
      return oldValue;
    }
    // Only process if the old value and new value are different
    if (oldValueText != newValueText) {
      int selectionIndex =
          newValue.text.length - newValue.selection.extentOffset;
      String newString = '';
      switch (newValueText.length) {
        case 1:
          newString = newValueText;
          break;
        case 2:
          newString = '$newValueText$sep';
          break;
        case 3:
          newString = 3;
          break;
        default:
      }
      int value = int.tryParse(newValueText) ?? 1;
      

      return TextEditingValue(
        text: newString,
        selection: TextSelection.collapsed(
          offset: newString.length - selectionIndex,
        ),
      );
    }

    // If the new value and old value are the same, just return as-is
    return newValue;
  }
}
