import 'package:bloc_app_test/src/features/charts/chart_data_segments.dart';
import 'package:bloc_app_test/src/utils/utils.dart';
import 'package:circular_chart_flutter/circular_chart_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/dashboard_bloc.dart';

class ChartsPage extends StatefulWidget {
  const ChartsPage({super.key});

  @override
  State<ChartsPage> createState() => _ChartsPageState();
}

class _ChartsPageState extends State<ChartsPage> {
  final GlobalKey<AnimatedCircularChartState> _chartKey =
      GlobalKey<AnimatedCircularChartState>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        return Column(
          children: [
            SizedBox(
              width: 250,
              height: 250,
              child: Stack(
                children: [
                  AnimatedCircularChart(
                    key: _chartKey,
                    size: const Size(250.0, 250.0),
                    initialChartData:
                     
                     <CircularStackEntry>[
                      CircularStackEntry(
                        <CircularSegmentEntry>
                        
                       [...?state.upcomingActivities?.map((element) => CircularSegmentEntry(
                          double.tryParse("${element.upcoming}") ?? 0.0,
                            Utilities.colorFromHex(element.color ?? ''),
                            rankKey: element.color,
                        )).toList()
                       ],
                        rankKey: 'progress',
                      ),
                    ],
                    chartType: CircularChartType.Radial,
                    // percentageValues: true,
                    // holeLabel: 'Upcoming \n5 Activities',
                    labelStyle: TextStyle(
                      color: Colors.blueGrey[600],
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                     Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: 200,
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  const Text(
                    "Upcoming",
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 14),
                  ),
                    const SizedBox(height: 8,),                      
              Text(
              "${state.upcomingActivities?.map((e) => e.upcoming).toList().reduce((a, b) => (a ?? 0) + (b?? 0))?? 0} Activities",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                  ],
                ),
              ),
            ),
                ],
              ),
            ),
           const ChartDataSegment()
          ],
        );
      },
    );
  }
}
