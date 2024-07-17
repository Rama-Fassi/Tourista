part of 'trip_info_cubit.dart';

@immutable
class TripInfoState {
  final int? pointId;
  final int? price;
  final int? ticketNumber;
  final String? pointName;
  final bool? vipTicket;

  const TripInfoState({
    required this.vipTicket,
    required this.ticketNumber,
    required this.pointId,
    required this.price,
    required this.pointName,
  });
  TripInfoState copyWith(
      {int? pointId,
      String? pointName,
      int? price,
      int? ticketNumber,
      bool? vipTicket}) {
    return TripInfoState(
        price: price ?? this.price,
        vipTicket: vipTicket ?? this.vipTicket,
        ticketNumber: ticketNumber ?? this.ticketNumber,
        pointId: pointId ?? this.pointId,
        pointName: pointName ?? this.pointName);
  }
}
