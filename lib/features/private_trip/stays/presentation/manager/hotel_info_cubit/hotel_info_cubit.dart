import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'hotel_info_state.dart';

class HotelInfoCubit extends Cubit<HotelInfoState> {
  HotelInfoCubit()
      : super(const HotelInfoState(checkIn: null, checkOut: null, rooms: null));
  void setCheckIn(DateTime? date) {
    emit(state.copyWith(checkIn: date));
  }

  void setCheckOut(DateTime? date) {
    emit(state.copyWith(checkOut: date));
  }

  void setRooms(Map<String, List<dynamic>>? rooms) {
    emit(state.copyWith(rooms: rooms));
  }
}
