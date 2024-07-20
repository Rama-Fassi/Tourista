import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/errors/failures.dart';
import 'package:tourista/core/utlis/api_server.dart';
import 'package:tourista/features/my_trips/data/models/all_trips_model/all_trips_model.dart';
import 'package:tourista/features/my_trips/data/models/favorit_trips_model/favorit_trips_model.dart';
import 'package:tourista/features/my_trips/data/repos/my_trips_repo.dart';

class MyTripsRepoImpl implements MyTripsRepo {
  final ApiServer apiServer;

  MyTripsRepoImpl(this.apiServer);

  @override
  Future<Either<Failure, FavoritTripsModel>> getFavoritTrips() async {
    try {
      var data = await apiServer.get(
        endPoint: 'favorite',
        token: kToken,
      );
      FavoritTripsModel favoritTripsModel = FavoritTripsModel.fromJson(data);
      return right(favoritTripsModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AllTripsModel>> getPastTrips() async {
    try {
      var data = await apiServer.get(
        endPoint: 'pastTrips',
        token: kToken,
      );
      AllTripsModel allTripsModel = AllTripsModel.fromJson(data);
      return right(allTripsModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AllTripsModel>> getActiveTrips() async {
    try {
      var data = await apiServer.get(
        endPoint: 'activeTrips',
        token: kToken,
      );
      AllTripsModel allTripsModel = AllTripsModel.fromJson(data);
      return right(allTripsModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AllTripsModel>> getCanceledTrips() async {
    try {
      var data = await apiServer.get(
        endPoint: 'getCancelledTrip',
        token: kToken,
      );
      AllTripsModel allTripsModel = AllTripsModel.fromJson(data);
      print('${allTripsModel.allTrips}dddddddddddd');
      return right(allTripsModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
