import 'package:stat_edu_mobile/sources.dart';

class DoctoralStudiesProvinceDoctoralModel
    extends DoctoralStudiesProvinceDoctoralEntity {
  DoctoralStudiesProvinceDoctoralModel({
    required super.names,
    required super.apply_doc_itm_count,
    required super.apply_doc_otm_count,
    required super.region,
    required super.researcher_itm_count,
    required super.researcher_otm_count,
  });

  factory DoctoralStudiesProvinceDoctoralModel.formJson(
    Map<String, dynamic> json,
  ) => DoctoralStudiesProvinceDoctoralModel(
    names: LanguageNameModel.fromJson(json['name']),
    apply_doc_itm_count: json['apply_doc_itm_count'],
    apply_doc_otm_count: json['apply_doc_otm_count'],
    region: json['region'],
    researcher_itm_count: json['researcher_itm_count'],
    researcher_otm_count: json['researcher_otm_count'],
  );
}
