import 'package:dartz/dartz.dart';
import 'package:stat_edu_mobile/sources.dart';
class AcceptanceControllerRepositoryImpl extends AcceptanceControllerRepo{

  final _dataSource = getIt<AcceptanceControllerDataSource>();

  @override
  Future<Either<Failure, AcceptanceResponseEntity>> getAcceptanceStatistics() {
    final response = RequestAdapter<AcceptanceResponseEntity>();
    return response.handleRequest(() => _dataSource.getAcceptanceStatistics());
  }

}