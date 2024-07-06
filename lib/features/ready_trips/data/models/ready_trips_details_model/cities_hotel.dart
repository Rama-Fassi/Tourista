class CitiesHotel {
	int? id;
	int? cityId;
	int? hotelId;
	dynamic images;
	String? description;
	String? features;
	int? avarageOfPrice;
	String? review;

	CitiesHotel({
		this.id, 
		this.cityId, 
		this.hotelId, 
		this.images, 
		this.description, 
		this.features, 
		this.avarageOfPrice, 
		this.review, 
	});

	factory CitiesHotel.fromJson(Map<String, dynamic> json) => CitiesHotel(
				id: json['id'] as int?,
				cityId: json['city_id'] as int?,
				hotelId: json['hotel_id'] as int?,
				images: json['images'] as dynamic,
				description: json['description'] as String?,
				features: json['features'] as String?,
				avarageOfPrice: json['avarageOfPrice'] as int?,
				review: json['review'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'city_id': cityId,
				'hotel_id': hotelId,
				'images': images,
				'description': description,
				'features': features,
				'avarageOfPrice': avarageOfPrice,
				'review': review,
			};
}
