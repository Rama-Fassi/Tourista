import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tourista/core/errors/failures.dart';
import 'package:tourista/core/utlis/api_server.dart';
import 'package:tourista/features/notification/data/models/cancel_delay_trips.dart';

class CanceleDelayTrip {
  final ApiServer apiServer;

  CanceleDelayTrip(this.apiServer);
  Future<Either<Failure, CancelDelayTrips>> cancelDelayTrip(
      {required int tripId}) async {
    try {
      var data = await apiServer
          .post(endPoint: 'restoreMoneyPublic/$tripId', body: {});
      CancelDelayTrips cancelDelayTrips = CancelDelayTrips.fromJson(data);
      return right(cancelDelayTrips);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
