import 'package:flutter/material.dart';
import 'package:project_app/theme/app_colors.dart';

class LunchItemsPage extends StatelessWidget {
  const LunchItemsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lunch Items"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(color: AppColors.primaryColor),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                MealCard(
                  image: "assets/images/grilled_chicken.png",
                  title: "Grilled Chicken Salad",
                  description: "A healthy and protein-packed lunch option.",
                  time: "15-20 Min",
                  level: "Medium Level",
                  calories: "650 Cal",
                  carbs: "45%",
                  protein: "50%",
                  fat: "5%",
                ),
                const SizedBox(height: 20),
                MealCard(
                  image: "assets/images/pasta.png",
                  title: "Creamy Alfredo Pasta",
                  description: "A delicious and creamy pasta for a fulfilling lunch.",
                  time: "20-25 Min",
                  level: "Medium Level",
                  calories: "800 Cal",
                  carbs: "60%",
                  protein: "30%",
                  fat: "10%",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MealCard extends StatelessWidget {
  final String image, title, description, time, level, calories, carbs, protein, fat;

  const MealCard({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.time,
    required this.level,
    required this.calories,
    required this.carbs,
    required this.protein,
    required this.fat,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset(image, height: 120)),
            const SizedBox(height: 10),
            Text(title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            Text(description, style: const TextStyle(fontSize: 16, color: Colors.grey)),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InfoCard(label: time, icon: Icons.access_time, color: Colors.blue),
                InfoCard(label: level, icon: Icons.bar_chart, color: Colors.green),
                InfoCard(label: calories, icon: Icons.local_fire_department, color: Colors.orange),
              ],
            ),
            const SizedBox(height: 10),
            const Text("Per Serving", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                NutrientCard(label: "CARBS", value: carbs, color: Colors.blue),
                NutrientCard(label: "Protein", value: protein, color: Colors.orange),
                NutrientCard(label: "Fat", value: fat, color: Colors.purple),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;

  const InfoCard({super.key, required this.label, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: color, size: 30),
        const SizedBox(height: 5),
        Text(label, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: color)),
      ],
    );
  }
}

class NutrientCard extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const NutrientCard({super.key, required this.label, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: color)),
        const SizedBox(height: 5),
        Text(value, style: TextStyle(fontSize: 14, color: Colors.grey)),
      ],
    );
  }
}
