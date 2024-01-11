class UpcomingActivitiesModel {
  String? actionName;
  String? actionDetails;
  String? imageLabel;
  int? upcoming;
  String? color;

  UpcomingActivitiesModel(
      {this.actionName,
      this.actionDetails,
      this.imageLabel,
      this.upcoming,
      this.color});

  UpcomingActivitiesModel.fromJson(Map<String, dynamic> json) {
    actionName = json['action_name'];
    actionDetails = json['action_details'];
    imageLabel = json['image_label'];
    upcoming = json['upcoming'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['action_name'] = this.actionName;
    data['action_details'] = this.actionDetails;
    data['image_label'] = this.imageLabel;
    data['upcoming'] = this.upcoming;
    data['color'] = this.color;
    return data;
  }
}
