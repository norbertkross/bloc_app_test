import 'package:bloc_app_test/src/features/active_medications/active_medications_page.dart';
import 'package:bloc_app_test/src/features/categories/health_options.dart';
import 'package:bloc_app_test/src/features/charts/charts_page.dart';
import 'package:bloc_app_test/src/features/tracking_measures/tracking_measures.dart';
import 'package:bloc_app_test/src/features/user/user_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../bloc/dashboard_bloc.dart';

class AppHome extends StatefulWidget {
  const AppHome({super.key});

  @override
  State<AppHome> createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  late DashboardBloc _dashboardBloc;
  @override
  void initState() {
    super.initState();
    // Initialize Bloc
    _dashboardBloc = DashboardBloc();

    // Calling event to simulate loading data
    _dashboardBloc.add(ShowDashboardloaderEvent());
    _dashboardBloc.add(SetDashboardLoaded());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: BlocProvider(
                    create: (context) => _dashboardBloc,
                    child: BlocBuilder<DashboardBloc, DashboardState>(
                      builder: (context, state) {
                        return Column(
                          children: [
                           const UserRowWidget(),
                           const SizedBox(
                              height: 12.0,
                            ),
                          const HealthOptions(),
                           const SizedBox(
                              height: 30.0,
                            ),
                           state.loading == true?
                         SizedBox(
                          height: 130,
                          width: MediaQuery.of(context).size.width,
                          child:  Center(child: CupertinoActivityIndicator(color: Theme.of(context).primaryColor,)))
                          : state.loadingError == true? const Center(
                            child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 40),
                              child: Text("Couldn't load Charts data this time",style: TextStyle(
                                color: Colors.red,
                              ),),
                            ),
                          ) : const ChartsPage() ,
                           const SizedBox(
                              height: 30.0,
                            ),

                           state.loading == true?
                         SizedBox(
                            height: 130,
                          width: MediaQuery.of(context).size.width,
                          child: Center(child: CupertinoActivityIndicator(color: Theme.of(context).primaryColor)))
                          :  state.loadingError == true?   const Center(
                            child: Padding(
                             padding: EdgeInsets.symmetric(vertical: 40),
                              child: Text("Couldn't load Active Medications this time",style: TextStyle(
                                color: Colors.red,
                              ),),
                            ),
                          ): const ActiveMedicationSection() ,
                           const SizedBox(
                              height: 30.0,
                            ),
                           state.loading == true?
                         SizedBox(
                            height: 130,
                          width: MediaQuery.of(context).size.width,
                          child: Center(child:  CupertinoActivityIndicator(color: Theme.of(context).primaryColor)))
                          : state.loadingError == true? const Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 40),
                              child: Text("Couldn't Tracking Measures this time",style: TextStyle(
                                color: Colors.red,
                              ),),
                            ),
                          ):  const TrackingMeasuresSection() ,
                           const SizedBox(
                              height: 100.0,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Card(
              elevation: 4.0,
              shadowColor: Colors.black.withOpacity(.6),
              margin: const EdgeInsets.all(0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 65,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 27),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60.0),
                    ),
                    color: Theme.of(context).primaryColor,
                    child: SizedBox(
                      width: 60,
                      height: 60,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SvgPicture.asset("assets/grid.svg"),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
