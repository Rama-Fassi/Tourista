import 'package:dartz/dartz.dart';
import 'package:tourista/core/errors/failures.dart';
import 'package:tourista/features/private_trip/stays/data/models/hotels_model/hotels_model.dart';

abstract class StaysRepo {
  Future<Either<Failure, HotelsModel>> fetchHotels({required int tripId});
}
