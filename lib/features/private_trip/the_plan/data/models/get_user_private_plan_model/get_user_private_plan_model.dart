import 'get_tourism_places/get_tourism_places.dart';
import 'hotel.dart';
import 'ticket.dart';

class GetUserPrivatePlanModel {
  GetTicket? ticket;
  List<Hotel>? hotels;
  int? totalRoomPrice;
  List<GetTourismPlaces>? tourismPlaces;
  double? finalPrice;

  GetUserPrivatePlanModel({
    this.ticket,
    this.hotels,
    this.totalRoomPrice,
    this.tourismPlaces,
    this.finalPrice,
  });

  factory GetUserPrivatePlanModel.fromJson(Map<String, dynamic> json) {
    return GetUserPrivatePlanModel(
      ticket: json['Ticket'] == null
          ? null
          : GetTicket.fromJson(json['Ticket'] as Map<String, dynamic>),
      hotels: (json['Hotels'] as List<dynamic>?)
          ?.map((e) => Hotel.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalRoomPrice: json['TotalRoomPrice'] as int?,
      tourismPlaces: (json['TourismPlaces'] as List<dynamic>?)
          ?.map((e) => GetTourismPlaces.fromJson(e as Map<dynamic, dynamic>))
          .toList(),
      finalPrice: (json['FinalPrice'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
        'Ticket': ticket?.toJson(),
        'Hotels': hotels?.map((e) => e.toJson()).toList(),
        'TotalRoomPrice': totalRoomPrice,
        'TourismPlaces': tourismPlaces?.map((e) => e.toJson()).toList(),
        'FinalPrice': finalPrice,
      };
}
