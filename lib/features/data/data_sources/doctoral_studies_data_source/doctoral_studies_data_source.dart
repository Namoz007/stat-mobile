import 'package:stat_edu_mobile/sources.dart';
import 'package:http/http.dart' as http;

class DoctoralStudiesDataSource{
  final _dio = getIt<DioFile>().dio;

  ///Doktoranturaning yo'nalishlar bo'yicha doktorantlar soni ma'lumotlari olib kelinyapti
  Future<List<DoctoralStudiesDirectionDoctoralEntity>> getDoctoralDirectionsData() async{
    final response = await _dio.get("https://api-phd.mininnovation.uz/api/statistics/count_apply_doc_by_direction");
    return List.from((response.data as List<dynamic>).map((value) => DoctoralStudiesDirectionDoctoralModel.fromJson(value)));
  }

  ///Doktoranturaning viloyatdagi doktarantlari va ilmiy rahbarlari soni bo'yicha ma'lumotlari olib kelinyapti
  Future<List<DoctoralStudiesProvinceDoctoralEntity>> getDoctoralStudiesProvinceDoctoralData() async{

    final response = await _dio.get("https://api-phd.mininnovation.uz/api/statistics/count_by_apply_doc_researcher_region");
    return List.from((response.data as List<dynamic>).map((value) => DoctoralStudiesProvinceDoctoralModel.formJson(value)));
  }

  ///Doktoranturaning tashkilotlari ma'lumotlari olib kelinyapti
  Future<List<DoctoralStudiesOrganizationEntity>> getDoctoralStudiesOrganizationsData() async{
    print("organizationslar olib kelinyapti");
    final response = await http.get(Uri.parse("https://api-phd.mininnovation.uz/api/statistics/org_count_by_type_and_org_admin"));
    // final response = await _dio.get("https://api-phd.mininnovation.uz/api/statistics/org_count_by_type_and_org_admin");
    print("bu organizations reponse data ${response}");
    // return List.from((response.data as List<dynamic>).map((value) => DoctoralStudiesOrganizationModel.fromJson(value)));
    return [];
  }

  ///Doktoranturaning viloyatdagi otmlar va ilmiy tashkilotlar soni bo'yicha ma'lumotlar olib kelinyapti
  Future<List<DoctoralStudiesProvinceEducationOrganizationsEntity>> getDoctoralStudiesProvinceOTMData() async{
    final response = await _dio.get("https://api-phd.mininnovation.uz/api/statistics/org_count_by_region_and_type");
    return List.from((response.data as List<dynamic>).map((value) => DoctoralStudiesProvinceEducationOrganizationModel.fromJson(value)));
  }

}