
import 'package:dartz/dartz.dart';
import '../../sources.dart';

final class RequestAdapter<R> {Future<Either<Failure, R>> handleRequest(Future<R> Function() callback,) async {
  try {
      final response = await callback();
      return Right(response);
    } on DioException catch (e) {
      print("request adapter dio xatosi $e");
      final failure = DioFailure.fromDioError(e);
      return Left(ServerFailure(message: failure.message));
    } catch (e) {
      print("request adapter oddiy xato $e");
      return Left(Failure(message: "Unexpected error: ${e.toString()}"));
    }
  }
}
