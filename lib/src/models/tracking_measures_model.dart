class TrackingMeasuresModel {
  String? datePurchased;
  String? testResultsName;
  String? testResultsValue;
  bool? tracking;
  int? minValue;
  int? maxValue;
  int? currentValue;
  String? lastTestResults;

  TrackingMeasuresModel(
      {this.datePurchased,
      this.testResultsName,
      this.testResultsValue,
      this.tracking,
      this.minValue,
      this.maxValue,
      this.currentValue,
      this.lastTestResults});

  TrackingMeasuresModel.fromJson(Map<String, dynamic> json) {
    datePurchased = json['date_purchased'];
    testResultsName = json['test_results_name'];
    testResultsValue = json['test_results_value'];
    tracking = json['tracking'];
    minValue = json['min_value'];
    maxValue = json['max_value'];
    currentValue = json['current_value'];
    lastTestResults = json['last_test_results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date_purchased'] = this.datePurchased;
    data['test_results_name'] = this.testResultsName;
    data['test_results_value'] = this.testResultsValue;
    data['tracking'] = this.tracking;
    data['min_value'] = this.minValue;
    data['max_value'] = this.maxValue;
    data['current_value'] = this.currentValue;
    data['last_test_results'] = this.lastTestResults;
    return data;
  }
}
