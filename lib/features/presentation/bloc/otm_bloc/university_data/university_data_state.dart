part of 'university_data_cubit.dart';

class UniversityDataState{
  List<UniversityEntity> universities;

  UniversityDataState({required this.universities});

  UniversityDataState copyWith({List<UniversityEntity>? newUniversities}){

    return UniversityDataState(universities: newUniversities ?? universities);
  }

  List<UniversityEntity> addNewUniversities(UniversityEntity model){
    universities.add(model);
    return universities;
  }

  List<UniversityEntity> removeUniversity(int id){
    universities.removeWhere((value) => value.id == id);
    return universities;
  }
}