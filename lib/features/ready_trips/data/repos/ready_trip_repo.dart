import 'package:dartz/dartz.dart';
import 'package:tourista/core/errors/failures.dart';
import 'package:tourista/features/ready_trips/data/models/add_favourite_model.dart';
import 'package:tourista/features/ready_trips/data/models/all_ready_trips_model/all_ready_trips_model.dart';
import 'package:tourista/features/ready_trips/data/models/ready_trips_details_model/ready_trips_details_model.dart';

abstract class ReadyTripsRepo {
  Future<Either<Failure, AllReadyTripsModel>> getAllReadyTrips(
      {int? classificationId});
  Future<Either<Failure, ReadyTripsDetailsModel>> getReadyTripDetails(
      {required int tripId});
  Future<Either<Failure, AddFavouriteModel>> addFavouriteTrip(
      {required int tripId});
}
