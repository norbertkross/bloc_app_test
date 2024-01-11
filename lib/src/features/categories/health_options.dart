import 'package:bloc_app_test/src/constants/constants.dart';
import 'package:bloc_app_test/src/features/widgets/clinic_item.dart';
import 'package:flutter/material.dart';

class HealthOptions extends StatefulWidget {
  const HealthOptions({super.key});

  @override
  State<HealthOptions> createState() => _HealthOptionsState();
}

class _HealthOptionsState extends State<HealthOptions> {
  List<Map> options = [
    {
    'color':AppConstants.GREYCYAN,
    'name':"Visits",
    'img': 'assets/visits.svg',
    },
    {
    'color':AppConstants.GREYBLUE,
    'name': "Medications",
    'img':'assets/medications.svg',
    },
    {
    'color':AppConstants.YELLOWGREY,
    'name':"Vacinations",
    'img':'assets/vacinations.svg',
    },
  ];


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int k = 0; k < options.length; k++) ...[
          ClinicItem(
          name: options[k]['name'],
          color: options[k]['color'],
          img: options[k]['img'],
          badge: k==0,
        )],
      ],
    );
  }
}
