import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tourista/core/errors/failures.dart';
import 'package:tourista/core/utlis/api_server.dart';
import 'package:tourista/features/private_trip/flights/data/models/airport_where_from_model/airport_where_model.dart';
import 'package:tourista/features/private_trip/flights/data/repos/flights_repo.dart';

class FlightsRepoImpl implements FlightsRepo {
  final ApiServer apiServer;

  FlightsRepoImpl(this.apiServer);
  @override
  Future<Either<Failure, AirportWhereModel>> getAirportFrom(
      {required int cityId}) async {
    try {
      var data = await apiServer.get(
        endPoint: 'getAirportFrom/$cityId',
      );
      AirportWhereModel airportWhereModel = AirportWhereModel.fromJson(data);
      return right(airportWhereModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AirportWhereModel>> getAirportTo(
      {required int cityId}) async {
    try {
      var data = await apiServer.get(
        endPoint: 'getAirportTo/$cityId',
      );
      AirportWhereModel airportWhereModel = AirportWhereModel.fromJson(data);
      return right(airportWhereModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
