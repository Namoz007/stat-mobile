import 'package:stat_edu_mobile/sources.dart';

class AcceptanceResponseModel extends AcceptanceResponseEntity {
  AcceptanceResponseModel({
    required super.bachelorCount,
    required super.mastersDegreeCount,
    required super.academicLyceumCount,
    required super.secondExpertCount,
    required super.readingTransferredCount,
  });

  factory AcceptanceResponseModel.emptyModel() => AcceptanceResponseModel(
    bachelorCount: 0,
    mastersDegreeCount: 0,
    academicLyceumCount: 0,
    secondExpertCount: 0,
    readingTransferredCount: 0,
  );
}
