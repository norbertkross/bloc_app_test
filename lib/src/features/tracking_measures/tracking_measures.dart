import 'package:bloc_app_test/src/features/widgets/tracking_measures_carousel.dart';
import 'package:flutter/material.dart';

class TrackingMeasuresSection extends StatefulWidget {
  const TrackingMeasuresSection({super.key});

  @override
  State<TrackingMeasuresSection> createState() =>
      _TrackingMeasuresSectionState();
}

class _TrackingMeasuresSectionState extends State<TrackingMeasuresSection> {
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: MediaQuery.of(context).size.width,
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

             children: [
               const Text(
                "Tracking Measures",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),

          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
                 Text(
                "See All",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15,color: Theme.of(context).disabledColor),
          ),

        Icon(Icons.chevron_right_rounded,color: Theme.of(context).disabledColor,), 
            ],
          ),
             ],
           ),
           TrackingMeasuresCarousel(),  
               
        ],
      ),
    );
  }
}
