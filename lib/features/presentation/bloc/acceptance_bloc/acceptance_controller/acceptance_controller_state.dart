part of 'acceptance_controller_cubit.dart';

class AcceptanceControllerState {
  bool loading;
  AcceptanceResponseEntity data;

  AcceptanceControllerState({required this.loading, required this.data});

  AcceptanceControllerState copyWith({
    bool? isLoading,
    AcceptanceResponseEntity? newData,
  }) => AcceptanceControllerState(
    loading: isLoading ?? loading,
    data: newData ?? data,
  );
}
