import 'package:stat_edu_mobile/core/core.dart';
import 'package:stat_edu_mobile/features/domain/entities/entities.dart';

class UniversityModel extends UniversityEntity {
  UniversityModel({
    required super.id,
    required super.regionId,
    required super.nameUz,
    required super.nameEn,
    required super.nameRu,
    required super.ownershipForm,
    required super.orgType,
    required super.phoneNumber,
    required super.address,
    required super.licencePdfFile,
    required super.website,
    required super.telegram,
    required super.instagram,
    required super.facebook,
    required super.youtube,
    required super.statLink,
    required super.location,
    required super.categoryType,
  });


  factory UniversityModel.fromJson(Map<String, dynamic> json) =>
      UniversityModel(
        id: json['id'],
        regionId: json['region_id'],
        nameUz: json['name_uz'],
        nameEn: json['name_en'],
        nameRu: json['name_ru'],
        ownershipForm: json['ownership_form'],
        orgType: json['org_type'],
        phoneNumber: json['phone_number'],
        address: json['address'],
        licencePdfFile: json['licence_pdf_file'],
        website: json['website'],
        telegram: json['telegram'],
        instagram: json['instagram'],
        facebook: json['facebook'],
        youtube: json['youtube'],
        statLink: json['stat_link'],
        location: json['location'],
        categoryType: formatOtmCategoryWithNumber(json['ownership_form']),
      );
}
