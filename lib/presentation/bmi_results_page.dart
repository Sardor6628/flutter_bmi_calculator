import 'package:flutter/material.dart';
import 'package:flutter_bmi_calculator/business_logic/bmi_calculator_bl.dart';
import 'package:flutter_bmi_calculator/presentation/bmi_calculator_page.dart';
import 'package:get/get.dart';

class BmiResultsPage extends StatelessWidget {
  BmiCalculatorController controllerGet;

  BmiResultsPage({required this.controllerGet, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF181A30),
      appBar: AppBar(
        title: Text("Your Result",
            style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Color(0xFF181A30),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF1E2138),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text(
                        controllerGet.bmiCalculatorModel.value.checkAdult(),
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        controllerGet.bmiCalculatorModel.value
                            .calculateBmi()
                            .toStringAsFixed(1),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text("Normal BMI range:",
                          style: TextStyle(color: Colors.grey)),
                      SizedBox(height: 10),
                      Text(
                        "18.5 - 25 kg/m2",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Your age: ',
                              style: TextStyle(color: Colors.red),
                            ),
                            Text(
                              "${controllerGet.bmiCalculatorModel.value.age.toString()} (${controllerGet.bmiCalculatorModel.value.isMale ? "Male" : "Female"})",
                              style: TextStyle(color: Colors.white),
                            ),
                          ]),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Color(0xFF1E2138),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: RichText(
                      text: TextSpan(
                        text: "Suggestions: ",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 16,
                        ),
                        children: [
                          TextSpan(
                            text: controllerGet.bmiCalculatorModel.value
                                .getSuggestions(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.red),
                  ),
                  child: IconButton(
                      onPressed: () {
                        controllerGet.share(context);
                      }, icon: const Icon(Icons.share))),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.red),
                  ),
                  child: IconButton(
                      onPressed: () {
                        Get.offAll(() => BMICalculatorPage());
                      },
                      icon: const Icon(Icons.refresh))),
            ])
          ],
        ),
      ),
    );
  }
}
