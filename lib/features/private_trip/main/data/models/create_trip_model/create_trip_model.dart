import 'trip_id.dart';

class CreateTripModel {
	String? message;
	List<TripId>? tripId;

	CreateTripModel({this.message, this.tripId});

	factory CreateTripModel.fromJson(Map<String, dynamic> json) {
		return CreateTripModel(
			message: json['message'] as String?,
			tripId: (json['trip_id'] as List<dynamic>?)
						?.map((e) => TripId.fromJson(e as Map<String, dynamic>))
						.toList(),
		);
	}



	Map<String, dynamic> toJson() => {
				'message': message,
				'trip_id': tripId?.map((e) => e.toJson()).toList(),
			};
}
