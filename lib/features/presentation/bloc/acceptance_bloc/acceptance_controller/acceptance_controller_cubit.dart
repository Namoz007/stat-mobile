import 'package:stat_edu_mobile/sources.dart';

part 'acceptance_controller_state.dart';

class AcceptanceControllerCubit extends Cubit<AcceptanceControllerState> {
  AcceptanceControllerCubit()
    : super(
        AcceptanceControllerState(
          loading: false,
          data: AcceptanceResponseModel(
            bachelorCount: 894279,
            mastersDegreeCount: 33172,
            academicLyceumCount: 44356,
            secondExpertCount: 37587,
            readingTransferredCount: 41868,
          ),
        ),
      );

  final _repository = getIt<AcceptanceControllerRepositoryImpl>();

  void getAcceptanceStatistics() async {
    // _repository.getAcceptanceStatistics();
  }
}
