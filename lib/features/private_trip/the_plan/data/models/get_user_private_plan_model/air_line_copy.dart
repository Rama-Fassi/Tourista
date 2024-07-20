class AirLineCopy {
  int? id;
  String? name;
  String? image;

  AirLineCopy({this.id, this.name, this.image});

  factory AirLineCopy.fromJson(Map<String, dynamic> json) => AirLineCopy(
        id: json['id'] as int?,
        name: json['name'] as String?,
        image: json['image'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
      };
}
