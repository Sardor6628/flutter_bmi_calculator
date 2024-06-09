import 'package:flutter/material.dart';
import 'package:flutter_bmi_calculator/constants/constants.dart';
import 'package:flutter_bmi_calculator/model/bmi_representation_model.dart';
import 'package:get/get.dart';
import 'package:share/share.dart';

class BmiCalculatorController extends GetxController {
  Rx<BmiCalculatorModel> bmiCalculatorModel =
      BmiCalculatorModel(height: 100, weight: 40, age: 16, isMale: true).obs;

  void updateHeight(double height) {
    if (height < MIN_HEIGHT || height > MAX_HEIGHT) {
      return;
    }
    bmiCalculatorModel.update((val) {
      val!.height = height;
    });
  }

  void updateWeight(double weight) {
    if (weight < MIN_WEIGHT || weight > MAX_WEIGHT) {
      return;
    }
    bmiCalculatorModel.update((val) {
      val!.weight = weight;
    });
  }

  void updateAge(int age) {
    if (age < MIN_AGE || age > MAX_AGE) {
      return;
    }
    bmiCalculatorModel.update((val) {
      val!.age = age;
    });
  }

  void updateGender(bool isMale) {
    bmiCalculatorModel.update((val) {
      val!.isMale = isMale;
    });
  }

  void share(BuildContext context) {
    final strShareMessage =
        'Hello!! my BMI is ${bmiCalculatorModel.value.calculateBmi()}\n\n' +
            'my current condition: ${bmiCalculatorModel.value.checkAdult()}\n' +
            'my age is: ${bmiCalculatorModel.value.age}\n\n' +
            'App suggested me that: ${bmiCalculatorModel.value.getSuggestions()}';

    try {
      final RenderBox box = context.findRenderObject() as RenderBox;
      Share.share(strShareMessage,
          subject: 'Share BMI Info',
          sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
    } catch (e) {
      final snackBar = SnackBar(content: Text(e.toString()));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
