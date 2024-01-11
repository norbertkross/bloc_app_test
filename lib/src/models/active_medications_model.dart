class ActiviteMedicationsModel {
  String? medicationName;
  String? medicationPrespription;
  String? imageLabel;
  String? dosage;
  bool? morning;
  bool? afternoon;
  bool? evening;

  ActiviteMedicationsModel(
      {this.medicationName,
      this.medicationPrespription,
      this.imageLabel,
      this.dosage,
      this.morning,
      this.afternoon,
      this.evening});

  ActiviteMedicationsModel.fromJson(Map<String, dynamic> json) {
    medicationName = json['medication_name'];
    medicationPrespription = json['medication_prespription'];
    imageLabel = json['image_label'];
    dosage = json['dosage'];
    morning = json['morning'];
    afternoon = json['afternoon'];
    evening = json['evening'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['medication_name'] = this.medicationName;
    data['medication_prespription'] = this.medicationPrespription;
    data['image_label'] = this.imageLabel;
    data['dosage'] = this.dosage;
    data['morning'] = this.morning;
    data['afternoon'] = this.afternoon;
    data['evening'] = this.evening;
    return data;
  }
}
