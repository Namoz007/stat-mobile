import 'package:dartz/dartz.dart';
import "package:stat_edu_mobile/sources.dart";

abstract class AcceptanceControllerRepo{
  Future<Either<Failure,AcceptanceResponseEntity>> getAcceptanceStatistics();
}