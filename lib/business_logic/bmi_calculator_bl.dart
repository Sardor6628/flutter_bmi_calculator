import 'package:flutter_bmi_calculator/constants/constants.dart';
import 'package:flutter_bmi_calculator/model/bmi_representation_model.dart';
import 'package:get/get.dart';

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
}
