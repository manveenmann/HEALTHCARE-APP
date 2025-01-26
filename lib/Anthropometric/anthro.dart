
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:project_app/theme/app_colors.dart'; // Assuming you already have this theme file

class AnthropometricDetailsPage extends StatefulWidget {
  @override
  _AnthropometricDetailsPageState createState() =>
      _AnthropometricDetailsPageState();
}

class _AnthropometricDetailsPageState
    extends State<AnthropometricDetailsPage> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  double? bmi;
  String bmiCategory = "";
  String gender = "Male";

  void calculateBMI() {
    double weight = double.tryParse(weightController.text) ?? 0.0;
    double heightCm = double.tryParse(heightController.text) ?? 0.0;

    if (weight > 0 && heightCm > 0) {
      double heightM = heightCm / 100;
      bmi = weight / (heightM * heightM);

      setState(() {
        if (bmi! < 16.5) {
          bmiCategory = "Severely Underweight";
        } else if (bmi! >= 16.5 && bmi! < 18.5) {
          bmiCategory = "Underweight";
        } else if (bmi! >= 18.5 && bmi! < 25.0) {
          bmiCategory = "Normal";
        } else if (bmi! >= 25.0 && bmi! < 30.0) {
          bmiCategory = "Overweight";
        } else {
          bmiCategory = "Obese";
        }
      });
    }
  }

  Widget buildInputField(
      {required String label, required TextEditingController controller}) {
    return Flexible(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 3,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: TextFormField(
          controller: controller,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, color: Colors.black),
          decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(fontSize: 16, color: AppColors.primaryColor),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor, // Using theme color for background
      appBar: AppBar(
        title: Text(
          'BMI Calculator',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColors.primaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildInputField(label: "Age", controller: ageController),
                  SizedBox(width: 16),
                  buildInputField(label: "Height (cm)", controller: heightController),
                  SizedBox(width: 16),
                  buildInputField(label: "Weight (kg)", controller: weightController),
                ],
              ),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ChoiceChip(
                    label: Text('Female', style: TextStyle(fontSize: 16)),
                    selected: gender == "Female",
                    selectedColor: AppColors.secondaryColor,
                    onSelected: (selected) {
                      setState(() {
                        gender = "Female";
                      });
                    },
                  ),
                  SizedBox(width: 16),
                  ChoiceChip(
                    label: Text('Male', style: TextStyle(fontSize: 16)),
                    selected: gender == "Male",
                    selectedColor: AppColors.secondaryColor,
                    onSelected: (selected) {
                      setState(() {
                        gender = "Male";
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  calculateBMI();
                },
                child: Text('Calculate BMI',style:TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.secondaryColor,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 24),
              if (bmi != null)
                Column(
                  children: [
                    SfRadialGauge(
                      axes: <RadialAxis>[
                        RadialAxis(
                          minimum: 10,
                          maximum: 40,
                          showLabels: false,
                          showTicks: false,
                          axisLineStyle: AxisLineStyle(
                            thickness: 0.2,
                            thicknessUnit: GaugeSizeUnit.factor,
                          ),
                          ranges: <GaugeRange>[
                            GaugeRange(
                              startValue: 10,
                              endValue: 16.4,
                              color: Colors.blue,
                            ),
                            GaugeRange(
                              startValue: 16.5,
                              endValue: 18.4,
                              color: Colors.lightBlue,
                            ),
                            GaugeRange(
                              startValue: 18.5,
                              endValue: 24.9,
                              color: Colors.green,
                            ),
                            GaugeRange(
                              startValue: 25.0,
                              endValue: 29.9,
                              color: Colors.orange,
                            ),
                            GaugeRange(
                              startValue: 30.0,
                              endValue: 40.0,
                              color: Colors.red,
                            ),
                          ],
                          pointers: <GaugePointer>[
                            NeedlePointer(
                              value: bmi ?? 10.0,
                              enableAnimation: true,
                              animationDuration: 1200,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      bmi!.toStringAsFixed(1),
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor,
                      ),
                    ),
                   TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, "/bmichart");
                    },
                    child: const Text(
                      "BMI CHART",
                      style: TextStyle(
                        color: AppColors.secondaryColor,
                        fontWeight: FontWeight.bold,
                       backgroundColor: Colors.white,
                      ),
                    ),
                  ),
                 
                   
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

// 1. Purpose of the Page
// This page is designed to:

// Capture Anthropometric Data: Users can input their weight, height, age, and gender.
// Calculate BMI: Based on weight and height, the Body Mass Index (BMI) is computed.
// Display BMI Result: The BMI is shown both numerically and visually via a radial gauge.
// Navigate to BMI Chart: Users can view a BMI chart for reference.
// 2. Key Features
// a. Input Fields for User Data
// The page has three key input fields:

// Age (in years)
// Height (in cm)
// Weight (in kg)
// Features:

// TextFormField widgets are used for clean, user-friendly input.
// Each field is styled with rounded corners, shadows, and center-aligned text for a modern design.
// The buildInputField helper function simplifies field creation.

// b. Gender Selection
// The ChoiceChip widget is used for toggling between Male and Female.
// The selected gender is stored in the gender variable and updated with setState().

// Once the BMI is calculated, it is displayed:

// Numerically: The BMI value is shown with one decimal place.
// Visually: A radial gauge (from the syncfusion_flutter_gauges package) highlights the BMI range.
// Radial Gauge Implementation:

// The gauge has ranges to represent different BMI categories (e.g., Normal, Obese).
// The NeedlePointer dynamically points to the calculated BMI value.

// A TextButton allows users to navigate to a detailed BMI chart page.

// Workflow
// Input Data:
// User enters age, height, and weight.
// Gender is selected using chips.
// Calculate BMI:
// Pressing the "Calculate BMI" button computes the BMI.
// View Result:
// BMI value and category are displayed with a radial gauge.
// Explore BMI Chart:
// User can navigate to a BMI chart page for more details