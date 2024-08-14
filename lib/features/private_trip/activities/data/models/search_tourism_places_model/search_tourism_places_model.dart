import 'activity.dart';

class SearchTourismPlacesModel {
	List<Activity>? activities;

	SearchTourismPlacesModel({this.activities});

	factory SearchTourismPlacesModel.fromJson(Map<String, dynamic> json) {
		return SearchTourismPlacesModel(
			activities: (json['activities'] as List<dynamic>?)
						?.map((e) => Activity.fromJson(e as Map<String, dynamic>))
						.toList(),
		);
	}



	Map<String, dynamic> toJson() => {
				'activities': activities?.map((e) => e.toJson()).toList(),
			};
}
