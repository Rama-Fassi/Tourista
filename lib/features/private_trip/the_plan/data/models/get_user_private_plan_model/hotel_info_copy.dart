class HotelInfoCopy {
	int? id;
	String? name;
	int? rate;

	HotelInfoCopy({this.id, this.name, this.rate});

	factory HotelInfoCopy.fromJson(Map<String, dynamic> json) => HotelInfoCopy(
				id: json['id'] as int?,
				name: json['name'] as String?,
				rate: json['rate'] as int?,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'name': name,
				'rate': rate,
			};
}
