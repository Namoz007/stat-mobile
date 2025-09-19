import 'package:stat_edu_mobile/sources.dart';
class AcceptanceControllerDataSource{
  final _dio = getIt<DioFile>().dio;


  Future<AcceptanceResponseEntity> getAcceptanceStatistics() async{
    final response = await _dio.get("https://prof-emis.edu.uz/api/v2/integration/stat/public/education-type");
    print("bu response ${response.data[response.data.keys.toList()[1]]}");
    return AcceptanceResponseModel.emptyModel();
  }

}