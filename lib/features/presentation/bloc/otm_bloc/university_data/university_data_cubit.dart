
import 'package:stat_edu_mobile/sources.dart';
part 'university_data_state.dart';

class UniversityDataCubit extends Cubit<UniversityDataState> {
  UniversityDataCubit() : super(UniversityDataState(universities: []));

  void addNetUniversity(UniversityEntity model){
    emit(state.copyWith(newUniversities: state.addNewUniversities(model)));
  }

  void removeUniversity(int id){
    emit(state.copyWith(newUniversities: state.removeUniversity(id)));
  }

  void clearData(){
    emit(state.copyWith(newUniversities: []));
  }
}
