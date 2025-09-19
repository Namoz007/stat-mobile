import "package:stat_edu_mobile/sources.dart";

base class Failure extends Equatable {
  final String? message;

  const Failure({this.message});

  @override
  String toString() {
    return message ?? 'Unexpected error';
  }

  @override
  List<Object?> get props => [message];
}

final class ServerFailure extends Failure {
  const ServerFailure({super.message});

  @override
  String toString() {
    return message ?? 'Unexpected error';
  }
}
