import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failures.dart';
import '../models/tourism_activities/tourism_activities_model.dart';

abstract class ActivitiesRepo {
  Future<Either<Failure, TourismActivitiesModel>> getTourismPlaces({
    required String tourismTybe,
    required int tripId,
  });
}
