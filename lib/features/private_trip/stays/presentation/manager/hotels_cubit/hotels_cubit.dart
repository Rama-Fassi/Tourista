import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tourista/features/private_trip/stays/data/models/hotels_model/hotels_model.dart';
import 'package:tourista/features/private_trip/stays/data/repos/stays_repo_impl.dart';

part 'hotels_state.dart';

class HotelsCubit extends Cubit<HotelsState> {
  HotelsCubit(this.staysRepoImpl) : super(HotelsInitial());
  StaysRepoImpl staysRepoImpl;
  Future<void> fetchHotelsCubitFun({required int tripId}) async {
    emit(HotelsLoading());
    var result = await staysRepoImpl.fetchHotels(tripId: tripId);

    result.fold((failure) {
      print(failure.errMessage);
      emit(HotelsFailure(errMessage: failure.errMessage));
    }, (hotelsModel) {
      emit(HotelsSuccess(hotelsModel: hotelsModel));
    });
  }
}
