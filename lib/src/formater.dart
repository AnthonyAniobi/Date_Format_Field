import 'package:flutter/material.dart';

class Formater {
  static int _parseInt(String input) {
    return int.parse(input);
  }

  static void _typeTemplate(String input, TextEditingController controller,
      String seperator, int lastIndex) {
    switch (input.length) {
      case 1:
        if (_parseInt(input) > 3) {
          controller.text = '0$input$seperator';
        }
        break;
      case 2:
        if (_parseInt(input) > 31) {
          controller.text = input[0];
        }
        break;
      case 3:
        if (input[2] != seperator) {
          controller.text = int.parse(input[2]) <= 1
              ? '${input.substring(0, 2)}$seperator${input[2]}'
              : '${input.substring(0, 2)}${seperator}0${input[2]}$seperator';
        }
        break;
      case 4:
        break;
      case 5:
        if (_parseInt(input.substring(3, 5)) > 12) {
          controller.text = input.substring(0, 4);
          break;
        }
        break;
      case 6:
        if (input[5] != seperator) {
          controller.text = '${input.substring(0, 5)}$seperator${input[5]}';
        }
        break;
      default:
        if (input.length == lastIndex) {
          controller.text = input.substring(0, lastIndex - 1);
        }
    }
    // move to the end of textfield
    controller.selection = TextSelection.fromPosition(
      TextPosition(offset: controller.text.length),
    );
  }

  static void type1(String input, TextEditingController controller) {
    _typeTemplate(input, controller, '/', 9);
  }

  static void type2(String input, TextEditingController controller) {
    _typeTemplate(input, controller, '/', 11);
  }

  static void type3(String input, TextEditingController controller) {
    _typeTemplate(input, controller, '-', 9);
  }

  static void type4(String input, TextEditingController controller) {
    _typeTemplate(input, controller, '-', 11);
  }
}
