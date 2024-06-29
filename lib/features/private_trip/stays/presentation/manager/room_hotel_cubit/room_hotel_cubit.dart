import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tourista/features/private_trip/stays/data/models/room_hotel_model/room_hotel_model.dart';
import 'package:tourista/features/private_trip/stays/data/repos/stays_repo_impl.dart';

part 'room_hotel_state.dart';

class RoomHotelCubit extends Cubit<RoomHotelState> {
  RoomHotelCubit(this.staysRepoImpl) : super(RoomHotelInitial());
  StaysRepoImpl staysRepoImpl;
  Future<void> fetchRoomHotelsCubitFun({required int hotelId}) async {
    emit(RoomHotelLoading());
    var result = await staysRepoImpl.fetchRoomHotels(hotelId: hotelId);

    result.fold((failure) {
      emit(RoomHotelFailure(errMessage: failure.errMessage));
    }, (roomHotelModel) {
      emit(RoomHotelSuccess(roomHotelModel: roomHotelModel));
    });
  }
}
