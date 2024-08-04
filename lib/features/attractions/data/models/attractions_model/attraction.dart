class Attraction {
	int? id;
	String? image;
	int? publicTripId;
	String? description;
	int? display;
	String? type;
	int? discountPoints;
	int? discount;

	Attraction({
		this.id, 
		this.image, 
		this.publicTripId, 
		this.description, 
		this.display, 
		this.type, 
		this.discountPoints, 
		this.discount, 
	});

	factory Attraction.fromJson(Map<String, dynamic> json) => Attraction(
				id: json['id'] as int?,
				image: json['image'] as String?,
				publicTripId: json['publicTrip_id'] as int?,
				description: json['description'] as String?,
				display: json['display'] as int?,
				type: json['type'] as String?,
				discountPoints: json['discount_points'] as int?,
				discount: json['discount'] as int?,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'image': image,
				'publicTrip_id': publicTripId,
				'description': description,
				'display': display,
				'type': type,
				'discount_points': discountPoints,
				'discount': discount,
			};
}
