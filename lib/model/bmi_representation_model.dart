import 'dart:developer';

class BmiCalculatorModel {
  double height;
  double weight;
  int age;
  bool isMale;

  BmiCalculatorModel({
    required this.height,
    required this.weight,
    required this.age,
    required this.isMale,
  });

  double calculateBmi() {
    log("Height: $height, Weight: $weight");
    return weight / (height * height/10000);
  }

  String checkAdult() {
    double bmi = calculateBmi();
    return age >= 2 && age <= 19 ? _getAdultCategory(bmi) : _getChildCategory(bmi);
  }

  String _getAdultCategory(double result) {
    if (result < 15) {
      return "Severe Thinness";
    } else if (result >= 15.0 && result <= 16.0) {
      return "Moderate Thinness";
    } else if (result > 16 && result <= 18.5) {
      return "Mild Thinness";
    } else if (result > 18.5 && result <= 25) {
      return "Normal";
    } else if (result > 25 && result <= 30) {
      return "Overweight";
    } else if (result > 30 && result <= 35) {
      return "Obese Class I";
    } else if (result > 35 && result <= 40) {
      return "Obese Class II";
    } else {
      return "Obese Class III";
    }
  }

  String _getChildCategory(double result) {
    if (result < 15) {
      return "very severely underweight";
    } else if (result >= 15.0 && result <= 16.0) {
      return "severely underweight";
    } else if (result > 16 && result <= 18.5) {
      return "underweight";
    } else if (result > 18.5 && result <= 25) {
      return "normal (healthy weight)";
    } else if (result > 25 && result <= 30) {
      return "overweight";
    } else if (result > 30 && result <= 35) {
      return "moderately obese";
    } else if (result > 35 && result <= 40) {
      return "severely obese";
    } else {
      return "very severely obese";
    }
  }

  String getSuggestions() {
    double bmi = calculateBmi();
    if (bmi < 18.5) {
      return "A BMI of under 18.5 indicates that a person has insufficient weight, so they may need to put on some weight. They should ask a doctor or dietitian for advice.";
    } else if (bmi >= 18.5 && bmi <= 24.9) {
      return "A BMI of 18.5–24.9 indicates that a person has a healthy weight for their height. By maintaining a healthy weight, they can lower their risk of developing serious health problems.";
    } else if (bmi >= 25 && bmi <= 29.9) {
      return "A BMI of 25–29.9 indicates that a person is slightly overweight. A doctor may advise them to lose some weight for health reasons. They should talk with a doctor or dietitian for advice.";
    } else {
      return "A BMI of over 30 indicates that a person has obesity. Their health may be at risk if they do not lose weight. They should talk with a doctor or dietitian for advice.";
    }
  }
}
