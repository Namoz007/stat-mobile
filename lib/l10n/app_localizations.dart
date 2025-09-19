import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_uz.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ru'),
    Locale('uz')
  ];

  /// No description provided for @higherEducation.
  ///
  /// In en, this message translates to:
  /// **'Higher education'**
  String get higherEducation;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @numberOfHigherEducationInstitutions.
  ///
  /// In en, this message translates to:
  /// **'Number of higher education institutions'**
  String get numberOfHigherEducationInstitutions;

  /// No description provided for @numberOfProfessors.
  ///
  /// In en, this message translates to:
  /// **'Number of professors and teachers'**
  String get numberOfProfessors;

  /// No description provided for @numberOfStudents.
  ///
  /// In en, this message translates to:
  /// **'Number of students'**
  String get numberOfStudents;

  /// No description provided for @professionalEducation.
  ///
  /// In en, this message translates to:
  /// **'Professional education'**
  String get professionalEducation;

  /// No description provided for @colleges.
  ///
  /// In en, this message translates to:
  /// **'Colleges'**
  String get colleges;

  /// No description provided for @technicalSchools.
  ///
  /// In en, this message translates to:
  /// **'Technical schools'**
  String get technicalSchools;

  /// No description provided for @admission.
  ///
  /// In en, this message translates to:
  /// **'Admission'**
  String get admission;

  /// No description provided for @admissionStatistics.
  ///
  /// In en, this message translates to:
  /// **'Admission statistics'**
  String get admissionStatistics;

  /// No description provided for @bachelor.
  ///
  /// In en, this message translates to:
  /// **'Bachelor'**
  String get bachelor;

  /// No description provided for @masters.
  ///
  /// In en, this message translates to:
  /// **'Master\'s degree'**
  String get masters;

  /// No description provided for @academicLyceum.
  ///
  /// In en, this message translates to:
  /// **'Academic lyceum'**
  String get academicLyceum;

  /// No description provided for @secondSpecialty.
  ///
  /// In en, this message translates to:
  /// **'Second specialty'**
  String get secondSpecialty;

  /// No description provided for @transferStudy.
  ///
  /// In en, this message translates to:
  /// **'Transfer study'**
  String get transferStudy;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get total;

  /// No description provided for @students.
  ///
  /// In en, this message translates to:
  /// **'Students'**
  String get students;

  /// No description provided for @teachers.
  ///
  /// In en, this message translates to:
  /// **'Teachers'**
  String get teachers;

  /// No description provided for @universities.
  ///
  /// In en, this message translates to:
  /// **'Universities'**
  String get universities;

  /// No description provided for @foreign.
  ///
  /// In en, this message translates to:
  /// **'Foreign'**
  String get foreign;

  /// No description provided for @nonGovernmental.
  ///
  /// In en, this message translates to:
  /// **'Non-governmental'**
  String get nonGovernmental;

  /// No description provided for @governmental.
  ///
  /// In en, this message translates to:
  /// **'Governmental'**
  String get governmental;

  /// No description provided for @male.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get male;

  /// No description provided for @female.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get female;

  /// No description provided for @numberOfUniversitiesByType.
  ///
  /// In en, this message translates to:
  /// **'Number of universities by organizational type'**
  String get numberOfUniversitiesByType;

  /// No description provided for @numberOfStudentsByGender.
  ///
  /// In en, this message translates to:
  /// **'Number of students by gender'**
  String get numberOfStudentsByGender;

  /// No description provided for @overall.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get overall;

  /// No description provided for @numberOfStudentsByEducationType.
  ///
  /// In en, this message translates to:
  /// **'Number of students by education type'**
  String get numberOfStudentsByEducationType;

  /// No description provided for @ordinatura.
  ///
  /// In en, this message translates to:
  /// **'Residency'**
  String get ordinatura;

  /// No description provided for @numberOfStudentsByCourse.
  ///
  /// In en, this message translates to:
  /// **'Number of students by course'**
  String get numberOfStudentsByCourse;

  /// No description provided for @numberOfStudentsByPaymentType.
  ///
  /// In en, this message translates to:
  /// **'Number of students by payment type'**
  String get numberOfStudentsByPaymentType;

  /// No description provided for @numberOfStudentsByEducationForm.
  ///
  /// In en, this message translates to:
  /// **'Number of students by education form'**
  String get numberOfStudentsByEducationForm;

  /// No description provided for @studentsByUniversityLocation.
  ///
  /// In en, this message translates to:
  /// **'Number of students by university location'**
  String get studentsByUniversityLocation;

  /// No description provided for @top5StudentDenseRegions.
  ///
  /// In en, this message translates to:
  /// **'Top 5 most densely populated regions by students'**
  String get top5StudentDenseRegions;

  /// No description provided for @top5QualifiedGraduatingRegions.
  ///
  /// In en, this message translates to:
  /// **'Top 5 regions producing the most qualified graduates'**
  String get top5QualifiedGraduatingRegions;

  /// No description provided for @studentsByPermanentRegion.
  ///
  /// In en, this message translates to:
  /// **'Number of students by permanent residence region'**
  String get studentsByPermanentRegion;

  /// No description provided for @top5UniversitiesByStudentCount.
  ///
  /// In en, this message translates to:
  /// **'Top 5 universities by number of students'**
  String get top5UniversitiesByStudentCount;

  /// No description provided for @studentsByOwnershipType.
  ///
  /// In en, this message translates to:
  /// **'Number of students by university ownership'**
  String get studentsByOwnershipType;

  /// No description provided for @professorsByGender.
  ///
  /// In en, this message translates to:
  /// **'Professors by gender'**
  String get professorsByGender;

  /// No description provided for @studentsByPaymentForm.
  ///
  /// In en, this message translates to:
  /// **'Students by payment form'**
  String get studentsByPaymentForm;

  /// No description provided for @age.
  ///
  /// In en, this message translates to:
  /// **'Age'**
  String get age;

  /// No description provided for @app_theme.
  ///
  /// In en, this message translates to:
  /// **'App Theme'**
  String get app_theme;

  /// No description provided for @paymentForm.
  ///
  /// In en, this message translates to:
  /// **'Payment form'**
  String get paymentForm;

  /// No description provided for @courses.
  ///
  /// In en, this message translates to:
  /// **'Courses'**
  String get courses;

  /// No description provided for @citizenship.
  ///
  /// In en, this message translates to:
  /// **'Citizenship'**
  String get citizenship;

  /// No description provided for @educationForm.
  ///
  /// In en, this message translates to:
  /// **'Education form'**
  String get educationForm;

  /// No description provided for @educationType.
  ///
  /// In en, this message translates to:
  /// **'Education type'**
  String get educationType;

  /// No description provided for @residenceRegion.
  ///
  /// In en, this message translates to:
  /// **'Region of residence'**
  String get residenceRegion;

  /// No description provided for @byRegions.
  ///
  /// In en, this message translates to:
  /// **'By regions'**
  String get byRegions;

  /// No description provided for @byGender.
  ///
  /// In en, this message translates to:
  /// **'By gender'**
  String get byGender;

  /// No description provided for @director.
  ///
  /// In en, this message translates to:
  /// **'Director'**
  String get director;

  /// No description provided for @teachersByGender.
  ///
  /// In en, this message translates to:
  /// **'Teachers by gender'**
  String get teachersByGender;

  /// No description provided for @teachersByScientificQualification.
  ///
  /// In en, this message translates to:
  /// **'Teachers by scientific qualification'**
  String get teachersByScientificQualification;

  /// No description provided for @teachersByDegree.
  ///
  /// In en, this message translates to:
  /// **'Teachers by academic degree'**
  String get teachersByDegree;

  /// No description provided for @teachersByTitle.
  ///
  /// In en, this message translates to:
  /// **'Teachers by academic title'**
  String get teachersByTitle;

  /// No description provided for @byPosition.
  ///
  /// In en, this message translates to:
  /// **'By position'**
  String get byPosition;

  /// No description provided for @byWorkType.
  ///
  /// In en, this message translates to:
  /// **'By work type'**
  String get byWorkType;

  /// No description provided for @citizenshipByWorkType.
  ///
  /// In en, this message translates to:
  /// **'Citizenship by work type'**
  String get citizenshipByWorkType;

  /// No description provided for @teachersByAge.
  ///
  /// In en, this message translates to:
  /// **'Teachers by age'**
  String get teachersByAge;

  /// No description provided for @details.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get details;

  /// No description provided for @statistics.
  ///
  /// In en, this message translates to:
  /// **'Statistics'**
  String get statistics;

  /// No description provided for @officialWebsite.
  ///
  /// In en, this message translates to:
  /// **'Official website'**
  String get officialWebsite;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @officialSocialMedia.
  ///
  /// In en, this message translates to:
  /// **'Official social media'**
  String get officialSocialMedia;

  /// No description provided for @route.
  ///
  /// In en, this message translates to:
  /// **'Route'**
  String get route;

  /// No description provided for @educational_indicators_numbers.
  ///
  /// In en, this message translates to:
  /// **'educational indicators numbers'**
  String get educational_indicators_numbers;

  /// No description provided for @appLanguage.
  ///
  /// In en, this message translates to:
  /// **'App language'**
  String get appLanguage;

  /// No description provided for @call_admin.
  ///
  /// In en, this message translates to:
  /// **'Call Admin'**
  String get call_admin;

  /// No description provided for @vocationalEducation.
  ///
  /// In en, this message translates to:
  /// **'Vocational education'**
  String get vocationalEducation;

  /// No description provided for @studentsInVocational.
  ///
  /// In en, this message translates to:
  /// **'Students'**
  String get studentsInVocational;

  /// No description provided for @institutionsList.
  ///
  /// In en, this message translates to:
  /// **'Institutions'**
  String get institutionsList;

  /// No description provided for @collegesList.
  ///
  /// In en, this message translates to:
  /// **'Colleges'**
  String get collegesList;

  /// No description provided for @technicalSchoolsList.
  ///
  /// In en, this message translates to:
  /// **'Technical schools'**
  String get technicalSchoolsList;

  /// No description provided for @vocationalInstitutionsList.
  ///
  /// In en, this message translates to:
  /// **'List of vocational education institutions'**
  String get vocationalInstitutionsList;

  /// No description provided for @searchInstitutionHint.
  ///
  /// In en, this message translates to:
  /// **'Enter the name of the institution to search...'**
  String get searchInstitutionHint;

  /// No description provided for @vocationalSchool.
  ///
  /// In en, this message translates to:
  /// **'Vocational school'**
  String get vocationalSchool;

  /// No description provided for @year.
  ///
  /// In en, this message translates to:
  /// **'year'**
  String get year;

  /// No description provided for @firstCourse.
  ///
  /// In en, this message translates to:
  /// **'1-course'**
  String get firstCourse;

  /// No description provided for @secondCourse.
  ///
  /// In en, this message translates to:
  /// **'2-course'**
  String get secondCourse;

  /// No description provided for @thirdCourse.
  ///
  /// In en, this message translates to:
  /// **'3-course'**
  String get thirdCourse;

  /// No description provided for @fourthCourse.
  ///
  /// In en, this message translates to:
  /// **'4-course'**
  String get fourthCourse;

  /// No description provided for @fifthCourse.
  ///
  /// In en, this message translates to:
  /// **'5-course'**
  String get fifthCourse;

  /// No description provided for @sixthCourse.
  ///
  /// In en, this message translates to:
  /// **'6-course'**
  String get sixthCourse;

  /// No description provided for @seventhCourse.
  ///
  /// In en, this message translates to:
  /// **'7-course'**
  String get seventhCourse;

  /// No description provided for @stateGrant.
  ///
  /// In en, this message translates to:
  /// **'State grant'**
  String get stateGrant;

  /// No description provided for @contractBased.
  ///
  /// In en, this message translates to:
  /// **'Contract-based'**
  String get contractBased;

  /// No description provided for @evening.
  ///
  /// In en, this message translates to:
  /// **'Evening'**
  String get evening;

  /// No description provided for @external.
  ///
  /// In en, this message translates to:
  /// **'External'**
  String get external;

  /// No description provided for @remote.
  ///
  /// In en, this message translates to:
  /// **'Remote'**
  String get remote;

  /// No description provided for @specialExternal.
  ///
  /// In en, this message translates to:
  /// **'Special external'**
  String get specialExternal;

  /// No description provided for @joint.
  ///
  /// In en, this message translates to:
  /// **'Joint'**
  String get joint;

  /// No description provided for @jointExternal.
  ///
  /// In en, this message translates to:
  /// **'Joint (external)'**
  String get jointExternal;

  /// No description provided for @jointDaytime.
  ///
  /// In en, this message translates to:
  /// **'Joint (daytime)'**
  String get jointDaytime;

  /// No description provided for @daytime.
  ///
  /// In en, this message translates to:
  /// **'Daytime'**
  String get daytime;

  /// No description provided for @secondHigherExternal.
  ///
  /// In en, this message translates to:
  /// **'Second higher (external)'**
  String get secondHigherExternal;

  /// No description provided for @secondHigherEvening.
  ///
  /// In en, this message translates to:
  /// **'Second higher (evening)'**
  String get secondHigherEvening;

  /// No description provided for @secondHigherDaytime.
  ///
  /// In en, this message translates to:
  /// **'Second higher (daytime)'**
  String get secondHigherDaytime;

  /// No description provided for @university.
  ///
  /// In en, this message translates to:
  /// **'University'**
  String get university;

  /// No description provided for @institute.
  ///
  /// In en, this message translates to:
  /// **'Institute'**
  String get institute;

  /// No description provided for @branch.
  ///
  /// In en, this message translates to:
  /// **'Branch'**
  String get branch;

  /// No description provided for @academy.
  ///
  /// In en, this message translates to:
  /// **'Academy'**
  String get academy;

  /// No description provided for @andijanRegion.
  ///
  /// In en, this message translates to:
  /// **'Andijan region'**
  String get andijanRegion;

  /// No description provided for @bukharaRegion.
  ///
  /// In en, this message translates to:
  /// **'Bukhara region'**
  String get bukharaRegion;

  /// No description provided for @ferganaRegion.
  ///
  /// In en, this message translates to:
  /// **'Fergana region'**
  String get ferganaRegion;

  /// No description provided for @jizzakhRegion.
  ///
  /// In en, this message translates to:
  /// **'Jizzakh region'**
  String get jizzakhRegion;

  /// No description provided for @namanganRegion.
  ///
  /// In en, this message translates to:
  /// **'Namangan region'**
  String get namanganRegion;

  /// No description provided for @navoiyRegion.
  ///
  /// In en, this message translates to:
  /// **'Navoiy region'**
  String get navoiyRegion;

  /// No description provided for @qashqadaryaRegion.
  ///
  /// In en, this message translates to:
  /// **'Kashkadarya region'**
  String get qashqadaryaRegion;

  /// No description provided for @karakalpakstan.
  ///
  /// In en, this message translates to:
  /// **'Republic of Karakalpakstan'**
  String get karakalpakstan;

  /// No description provided for @samarkandRegion.
  ///
  /// In en, this message translates to:
  /// **'Samarkand region'**
  String get samarkandRegion;

  /// No description provided for @tashkentCity.
  ///
  /// In en, this message translates to:
  /// **'Tashkent city'**
  String get tashkentCity;

  /// No description provided for @tashkentRegion.
  ///
  /// In en, this message translates to:
  /// **'Tashkent region'**
  String get tashkentRegion;

  /// No description provided for @khorezmRegion.
  ///
  /// In en, this message translates to:
  /// **'Khorezm region'**
  String get khorezmRegion;

  /// No description provided for @economicsUniversity.
  ///
  /// In en, this message translates to:
  /// **'Tashkent State University of Economics'**
  String get economicsUniversity;

  /// No description provided for @chemistryUniversity.
  ///
  /// In en, this message translates to:
  /// **'Tashkent International University of Chemistry'**
  String get chemistryUniversity;

  /// No description provided for @nationalUniversity.
  ///
  /// In en, this message translates to:
  /// **'National University of Uzbekistan'**
  String get nationalUniversity;

  /// No description provided for @isftInstitute.
  ///
  /// In en, this message translates to:
  /// **'ISFT Institute'**
  String get isftInstitute;

  /// No description provided for @ferganaUniversity.
  ///
  /// In en, this message translates to:
  /// **'Fergana State University'**
  String get ferganaUniversity;

  /// No description provided for @above30.
  ///
  /// In en, this message translates to:
  /// **'Above 30'**
  String get above30;

  /// No description provided for @below30.
  ///
  /// In en, this message translates to:
  /// **'Below 30'**
  String get below30;

  /// No description provided for @noCitizenship.
  ///
  /// In en, this message translates to:
  /// **'Stateless person'**
  String get noCitizenship;

  /// No description provided for @uzbekCitizen.
  ///
  /// In en, this message translates to:
  /// **'Citizen of Uzbekistan'**
  String get uzbekCitizen;

  /// No description provided for @foreignCitizen.
  ///
  /// In en, this message translates to:
  /// **'Foreign citizen'**
  String get foreignCitizen;

  /// No description provided for @dean.
  ///
  /// In en, this message translates to:
  /// **'Dean'**
  String get dean;

  /// No description provided for @departmentHead.
  ///
  /// In en, this message translates to:
  /// **'Head of department'**
  String get departmentHead;

  /// No description provided for @rector.
  ///
  /// In en, this message translates to:
  /// **'Rector'**
  String get rector;

  /// No description provided for @noDegree.
  ///
  /// In en, this message translates to:
  /// **'No degree'**
  String get noDegree;

  /// No description provided for @hasDegree.
  ///
  /// In en, this message translates to:
  /// **'With degree'**
  String get hasDegree;

  /// No description provided for @dsc.
  ///
  /// In en, this message translates to:
  /// **'Doctor of Science (DSc)'**
  String get dsc;

  /// No description provided for @phd.
  ///
  /// In en, this message translates to:
  /// **'PhD'**
  String get phd;

  /// No description provided for @docent.
  ///
  /// In en, this message translates to:
  /// **'Docent'**
  String get docent;

  /// No description provided for @seniorResearcher.
  ///
  /// In en, this message translates to:
  /// **'Senior researcher'**
  String get seniorResearcher;

  /// No description provided for @professor.
  ///
  /// In en, this message translates to:
  /// **'Professor'**
  String get professor;

  /// No description provided for @noTitle.
  ///
  /// In en, this message translates to:
  /// **'No title'**
  String get noTitle;

  /// No description provided for @assistant.
  ///
  /// In en, this message translates to:
  /// **'Assistant'**
  String get assistant;

  /// No description provided for @seniorLecturer.
  ///
  /// In en, this message translates to:
  /// **'Senior lecturer'**
  String get seniorLecturer;

  /// No description provided for @traineeTeacher.
  ///
  /// In en, this message translates to:
  /// **'Trainee teacher'**
  String get traineeTeacher;

  /// No description provided for @mainWorkPlace.
  ///
  /// In en, this message translates to:
  /// **'Main workplace'**
  String get mainWorkPlace;

  /// No description provided for @ageAbove60.
  ///
  /// In en, this message translates to:
  /// **'Above 60'**
  String get ageAbove60;

  /// No description provided for @age55_60.
  ///
  /// In en, this message translates to:
  /// **'55–60'**
  String get age55_60;

  /// No description provided for @age50_55.
  ///
  /// In en, this message translates to:
  /// **'50–55'**
  String get age50_55;

  /// No description provided for @age45_50.
  ///
  /// In en, this message translates to:
  /// **'45–50'**
  String get age45_50;

  /// No description provided for @age40_45.
  ///
  /// In en, this message translates to:
  /// **'40–45'**
  String get age40_45;

  /// No description provided for @age35_40.
  ///
  /// In en, this message translates to:
  /// **'35–40'**
  String get age35_40;

  /// No description provided for @age30_35.
  ///
  /// In en, this message translates to:
  /// **'30–35'**
  String get age30_35;

  /// No description provided for @ageUnder30.
  ///
  /// In en, this message translates to:
  /// **'Under 30'**
  String get ageUnder30;

  /// No description provided for @rentedHouse.
  ///
  /// In en, this message translates to:
  /// **'Rented house'**
  String get rentedHouse;

  /// No description provided for @ownHouse.
  ///
  /// In en, this message translates to:
  /// **'Own house'**
  String get ownHouse;

  /// No description provided for @relativeHouse.
  ///
  /// In en, this message translates to:
  /// **'Relative\'s house'**
  String get relativeHouse;

  /// No description provided for @dormitory.
  ///
  /// In en, this message translates to:
  /// **'Dormitory'**
  String get dormitory;

  /// No description provided for @friendHouse.
  ///
  /// In en, this message translates to:
  /// **'Friend\'s house'**
  String get friendHouse;

  /// No description provided for @vocationalSchools.
  ///
  /// In en, this message translates to:
  /// **'Vocational schools'**
  String get vocationalSchools;

  /// No description provided for @under18.
  ///
  /// In en, this message translates to:
  /// **'Under 18'**
  String get under18;

  /// No description provided for @other.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get other;

  /// No description provided for @dual.
  ///
  /// In en, this message translates to:
  /// **'Dual'**
  String get dual;

  /// No description provided for @under20.
  ///
  /// In en, this message translates to:
  /// **'Under 20'**
  String get under20;

  /// No description provided for @above20.
  ///
  /// In en, this message translates to:
  /// **'Above 20'**
  String get above20;

  /// No description provided for @men.
  ///
  /// In en, this message translates to:
  /// **'Men'**
  String get men;

  /// No description provided for @women.
  ///
  /// In en, this message translates to:
  /// **'Women'**
  String get women;

  /// No description provided for @hostel.
  ///
  /// In en, this message translates to:
  /// **'Hostel'**
  String get hostel;

  /// No description provided for @surxondaryoRegion.
  ///
  /// In en, this message translates to:
  /// **'Surxondaryo region'**
  String get surxondaryoRegion;

  /// No description provided for @sirdaryoRegion.
  ///
  /// In en, this message translates to:
  /// **'Sirdaryo region'**
  String get sirdaryoRegion;

  /// No description provided for @unders20.
  ///
  /// In en, this message translates to:
  /// **'Under 20 years old'**
  String get unders20;

  /// No description provided for @overs20.
  ///
  /// In en, this message translates to:
  /// **'Over 20 years old'**
  String get overs20;

  /// No description provided for @technicalSchool.
  ///
  /// In en, this message translates to:
  /// **'Technical school'**
  String get technicalSchool;

  /// No description provided for @college.
  ///
  /// In en, this message translates to:
  /// **'College'**
  String get college;

  /// No description provided for @main.
  ///
  /// In en, this message translates to:
  /// **'Main'**
  String get main;

  /// No description provided for @doctoral_studies.
  ///
  /// In en, this message translates to:
  /// **'Doctoral studies'**
  String get doctoral_studies;

  /// No description provided for @ownership_form.
  ///
  /// In en, this message translates to:
  /// **'Form of ownership'**
  String get ownership_form;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'ru', 'uz'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'ru': return AppLocalizationsRu();
    case 'uz': return AppLocalizationsUz();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
