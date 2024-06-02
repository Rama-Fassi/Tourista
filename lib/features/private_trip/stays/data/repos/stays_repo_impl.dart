import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tourista/core/errors/failures.dart';
import 'package:tourista/core/utlis/api_server.dart';
import 'package:tourista/features/private_trip/stays/data/models/hotels_model/hotels_model.dart';
import 'package:tourista/features/private_trip/stays/data/repos/stays_repo.dart';

class StaysRepoImpl implements StaysRepo {
  final ApiServer apiServer;

  StaysRepoImpl(this.apiServer);
  @override
  Future<Either<Failure, HotelsModel>> fetchHotels(
      {required int tripId}) async {
    try {
      var data = await apiServer.get(
        endPoint: 'cityHotels/$tripId',
      );

      HotelsModel hotelsModel = HotelsModel.fromJson(data);

      return right(hotelsModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
