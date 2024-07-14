import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tourista/features/my_trips/data/models/favorit_trips_model/favorit_trips_model.dart';
import 'package:tourista/features/my_trips/data/repos/my_trips_repo_impl.dart';

part 'favorit_trips_state.dart';

class FavoritTripsCubit extends Cubit<FavoritTripsState> {
  FavoritTripsCubit(this.myTripsRepoImpl) : super(FavoritTripsInitial());
  MyTripsRepoImpl myTripsRepoImpl;

  Future<void> getFavoritTripsFun() async {
    emit(FavoritTripsLoading());
    var result = await myTripsRepoImpl.getFavoritTrips();

    result.fold((failure) {
      emit(FavoritTripsFailure(errMessage: failure.errMessage));
    }, (favoritTripsModel) {
      emit(FavoritTripsSuccess(favoritTripsModel: favoritTripsModel));
    });
  }
}
