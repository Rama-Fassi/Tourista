import 'hotel copy.dart';
import 'review.dart';

class Hotel {
	int? id;
	int? cityId;
	int? hotelId;
	List<String>? images;
	String? description;
	List<String>? features;
	int? avarageOfPrice;
	Review? review;
	HotelCopy? hotel;

	Hotel({
		this.id, 
		this.cityId, 
		this.hotelId, 
		this.images, 
		this.description, 
		this.features, 
		this.avarageOfPrice, 
		this.review, 
		this.hotel, 
	});

	factory Hotel.fromJson(Map<String, dynamic> json) => Hotel(
				id: json['id'] as int?,
				cityId: json['city_id'] as int?,
				hotelId: json['hotel_id'] as int?,
				images: json['images'] as List<String>?,
				description: json['description'] as String?,
				features: json['features'] as List<String>?,
				avarageOfPrice: json['avarageOfPrice'] as int?,
				review: json['review'] == null
						? null
						: Review.fromJson(json['review'] as Map<String, dynamic>),
				hotel: json['hotel'] == null
						? null
						: HotelCopy.fromJson(json['hotel'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'city_id': cityId,
				'hotel_id': hotelId,
				'images': images,
				'description': description,
				'features': features,
				'avarageOfPrice': avarageOfPrice,
				'review': review?.toJson(),
				'hotel': hotel?.toJson(),
			};
}
