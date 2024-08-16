class Review {
  dynamic? cleanliness;
  dynamic? comfort;
  dynamic? facilities;

  Review({this.cleanliness, this.comfort, this.facilities});

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        cleanliness: (json['cleanliness'] as String?),
        comfort: (json['comfort'] as String?),
        facilities: json['Facilities'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'cleanliness': cleanliness,
        'comfort': comfort,
        'Facilities': facilities,
      };
}
