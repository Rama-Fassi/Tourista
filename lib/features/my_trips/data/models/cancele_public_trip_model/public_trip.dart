class PublicTrip {
	int? id;
	int? userId;
	int? tripPointId;
	int? numberOfTickets;
	String? state;
	int? price;
	DateTime? createdAt;
	DateTime? updatedAt;

	PublicTrip({
		this.id, 
		this.userId, 
		this.tripPointId, 
		this.numberOfTickets, 
		this.state, 
		this.price, 
		this.createdAt, 
		this.updatedAt, 
	});

	factory PublicTrip.fromJson(Map<String, dynamic> json) => PublicTrip(
				id: json['id'] as int?,
				userId: json['user_id'] as int?,
				tripPointId: json['tripPoint_id'] as int?,
				numberOfTickets: json['numberOfTickets'] as int?,
				state: json['state'] as String?,
				price: json['price'] as int?,
				createdAt: json['created_at'] == null
						? null
						: DateTime.parse(json['created_at'] as String),
				updatedAt: json['updated_at'] == null
						? null
						: DateTime.parse(json['updated_at'] as String),
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'user_id': userId,
				'tripPoint_id': tripPointId,
				'numberOfTickets': numberOfTickets,
				'state': state,
				'price': price,
				'created_at': createdAt?.toIso8601String(),
				'updated_at': updatedAt?.toIso8601String(),
			};
}
