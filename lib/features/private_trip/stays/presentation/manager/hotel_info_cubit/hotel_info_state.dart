part of 'hotel_info_cubit.dart';

@immutable
class HotelInfoState {
  final DateTime? checkIn;
  final DateTime? checkOut;
  final Map<String, List<dynamic>>? rooms;

  const HotelInfoState(
      {required this.checkIn, required this.checkOut, required this.rooms});
  HotelInfoState copyWith(
      {DateTime? checkIn,
      DateTime? checkOut,
      Map<String, List<dynamic>>? rooms}) {
    return HotelInfoState(
      checkIn: checkIn ?? this.checkIn,
      checkOut: checkOut ?? this.checkOut,
      rooms: rooms ?? this.rooms,
    );
  }
}
