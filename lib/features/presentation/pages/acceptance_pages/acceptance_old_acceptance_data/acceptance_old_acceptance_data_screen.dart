import 'package:stat_edu_mobile/sources.dart';

class AcceptanceOldAcceptanceDataScreen extends StatelessWidget {
  const AcceptanceOldAcceptanceDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 20),
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      children: [
        ShowAcceptanceAcceptancesData(
          title: [
            "2021-2022 ${AppLocalizations.of(context)!.year}",
            "2022-2023 ${AppLocalizations.of(context)!.year}",
            "2023-2024 ${AppLocalizations.of(context)!.year}",
            "2024-2025 ${AppLocalizations.of(context)!.year}",
          ],
          acceptanceData: [
            {
              AppLocalizations.of(context)!.bachelor: 948211,
              AppLocalizations.of(context)!.masters: 79108,
              AppLocalizations.of(context)!.academicLyceum: 35614,
              AppLocalizations.of(context)!.vocationalSchool: 103812,
              AppLocalizations.of(context)!.colleges: 112213,
              AppLocalizations.of(context)!.technicalSchools: 161374,
              AppLocalizations.of(context)!.transferStudy: 60010,
              AppLocalizations.of(context)!.secondSpecialty: 31785,
            },
            {
              AppLocalizations.of(context)!.bachelor: 1072118,
              AppLocalizations.of(context)!.masters: 25689,
              AppLocalizations.of(context)!.academicLyceum: 31755,
              AppLocalizations.of(context)!.vocationalSchool: 105791,
              AppLocalizations.of(context)!.colleges: 65518,
              AppLocalizations.of(context)!.technicalSchools: 144682,
              AppLocalizations.of(context)!.transferStudy: 29325,
              AppLocalizations.of(context)!.secondSpecialty: 32113,
            },
            {
              AppLocalizations.of(context)!.bachelor: 948491,
              AppLocalizations.of(context)!.masters: 20054,
              AppLocalizations.of(context)!.academicLyceum: 33884,
              AppLocalizations.of(context)!.vocationalSchool: 129324,
              AppLocalizations.of(context)!.colleges: 35088,
              AppLocalizations.of(context)!.technicalSchools: 140764,
              AppLocalizations.of(context)!.transferStudy: 28218,
              AppLocalizations.of(context)!.secondSpecialty: 37587,
            },
            {
              AppLocalizations.of(context)!.bachelor: 894279,
              AppLocalizations.of(context)!.masters: 33172,
              AppLocalizations.of(context)!.academicLyceum: 44356,
              AppLocalizations.of(context)!.vocationalSchool: 129834,
              AppLocalizations.of(context)!.transferStudy: 41868,
              AppLocalizations.of(context)!.secondSpecialty: 37587,
            },
          ],
        ),
      ],
    );
  }
}
