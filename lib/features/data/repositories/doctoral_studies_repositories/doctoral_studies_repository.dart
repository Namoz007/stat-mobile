import 'package:dartz/dartz.dart';
import 'package:stat_edu_mobile/sources.dart';

class DoctoralStudiesRepository extends DoctoralStudiesRepo{
  final _dataSource = getIt<DoctoralStudiesDataSource>();

  ///Doktoranturaning yo'nalishlar bo'yicha doktorantlar soni ma'lumotlari olib kelinyapti
  @override
  Future<Either<Failure, List<DoctoralStudiesDirectionDoctoralEntity>>> getDoctoralDirectionsData() {
    return RequestAdapter<List<DoctoralStudiesDirectionDoctoralEntity>>().handleRequest(() => _dataSource.getDoctoralDirectionsData());
  }

  ///Doktoranturaning viloyatdagi doktarantlari va ilmiy rahbarlari soni bo'yicha ma'lumotlari olib kelinyapti
  @override
  Future<Either<Failure, List<DoctoralStudiesProvinceDoctoralEntity>>> getDoctoralStudiesProvinceDoctoralData() {
    return RequestAdapter<List<DoctoralStudiesProvinceDoctoralEntity>>().handleRequest(() => _dataSource.getDoctoralStudiesProvinceDoctoralData());
  }

  ///Doktoranturani viloyatdagi omtlar va ilmiy tashkilotlar soni bo'yicha ma'lumotlari bo'yicha ma'lumotlari olib kelinyapti
  @override
  Future<Either<Failure, List<DoctoralStudiesProvinceEducationOrganizationsEntity>>> getDoctoralStudiesProvinceOTMData() {
    return RequestAdapter<List<DoctoralStudiesProvinceEducationOrganizationsEntity>>().handleRequest(() => _dataSource.getDoctoralStudiesProvinceOTMData());
  }

  ///Doktoranturadagi tashkilotlar ma'lumotlari olib kelinyapti
  @override
  Future<Either<Failure, List<DoctoralStudiesOrganizationEntity>>> getDoctoralStudiesOrganizationsData() async{
    await _dataSource.getDoctoralStudiesOrganizationsData();
    return RequestAdapter<List<DoctoralStudiesOrganizationEntity>>().handleRequest(() => _dataSource.getDoctoralStudiesOrganizationsData());
  }

}