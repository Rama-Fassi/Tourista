import 'package:tourista/core/utlis/api_server.dart';
import 'package:tourista/features/attractions/data/repos/attraction_repo.dart';

class AttractionsRepoImpl implements AttractionRepo {
  final ApiServer apiServer;

  AttractionsRepoImpl(this.apiServer);
}
