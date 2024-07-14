class DeleteFromPlanModel {
  String? message;

  DeleteFromPlanModel({this.message});

  factory DeleteFromPlanModel.fromJson(Map<String, dynamic> json) =>
      DeleteFromPlanModel(
        message: json['message'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'message': message,
      };
}
