part of 'dashboard_bloc.dart';

// Base Event class
class DashboardEvent {}

// events for dashboard

class ShowDashboardloaderEvent extends DashboardEvent {}

class HideDashboardloaderEvent extends DashboardEvent {}

class SetDashboardLoaded extends DashboardEvent {
 final List<UpcomingActivitiesModel>? upcomingActivities;
 final List<TrackingMeasuresModel>? trackingMeasures;
 final List<ActiviteMedicationsModel>? activeMedications;

  SetDashboardLoaded({ this.upcomingActivities, this.activeMedications, this.trackingMeasures });
}
