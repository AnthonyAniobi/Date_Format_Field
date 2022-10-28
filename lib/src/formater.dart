import 'package:flutter/material.dart';

class Formater {
  static int _parseInt(String input) {
    return int.parse(input);
  }

  // static checkParse(String input){
  //   int parsed = int.tryParse(source)
  // }

  static void type1(String input, TextEditingController controller) {
    if (input.length == 1 && _parseInt(input[0]) > 3) {
      controller.text = '0$input';
    } else if (input.length == 2) {
      // controller.text = int.parse(input[2]) > 9
      //     ? '${input.substring(0, 2)}/${input[2]}'
      //     : '${input.substring(0, 2)}/0${input[2]}/';
    } else if (input.length == 3) {
      if (input[2] != '/') {
        controller.text = int.parse(input[2]) <= 1
            ? '${input.substring(0, 2)}/${input[2]}'
            : '${input.substring(0, 2)}/0${input[2]}/';
      }
    }
    if (input.length == 5) {
      print(input.substring(3, 5));
      controller.text = int.parse(input.substring(3, 5)) > 12
          ? '${input.substring(0, 2)}/0${input[2]}'
          : input;
    }
    if (input.length > 8) {
      controller.text = input.substring(0, 8);
    }
    controller.selection = TextSelection.fromPosition(
      TextPosition(offset: controller.text.length),
    );
  }
}
