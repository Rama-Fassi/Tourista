import 'attraction.dart';

class AttractionsModel {
	List<Attraction>? attractions;

	AttractionsModel({this.attractions});

	factory AttractionsModel.fromJson(Map<String, dynamic> json) {
		return AttractionsModel(
			attractions: (json['attractions'] as List<dynamic>?)
						?.map((e) => Attraction.fromJson(e as Map<String, dynamic>))
						.toList(),
		);
	}



	Map<String, dynamic> toJson() => {
				'attractions': attractions?.map((e) => e.toJson()).toList(),
			};
}
