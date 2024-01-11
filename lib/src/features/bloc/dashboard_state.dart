part of 'dashboard_bloc.dart';

class DashboardState {
  bool? loading;
  bool? loadingError = false;
  List<UpcomingActivitiesModel>? upcomingActivities;
  List<TrackingMeasuresModel>? trackingMeasures;
  List<ActiviteMedicationsModel>? activeMedications;

  DashboardState(
      {this.loading,
      this.activeMedications,
      this.trackingMeasures,
      this.upcomingActivities,this.loadingError});

  DashboardState copyWith({bool? loading,List<UpcomingActivitiesModel>? upcomingActivities,List<ActiviteMedicationsModel>? activeMedications, List<TrackingMeasuresModel>? trackingMeasures, bool? loadingError}) {
    return DashboardState(
        loading: loading ?? this.loading,
        upcomingActivities: upcomingActivities ?? this.upcomingActivities,
        activeMedications: activeMedications ?? this.activeMedications,
        trackingMeasures: trackingMeasures ?? this.trackingMeasures,
        loadingError: loadingError ?? this.loadingError
        );
  }
}
