import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bmi_calculator/business_logic/bmi_calculator_bl.dart';
import 'package:flutter_bmi_calculator/constants/constants.dart';
import 'package:flutter_bmi_calculator/presentation/bmi_results_page.dart';
import 'package:get/get.dart';

class BMICalculatorPage extends StatefulWidget {
  @override
  _BMICalculatorPageState createState() => _BMICalculatorPageState();
}

class _BMICalculatorPageState extends State<BMICalculatorPage> {
  final controllerGet = Get.put(BmiCalculatorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF181A30),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(
              () => Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _genderSelectionCard(
                    "Male",
                    Icons.male,
                    controllerGet.bmiCalculatorModel.value.isMale,
                  ),
                  _genderSelectionCard(
                    "Female",
                    Icons.female,
                    !controllerGet.bmiCalculatorModel.value.isMale,
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFF1E2138),
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      "HEIGHT",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "${controllerGet.bmiCalculatorModel.value.height.toInt()} cm",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Obx(
                          () => SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          trackHeight: 2,
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: Colors.white.withOpacity(0.5),
                          thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 8.0),
                          overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 16.0),
                          thumbColor: Colors.red,
                          overlayColor: Colors.red.withOpacity(0.2),
                        ),
                        child: Slider(
                          value: controllerGet.bmiCalculatorModel.value.height,
                          min: MIN_HEIGHT,
                          max: MAX_HEIGHT,
                          onChanged: (value) {
                            log("Height: $value");
                            controllerGet.updateHeight(value);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _counterCard(
                    "WEIGHT",
                    controllerGet.bmiCalculatorModel.value.weight.toInt(),
                        () {
                      controllerGet.updateWeight(
                        controllerGet.bmiCalculatorModel.value.weight + 1,
                      );
                    },
                        () {
                      controllerGet.updateWeight(
                        controllerGet.bmiCalculatorModel.value.weight - 1,
                      );
                    },
                  ),
                  _counterCard(
                    "AGE",
                    controllerGet.bmiCalculatorModel.value.age,
                        () {
                      controllerGet.updateAge(
                        controllerGet.bmiCalculatorModel.value.age + 1,
                      );
                    },
                        () {
                      controllerGet.updateAge(
                        controllerGet.bmiCalculatorModel.value.age - 1,
                      );
                    },
                  ),
                ],
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Colors.red,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  textStyle:
                  TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Get.offAll(()=>BmiResultsPage(controllerGet: controllerGet,));
                },
                child: Text("CALCULATE YOUR BMI", style: TextStyle(color: Colors.white),),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _genderSelectionCard(String gender, IconData icon, bool isSelected) {
    return GestureDetector(
      onTap: () {
        controllerGet.updateGender(gender == "Male");
      },
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFF272A4E) : Color(0xFF1E2138),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: EdgeInsets.all(16),
        width: 150,
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 80,
            ),
            SizedBox(height: 10),
            Text(
              gender,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _counterCard(
      String label,
      int value,
      VoidCallback onIncrement,
      VoidCallback onDecrement,
      ) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF1E2138),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: EdgeInsets.all(16),
      width: 150,
      height: 150,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "$value",
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: onDecrement,
                  child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.remove, color: Colors.black),
                  ),
                ),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: onIncrement,
                  child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.add, color: Colors.black),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
