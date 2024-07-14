import 'package:dartz/dartz.dart';
import 'package:tourista/core/errors/failures.dart';
import 'package:tourista/features/my_trips/data/models/favorit_trips_model/favorit_trips_model.dart';

abstract class MyTripsRepo {
  Future<Either<Failure, FavoritTripsModel>> getFavoritTrips();
}
