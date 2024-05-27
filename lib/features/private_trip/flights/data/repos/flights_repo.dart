import 'package:dartz/dartz.dart';
import 'package:tourista/core/errors/failures.dart';
import 'package:tourista/features/private_trip/flights/data/models/airport_where_from_model/airport_where_model.dart';

abstract class FlightsRepo {
  Future<Either<Failure, AirportWhereModel>> getAirportFrom(
      {required int cityId});
  Future<Either<Failure, AirportWhereModel>> getAirportTo(
      {required int cityId});
}
