import 'package:bloc_app_test/src/models/active_medications_model.dart';
import 'package:bloc_app_test/src/models/tracking_measures_model.dart';
import 'package:bloc_app_test/src/models/upcoming_activities_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardState()) {
    on<ShowDashboardloaderEvent>((event, emit) {
      emit(state.copyWith(loading: true));
    });

    on<HideDashboardloaderEvent>(
        (HideDashboardloaderEvent event, Emitter<DashboardState> emit) {
      emit(state.copyWith(loading: false));
    });

    on<SetDashboardLoaded>(
        (SetDashboardLoaded event, Emitter<DashboardState> emit) async {
      await fetchData(event, emit);
    });
  }

  Dio _dio = Dio();
  var _responseData;

  fetchData(event, Emitter<DashboardState> emit) async {
    try {
      debugPrint("Request Start");
      Response response =
          await _dio.get('https://jsonplaceholder.typicode.com/posts/');

      if (response.statusCode == 200) {
        _responseData = response.data;

        debugPrint(_responseData.toString());

        List<UpcomingActivitiesModel>? upcomingActivities = [
          UpcomingActivitiesModel(
            actionName: "Future Visitis",
            color: "#22D3EE",
            imageLabel: "assets/visits.svg",
            upcoming: 1,
            actionDetails:
                "Some more details description goes here and there and there and there",
          ),
          UpcomingActivitiesModel(
            actionName: "Future Lab Tests",
            color: "#FB7185",
            imageLabel: "assets/lab_test.svg",
            upcoming: 2,
            actionDetails:
                "Some more details description goes here and there and there and there",
          ),
          UpcomingActivitiesModel(
            actionName: "Future Vacinations",
            color: "#FACC15",
            imageLabel: "assets/vacinations.svg",
            upcoming: 1,
            actionDetails:
                "Some more details description goes here and there and there and there",
          ),
          UpcomingActivitiesModel(
            actionName: "Surgeries",
            color: "#F472B6",
            imageLabel: "assets/hospital.svg",
            upcoming: 1,
            actionDetails:
                "Some more details description goes here and there and there and there",
          ),
        ];

        List<TrackingMeasuresModel>? trackingMeasures = [];
        List<ActiviteMedicationsModel>? activeMedications = [];

        for (int i = 0; i < 5; i++) {
          trackingMeasures.add(TrackingMeasuresModel.fromJson({
            "date_purchased": "Feb 15. 2023",
            "test_results_name": "B12",
            "test_results_value": "170 pg/ml",
            "tracking": true,
            "min_value": 200,
            "max_value": 1100,
            "current_value": 300,
            "last_test_results": "154 pg/ml (90 days ago)"
          }));

          activeMedications.add(ActiviteMedicationsModel.fromJson({
            'medication_name': "ENTRESTO, 100 mg",
            'medication_prespription': "",
            'image_label': "",
            'dosage': "2/day",
            'morning': true,
            'afternoon': false,
            'evening': true,
          }));
        }

        emit(state.copyWith(
            loading: false,
            upcomingActivities: upcomingActivities,
            activeMedications: activeMedications,
            trackingMeasures: trackingMeasures));
       
      } else {
        emit(state.copyWith(
          loading: false,
          loadingError: true,
        ));
      }
    } catch (e) {
      debugPrint('Error: $e');
        emit(state.copyWith(
          loading: false,
          loadingError: true,
        ));
    }
  }
}
