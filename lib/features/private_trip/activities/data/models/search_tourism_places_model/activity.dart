class Activity {
	int? id;
	List<String>? images;
	String? name;
	String? description;
	String? openingHours;
	String? recommendedTime;
	dynamic type;
	int? cityId;

	Activity({
		this.id, 
		this.images, 
		this.name, 
		this.description, 
		this.openingHours, 
		this.recommendedTime, 
		this.type, 
		this.cityId, 
	});

	factory Activity.fromJson(Map<String, dynamic> json) => Activity(
				id: json['id'] as int?,
				images: json['images'] as List<String>?,
				name: json['name'] as String?,
				description: json['description'] as String?,
				openingHours: json['openingHours'] as String?,
				recommendedTime: json['recommendedTime'] as String?,
				type: json['type'] as dynamic,
				cityId: json['city_id'] as int?,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'images': images,
				'name': name,
				'description': description,
				'openingHours': openingHours,
				'recommendedTime': recommendedTime,
				'type': type,
				'city_id': cityId,
			};
}
