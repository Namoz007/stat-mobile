import 'package:stat_edu_mobile/features/domain/entities/entities.dart';

abstract class DoctoralStudiesProvinceDoctoralEntity {
  LanguageNameEntity names;
  int apply_doc_itm_count;
  int apply_doc_otm_count;
  int region;
  int researcher_itm_count;
  int researcher_otm_count;

  DoctoralStudiesProvinceDoctoralEntity({
    required this.names,
    required this.apply_doc_itm_count,
    required this.apply_doc_otm_count,
    required this.region,
    required this.researcher_itm_count,
    required this.researcher_otm_count,
  });
}
