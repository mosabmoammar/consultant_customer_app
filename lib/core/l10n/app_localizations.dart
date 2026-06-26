import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

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
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Consultant App'**
  String get appTitle;

  /// No description provided for @continueButton.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueButton;

  /// No description provided for @or.
  ///
  /// In en, this message translates to:
  /// **'or'**
  String get or;

  /// No description provided for @connectWith.
  ///
  /// In en, this message translates to:
  /// **'Connect With'**
  String get connectWith;

  /// No description provided for @termsOfService.
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get termsOfService;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @byContinuingYouAgreeToThe.
  ///
  /// In en, this message translates to:
  /// **'By continuing you agree to the'**
  String get byContinuingYouAgreeToThe;

  /// No description provided for @and.
  ///
  /// In en, this message translates to:
  /// **'and'**
  String get and;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgotPassword;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signIn;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @emailAddressHint.
  ///
  /// In en, this message translates to:
  /// **'example@email.com'**
  String get emailAddressHint;

  /// No description provided for @passwordHint.
  ///
  /// In en, this message translates to:
  /// **'Min 8 characters'**
  String get passwordHint;

  /// No description provided for @continueWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Continue with Google'**
  String get continueWithGoogle;

  /// No description provided for @continueWithGoogleLowercase.
  ///
  /// In en, this message translates to:
  /// **'Continue with google'**
  String get continueWithGoogleLowercase;

  /// No description provided for @continueWithFacebook.
  ///
  /// In en, this message translates to:
  /// **'Continue with Facebook'**
  String get continueWithFacebook;

  /// No description provided for @signInWithEmail.
  ///
  /// In en, this message translates to:
  /// **'Sign in with Email'**
  String get signInWithEmail;

  /// No description provided for @continueWithEmail.
  ///
  /// In en, this message translates to:
  /// **'Continue with Email'**
  String get continueWithEmail;

  /// No description provided for @enterYourMobileNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter your mobile number'**
  String get enterYourMobileNumber;

  /// No description provided for @searchCountryOrDialCode.
  ///
  /// In en, this message translates to:
  /// **'Search country or dial code'**
  String get searchCountryOrDialCode;

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneNumber;

  /// No description provided for @phoneNumberDigitsHint.
  ///
  /// In en, this message translates to:
  /// **'1234567890'**
  String get phoneNumberDigitsHint;

  /// No description provided for @searchForConsultant.
  ///
  /// In en, this message translates to:
  /// **'Search for Consultant'**
  String get searchForConsultant;

  /// No description provided for @helloName.
  ///
  /// In en, this message translates to:
  /// **'Hello, {name}'**
  String helloName(String name);

  /// No description provided for @findYourConsultant.
  ///
  /// In en, this message translates to:
  /// **'Find your Consultant'**
  String get findYourConsultant;

  /// No description provided for @consultant.
  ///
  /// In en, this message translates to:
  /// **'Consultant'**
  String get consultant;

  /// No description provided for @following.
  ///
  /// In en, this message translates to:
  /// **'Following'**
  String get following;

  /// No description provided for @followingScreen.
  ///
  /// In en, this message translates to:
  /// **'Following Screen'**
  String get followingScreen;

  /// No description provided for @chooseYourCategory.
  ///
  /// In en, this message translates to:
  /// **'Choose your Category'**
  String get chooseYourCategory;

  /// No description provided for @viewAll.
  ///
  /// In en, this message translates to:
  /// **'View all'**
  String get viewAll;

  /// No description provided for @expertFinancialGuidance.
  ///
  /// In en, this message translates to:
  /// **'Expert Financial Guidance'**
  String get expertFinancialGuidance;

  /// No description provided for @bookATrustedAdvisorForYourNextMove.
  ///
  /// In en, this message translates to:
  /// **'Book a trusted advisor for your next move.'**
  String get bookATrustedAdvisorForYourNextMove;

  /// No description provided for @explore.
  ///
  /// In en, this message translates to:
  /// **'Explore'**
  String get explore;

  /// No description provided for @smartPlanningSession.
  ///
  /// In en, this message translates to:
  /// **'Smart Planning Session'**
  String get smartPlanningSession;

  /// No description provided for @turnGoalsIntoAClearActionPlan.
  ///
  /// In en, this message translates to:
  /// **'Turn goals into a clear action plan.'**
  String get turnGoalsIntoAClearActionPlan;

  /// No description provided for @viewOffer.
  ///
  /// In en, this message translates to:
  /// **'View offer'**
  String get viewOffer;

  /// No description provided for @yourNextOpportunity.
  ///
  /// In en, this message translates to:
  /// **'Your Next Opportunity'**
  String get yourNextOpportunity;

  /// No description provided for @getMatchedWithTheRightSpecialist.
  ///
  /// In en, this message translates to:
  /// **'Get matched with the right specialist.'**
  String get getMatchedWithTheRightSpecialist;

  /// No description provided for @seeDetails.
  ///
  /// In en, this message translates to:
  /// **'See details'**
  String get seeDetails;

  /// No description provided for @categories.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get categories;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @message.
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get message;

  /// No description provided for @myConsult.
  ///
  /// In en, this message translates to:
  /// **'My Consult'**
  String get myConsult;

  /// No description provided for @routeNotFound.
  ///
  /// In en, this message translates to:
  /// **'Route not found'**
  String get routeNotFound;

  /// No description provided for @pleaseSelectCustomerOrConsultant.
  ///
  /// In en, this message translates to:
  /// **'Please select customer or consultant'**
  String get pleaseSelectCustomerOrConsultant;

  /// No description provided for @tellUsWhoYouAreAndHowYouDLikeToEngageWithTheApp.
  ///
  /// In en, this message translates to:
  /// **'Tell us who you are and how you\'d like to engage with the app'**
  String get tellUsWhoYouAreAndHowYouDLikeToEngageWithTheApp;

  /// No description provided for @iAmACustomer.
  ///
  /// In en, this message translates to:
  /// **'I am a Customer'**
  String get iAmACustomer;

  /// No description provided for @searchYourBestConsultantAroundTheWorld.
  ///
  /// In en, this message translates to:
  /// **'Search your best consultant around the world'**
  String get searchYourBestConsultantAroundTheWorld;

  /// No description provided for @iAmAConsultant.
  ///
  /// In en, this message translates to:
  /// **'I am a Consultant'**
  String get iAmAConsultant;

  /// No description provided for @discoverYourIdealConsultant.
  ///
  /// In en, this message translates to:
  /// **'Discover Your Ideal Consultant'**
  String get discoverYourIdealConsultant;

  /// No description provided for @diverseRangeOfCategoriesAndConnectWithExperiencedConsultants.
  ///
  /// In en, this message translates to:
  /// **'Diverse range of categories and connect with experienced consultants'**
  String get diverseRangeOfCategoriesAndConnectWithExperiencedConsultants;

  /// No description provided for @bookASessionInstantly.
  ///
  /// In en, this message translates to:
  /// **'Book a Session Instantly'**
  String get bookASessionInstantly;

  /// No description provided for @scheduleAMeetingInSecondsWithOurSmartBookingSystem.
  ///
  /// In en, this message translates to:
  /// **'Schedule a meeting in seconds with our smart booking system'**
  String get scheduleAMeetingInSecondsWithOurSmartBookingSystem;

  /// No description provided for @growWithExpertGuidance.
  ///
  /// In en, this message translates to:
  /// **'Grow With Expert Guidance'**
  String get growWithExpertGuidance;

  /// No description provided for @getPersonalizedAdviceFromTopProfessionalsInEveryField.
  ///
  /// In en, this message translates to:
  /// **'Get personalized advice from top professionals in every field'**
  String get getPersonalizedAdviceFromTopProfessionalsInEveryField;

  /// No description provided for @enterYourOtpSentToYourMobileNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter your OTP sent to your mobile number {dialNumber}'**
  String enterYourOtpSentToYourMobileNumber(String dialNumber);

  /// No description provided for @resendCodeIn.
  ///
  /// In en, this message translates to:
  /// **'Resend code in {time}'**
  String resendCodeIn(String time);

  /// No description provided for @fillYourPersonalInformation.
  ///
  /// In en, this message translates to:
  /// **'Fill your personal information'**
  String get fillYourPersonalInformation;

  /// No description provided for @uploadPhoto.
  ///
  /// In en, this message translates to:
  /// **'Upload photo'**
  String get uploadPhoto;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @jhonDoe.
  ///
  /// In en, this message translates to:
  /// **'Jhon Doe'**
  String get jhonDoe;

  /// No description provided for @emailId.
  ///
  /// In en, this message translates to:
  /// **'Email ID'**
  String get emailId;

  /// No description provided for @johndoeEmail.
  ///
  /// In en, this message translates to:
  /// **'johndoe@email.com'**
  String get johndoeEmail;

  /// No description provided for @country.
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get country;

  /// No description provided for @unitedKingdom.
  ///
  /// In en, this message translates to:
  /// **'United Kingdom'**
  String get unitedKingdom;

  /// No description provided for @city.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get city;

  /// No description provided for @scotland.
  ///
  /// In en, this message translates to:
  /// **'Scotland'**
  String get scotland;

  /// No description provided for @tellMeAboutYourself.
  ///
  /// In en, this message translates to:
  /// **'Tell me about yourself'**
  String get tellMeAboutYourself;

  /// No description provided for @typeHere.
  ///
  /// In en, this message translates to:
  /// **'Type here'**
  String get typeHere;

  /// No description provided for @referralCodeOptional.
  ///
  /// In en, this message translates to:
  /// **'Referral Code (Optional)'**
  String get referralCodeOptional;

  /// No description provided for @enterYourReferralCode.
  ///
  /// In en, this message translates to:
  /// **'Enter your referral code'**
  String get enterYourReferralCode;

  /// No description provided for @setYourExpertise.
  ///
  /// In en, this message translates to:
  /// **'Set your expertise'**
  String get setYourExpertise;

  /// No description provided for @setYourExprtise.
  ///
  /// In en, this message translates to:
  /// **'Set your exprtise'**
  String get setYourExprtise;

  /// No description provided for @category.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get category;

  /// No description provided for @eGCategory.
  ///
  /// In en, this message translates to:
  /// **'e.g Category'**
  String get eGCategory;

  /// No description provided for @introductionVideo.
  ///
  /// In en, this message translates to:
  /// **'Introduction video'**
  String get introductionVideo;

  /// No description provided for @pasteYouTubeLinkHere.
  ///
  /// In en, this message translates to:
  /// **'Paste YouTube link here'**
  String get pasteYouTubeLinkHere;

  /// No description provided for @identityProof.
  ///
  /// In en, this message translates to:
  /// **'Identity Proof'**
  String get identityProof;

  /// No description provided for @uploadDocument.
  ///
  /// In en, this message translates to:
  /// **'Upload Document'**
  String get uploadDocument;

  /// No description provided for @schedule.
  ///
  /// In en, this message translates to:
  /// **'Schedule'**
  String get schedule;

  /// No description provided for @addTime.
  ///
  /// In en, this message translates to:
  /// **'Add time'**
  String get addTime;

  /// No description provided for @audioCallPerMin.
  ///
  /// In en, this message translates to:
  /// **'Audio Call (per min)'**
  String get audioCallPerMin;

  /// No description provided for @videoCallPerMin.
  ///
  /// In en, this message translates to:
  /// **'Video Call (per min)'**
  String get videoCallPerMin;

  /// No description provided for @chatPerSession.
  ///
  /// In en, this message translates to:
  /// **'Chat (per session)'**
  String get chatPerSession;

  /// No description provided for @markAsFree.
  ///
  /// In en, this message translates to:
  /// **'Mark as free'**
  String get markAsFree;

  /// No description provided for @finish.
  ///
  /// In en, this message translates to:
  /// **'Finish'**
  String get finish;

  /// No description provided for @setPrice.
  ///
  /// In en, this message translates to:
  /// **'Set price'**
  String get setPrice;

  /// No description provided for @feeHint.
  ///
  /// In en, this message translates to:
  /// **'00.0'**
  String get feeHint;

  /// No description provided for @categoryAstrologer.
  ///
  /// In en, this message translates to:
  /// **'Astrologer'**
  String get categoryAstrologer;

  /// No description provided for @categoryDoctor.
  ///
  /// In en, this message translates to:
  /// **'Doctor'**
  String get categoryDoctor;

  /// No description provided for @categoryFinancialAdvisor.
  ///
  /// In en, this message translates to:
  /// **'Financial Advisor'**
  String get categoryFinancialAdvisor;

  /// No description provided for @categoryLawyer.
  ///
  /// In en, this message translates to:
  /// **'Lawyer'**
  String get categoryLawyer;

  /// No description provided for @categoryPsychologist.
  ///
  /// In en, this message translates to:
  /// **'Psychologist'**
  String get categoryPsychologist;

  /// No description provided for @categoryRealEstate.
  ///
  /// In en, this message translates to:
  /// **'Real Estate'**
  String get categoryRealEstate;

  /// No description provided for @categoryTutors.
  ///
  /// In en, this message translates to:
  /// **'Tutors'**
  String get categoryTutors;

  /// No description provided for @categoryYoutubers.
  ///
  /// In en, this message translates to:
  /// **'Youtubers'**
  String get categoryYoutubers;

  /// No description provided for @daysMon.
  ///
  /// In en, this message translates to:
  /// **'Mon'**
  String get daysMon;

  /// No description provided for @daysTue.
  ///
  /// In en, this message translates to:
  /// **'Tue'**
  String get daysTue;

  /// No description provided for @daysWed.
  ///
  /// In en, this message translates to:
  /// **'Wed'**
  String get daysWed;

  /// No description provided for @daysThu.
  ///
  /// In en, this message translates to:
  /// **'Thur'**
  String get daysThu;

  /// No description provided for @daysFri.
  ///
  /// In en, this message translates to:
  /// **'Fri'**
  String get daysFri;

  /// No description provided for @daysSat.
  ///
  /// In en, this message translates to:
  /// **'Sat'**
  String get daysSat;

  /// No description provided for @daysSun.
  ///
  /// In en, this message translates to:
  /// **'Sun'**
  String get daysSun;

  /// No description provided for @supportServerError.
  ///
  /// In en, this message translates to:
  /// **'A server error occurred.'**
  String get supportServerError;

  /// No description provided for @supportCacheError.
  ///
  /// In en, this message translates to:
  /// **'A cache error occurred.'**
  String get supportCacheError;

  /// No description provided for @supportFailedLocalAsset.
  ///
  /// In en, this message translates to:
  /// **'Failed to load local asset.'**
  String get supportFailedLocalAsset;

  /// No description provided for @supportNoInternet.
  ///
  /// In en, this message translates to:
  /// **'No internet connection.'**
  String get supportNoInternet;

  /// No description provided for @supportFailedParse.
  ///
  /// In en, this message translates to:
  /// **'Failed to parse data.'**
  String get supportFailedParse;

  /// No description provided for @supportUnauthorized.
  ///
  /// In en, this message translates to:
  /// **'Unauthorized access.'**
  String get supportUnauthorized;

  /// No description provided for @supportFailedToLoadOnboardingData.
  ///
  /// In en, this message translates to:
  /// **'Failed to load onboarding data : {error}'**
  String supportFailedToLoadOnboardingData(String error);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
