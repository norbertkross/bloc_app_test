import 'package:flutter/material.dart';

import '../widgets/medications_carousel.dart';

class ActiveMedicationSection extends StatefulWidget {
  const ActiveMedicationSection({super.key});

  @override
  State<ActiveMedicationSection> createState() =>
      _ActiveMedicationSectionState();
}

class _ActiveMedicationSectionState extends State<ActiveMedicationSection> {
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Active Medications",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          MedicationsCarousel()
        ],
      ),
    );
  }
}
