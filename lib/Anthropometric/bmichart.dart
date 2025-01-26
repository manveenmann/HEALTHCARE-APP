import 'package:flutter/material.dart';
import 'package:project_app/theme/app_colors.dart';

void main() {
  runApp(const MaterialApp(home: BMIChart()));
}

class BMIChart extends StatelessWidget {
  const BMIChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "BODY MASS INDEX CHART",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color:AppColors.backgroundColor,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                silhouetteWidget(Colors.blue, "Underweight"),
                silhouetteWidget(Colors.green, "Normal weight"),
                silhouetteWidget(Colors.yellow, "Overweight"),
                silhouetteWidget(Colors.orange, "Obesity"),
                silhouetteWidget(Colors.red, "Extreme Obesity"),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              "BMI Categories and Ranges:",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400, width: 1.0),
                borderRadius: BorderRadius.circular(8.0),
                color: const Color.fromARGB(255, 255, 253, 253),
              ),
              child: Table(
                border: TableBorder.all(color: const Color.fromARGB(255, 255, 255, 255)),
                columnWidths: const {
                  0: FlexColumnWidth(1),
                  1: FlexColumnWidth(3),
                },
                children: [
                  tableRow(["BMI Range", "Category"], isHeader: true),
                  tableRow(["< 18.5", "Underweight"]),
                  tableRow(["18.5 - 24.9", "Normal weight"]),
                  tableRow(["25 - 29.9", "Overweight"]),
                  tableRow(["30 - 39.9", "Obesity"]),
                  tableRow(["> 40", "Extreme Obesity"]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget silhouetteWidget(Color color, String label) {
    return Column(
      children: [
        Icon(Icons.person, size: 80, color: color),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: color,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  TableRow tableRow(List<String> cells, {bool isHeader = false}) {
    return TableRow(
      children: cells.map((cell) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            cell,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
              color: isHeader ? Colors.black : Colors.grey.shade800,
            ),
            textAlign: TextAlign.center,
          ),
        );
      }).toList(),
    );
  }
}
// 1. The Header
// At the top of the app, there’s a title:
// “Body Mass Index (BMI) Chart”

// This is like the heading on a poster. It’s displayed in bold and centered, making it the first thing you see. The background of this title bar is teal (a shade of blue-green) to make it visually appealing.

// 2. Silhouettes (Icons of People)
// Under the title, there are five colorful figures (silhouettes of people) arranged in a row:

// Blue = Underweight
// Green = Normal Weight
// Yellow = Overweight
// Orange = Obesity
// Red = Extreme Obesity
// Each color matches a BMI category, and below every figure, there’s a label (e.g., “Normal Weight”) written in bold text to explain what it represents. This helps visually differentiate the categories.

// 3. The Table
// Below the silhouettes, there’s a neat table that organizes the BMI categories and their ranges.

// For example:

// BMI Range: <18.5 — Category: Underweight
// BMI Range: 18.5–24.9 — Category: Normal Weight
// BMI Range: 25–29.9 — Category: Overweight
// The table has clean borders, rounded edges, and a light background to make it look professional and easy to read.

// 4. Spacing and Design
// Each section of the app has enough space between the text, icons, and the table to avoid clutter.
// Bold text and soft colors make it visually appealing while also being simple to understand.
// 5. Purpose of the App
// This digital BMI chart makes it easy for anyone to quickly understand their BMI category by simply looking at the chart and matching it to their own BMI score. It’s designed to be clear, simple, and visually organized for everyone, not just for people with a technical background.