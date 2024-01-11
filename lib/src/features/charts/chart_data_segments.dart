import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/dashboard_bloc.dart';
import '../widgets/expandable_card.dart';

class ChartDataSegment extends StatefulWidget {
  const ChartDataSegment({super.key});

  @override
  State<ChartDataSegment> createState() => _ChartDataSegmentState();
}

class _ChartDataSegmentState extends State<ChartDataSegment> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
      return Column(
        children: [
          for (int k = 0; k < (state.upcomingActivities?.length ?? 0); k++) ...[
            ExpandableCard(
              img: state.upcomingActivities?[k].imageLabel,
              name: state.upcomingActivities?[k].actionName,
              upcomingame: state.upcomingActivities?[k].upcoming,
              color: state.upcomingActivities?[k].color,
              details: state.upcomingActivities?[k].actionDetails,
            )
          ],
        ],
      );
    });
  }
}
