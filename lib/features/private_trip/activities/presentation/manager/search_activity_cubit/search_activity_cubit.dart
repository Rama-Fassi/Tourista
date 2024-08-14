import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tourista/features/private_trip/activities/data/models/search_tourism_places_model/search_tourism_places_model.dart';
import '../../../data/repos/activities_repo.dart';
part 'search_activity_state.dart';

class SearchActivityCubit extends Cubit<SearchActivityState> {
  SearchActivityCubit(this.activitiesRepo) : super(SearchActivityInitial());

  final ActivitiesRepo activitiesRepo;

  Future<void> searchActivity({
    required String search,
    String? type,
    required int tripId,
  }) async {
    emit(SearchActivityLoading());
    var result = await activitiesRepo.searchTourismPlaces(
        tripId: tripId, search: search, type: type);
    result.fold((failure) {
      emit(SearchActivityFailure(failure.errMessage));
    }, (getTripDaysModel) {
      emit(SearchActivitySuccess(getTripDaysModel));
    });
  }
}
