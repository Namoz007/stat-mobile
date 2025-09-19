
import 'package:stat_edu_mobile/sources.dart';

class ProfessionalControllerDataSources {
  final _dio = getIt<DioFile>().dio;

  ///Professional ta'limni hududlar kesimida ma'lumotlar olib kelinyapti
  Future<ProfessionalAreasSectionResponseEntity> getProfessionalAreasSectionData() async{
    final response = await _dio.get("https://prof-emis.edu.uz/api/v2/integration/stat/public/region-section");
    return ProfessionalAreasSectionResponseModel.fromJson(response.data);
  }

  ///Professional ta'limni yashash joyi bo'yicha ma'lumotlar olib kelinyapti
  Future<ProfessionalResidenceAreaResponseEntity> getProfessionalResidenceAreaData() async{
    final response = await _dio.get("https://prof-emis.edu.uz/api/v2/integration/stat/public/current-live-place");
    return ProfessionalResidenceAreaResponseModel.fromJson(response.data);
  }

  ///Professional ta'limni yoshi bo'yicha ma'lumotlar olib kelinyapti
  Future<ProfessionalAgeResponseEntity> getProfessionalAgeData() async{
    final response = await _dio.get("https://prof-emis.edu.uz/api/v2/integration/stat/public/age");
    return ProfessionalAgeResponseModel.fromJson(response.data);
  }

  ///Professional ta'limni fuqaroligi bo'yicha ma'lumotlar olib kelinyapti
  Future<ProfessionalCitizenshipResponseEntity> getProfessionalCitizenshipData() async{
    final response = await _dio.get("https://prof-emis.edu.uz/api/v2/integration/stat/public/citizenship");
    return ProfessionalCitizenshipResponseModel.fromJson(response.data);
  }

  ///Professional ta'limni kurslar bo'yicha ma'lumotlari olib kelinyapti
  Future<ProfessionalCoursesResponseEntity> getProfessionalCoursesData() async{
    final response = await _dio.get("https://prof-emis.edu.uz/api/v2/integration/stat/public/course");
    return ProfessionalCoursesResponseModel.fromJson(response.data);
  }

  ///Professional ta'limni to'lov shakli bo'yicha ma'lumotlari olib kelinyapti
  Future<ProfessionalPaymentFormResponseEntity> getProfessionalPaymentFormData() async{
    final response = await _dio.get("https://prof-emis.edu.uz/api/v2/integration/stat/public/admission-type");
    return ProfessionalPaymentFormResponseModel.fromJson(response.data);
  }

  ///Professional ta'limni ta'lim shakli bo'yicha ma'lumotar olib kelinyapti
  Future<ProfessionalEducationFormResponseEntity> getProfessionalEducationFormData() async{
    final response = await _dio.get("https://prof-emis.edu.uz/api/v2/integration/stat/public/education-form");
    return ProfessionalEducationFormResponseModel.fromJson(response.data);
  }

  ///Professional ta'limdagi ta'lim turidagi talabalar ma'lumotlar olib kelinmoqda
  Future<ProfessionalEducationTypeResponseEntity> getProfessionalEducationTypeData() async{
    final response = await _dio.get("https://prof-emis.edu.uz/api/v2/integration/stat/public/education-type");
    return ProfessionalEducationTypeResponseModel.fromJson(response.data);
  }

  ///Professional ta'limdagi muassasalar ma'lumotlari olib kelinmoqda
  Future<List<ProfessionalInstitutionEntity>> getProfessionalInstitutionData() async{
    final response = await _dio.get("https://prof-emis.edu.uz/api/v2/integration/stat/public/tc?&limit=10&offset=0");
    return List.from((response.data as List<dynamic>).map((value) => ProfessionalInstitutionModel.fromJson(value)));
  }
}