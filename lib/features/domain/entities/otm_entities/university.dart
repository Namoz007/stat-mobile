import 'package:stat_edu_mobile/core/constants/constants.dart';

abstract class UniversityEntity {
  int id;
  int regionId;
  String nameUz;
  String nameEn;
  String nameRu;
  int ownershipForm;
  int orgType;
  String phoneNumber;
  String address;
  String licencePdfFile;
  String website;
  String telegram;
  String instagram;
  String facebook;
  String youtube;
  String statLink;
  String location;
  OtmCategoryType categoryType;

  UniversityEntity({
    required this.id,
    required this.regionId,
    required this.nameUz,
    required this.nameEn,
    required this.nameRu,
    required this.ownershipForm,
    required this.orgType,
    required this.phoneNumber,
    required this.address,
    required this.licencePdfFile,
    required this.website,
    required this.telegram,
    required this.instagram,
    required this.facebook,
    required this.youtube,
    required this.statLink,
    required this.location,
    required this.categoryType,
  });
}
