import 'trip_day_place.dart';

class TourismPlace {
	int? id;
	int? tripId;
	String? date;
	List<TripDayPlace>? tripDayPlace;

	TourismPlace({this.id, this.tripId, this.date, this.tripDayPlace});

	factory TourismPlace.fromJson(Map<String, dynamic> json) => TourismPlace(
				id: json['id'] as int?,
				tripId: json['trip_id'] as int?,
				date: json['date'] as String?,
				tripDayPlace: (json['trip_day_place'] as List<dynamic>?)
						?.map((e) => TripDayPlace.fromJson(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'trip_id': tripId,
				'date': date,
				'trip_day_place': tripDayPlace?.map((e) => e.toJson()).toList(),
			};
}
