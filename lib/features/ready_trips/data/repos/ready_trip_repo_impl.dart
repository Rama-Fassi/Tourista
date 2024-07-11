import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/errors/failures.dart';
import 'package:tourista/core/utlis/api_server.dart';
import 'package:tourista/features/ready_trips/data/models/add_favourite_model.dart';
import 'package:tourista/features/ready_trips/data/models/all_ready_trips_model/all_ready_trips_model.dart';
import 'package:tourista/features/ready_trips/data/models/ready_trips_details_model/ready_trips_details_model.dart';
import 'package:tourista/features/ready_trips/data/models/ready_trips_point_model/ready_trips_point_model.dart';
import 'package:tourista/features/ready_trips/data/repos/ready_trip_repo.dart';

class ReadyTripsRepoImpl implements ReadyTripsRepo {
  final ApiServer apiServer;

  ReadyTripsRepoImpl(this.apiServer);

  @override
  Future<Either<Failure, AllReadyTripsModel>> getAllReadyTrips(
      {int? classificationId}) async {
    try {
      var data = await apiServer.post(
          endPoint: 'allPublicTrips',
          token: kToken,
          body: classificationId == null
              ? {}
              : {'classification_id': classificationId});
      AllReadyTripsModel allReadyTripsModel = AllReadyTripsModel.fromJson(data);
      return right(allReadyTripsModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ReadyTripsDetailsModel>> getReadyTripDetails(
      {required int tripId}) async {
    try {
      var data = await apiServer.get(
        endPoint: 'getPublicTripInfo/$tripId',
      );
      ReadyTripsDetailsModel readyTripsDetailsModel =
          ReadyTripsDetailsModel.fromJson(data);
      return right(readyTripsDetailsModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AddFavouriteModel>> addFavouriteTrip(
      {required int tripId}) async {
    try {
      var data = await apiServer
          .post(endPoint: 'faveOrNot/$tripId', token: kToken, body: {});
      AddFavouriteModel addFavouriteModel = AddFavouriteModel.fromJson(data);
      return right(addFavouriteModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ReadyTripsPointModel>> getReadyTripPoints(
      {required int tripId}) async {
    try {
      var data = await apiServer.get(
        endPoint: 'getPublicTripPoints/$tripId',
      );
      ReadyTripsPointModel readyTripsPoint =
          ReadyTripsPointModel.fromJson(data);
      return right(readyTripsPoint);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
