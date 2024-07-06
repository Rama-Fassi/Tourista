import 'public_trip.dart';

class ReadyTripsDetailsModel {
	List<PublicTrip>? publicTrip;

	ReadyTripsDetailsModel({this.publicTrip});

	factory ReadyTripsDetailsModel.fromJson(Map<String, dynamic> json) {
		return ReadyTripsDetailsModel(
			publicTrip: (json['publicTrip'] as List<dynamic>?)
						?.map((e) => PublicTrip.fromJson(e as Map<String, dynamic>))
						.toList(),
		);
	}



	Map<String, dynamic> toJson() => {
				'publicTrip': publicTrip?.map((e) => e.toJson()).toList(),
			};
}
