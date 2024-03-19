import 'package:flutter/material.dart';

class Constants {
  static const String mdmsApiEndPoint = 'egov-mdms-service/v1/_search';
  static final navKey = GlobalKey<NavigatorState>();
  static const userMobileNumberKey = 'mobileNumber';
  static const String active = 'ACTIVE';
  static const String pendingForAcceptance = 'PENDING_FOR_ACCEPTANCE';
  static const String pendingForCorrection = 'PENDINGFORCORRECTION';
  static const String activeInboxStatus = 'ACTIVE_INBOX_CARD_STATUS';
  static const String rejected = 'REJECTED';
  static const String sentBack = 'SENTBACKTOCBO';
  static const muktaIcon = 'assets/svg/mukta.svg';
  static const devAssets =
      'https://s3.ap-south-1.amazonaws.com/works-dev-asset/worksGlobalConfig.json';
  static const qaAssets =
      'https://s3.ap-south-1.amazonaws.com/works-qa-asset/worksGlobalConfig.json';
  static const uatAssets =
      'https://s3.ap-south-1.amazonaws.com/works-uat-asset/worksGlobalConfig.json';
  static const prodAssets =
      'https://s3.ap-south-1.amazonaws.com/works-prod-asset/worksGlobalConfig.json';
  static const devEnv = 'dev';
  static const qaEnv = 'qa';
  static const uatEnv = 'uat';
  static const prodEnv = 'prod';
  static const homeMyWorks = 'HOME_MY_WORKS';
  static const homeTrackAttendance = 'HOME_TRACK_ATTENDENCE';
  static const homeMusterRolls = 'HOME_MUSTER_ROLLS';
  static const homeMyBills = 'HOME_MY_BILLS';
  static const homeCreateBirthRegistration = 'HOME_BIRTH_REGISTRATION_CREATE';
  static const homeSearchBirthRegistration = 'HOME_BIRTH_REGISTRATION_SEARCH';
  static const homeRegisterWageSeeker = 'HOME_INDIVIDUAL_REGISTRATION';
  static const myBillsWageType = 'EXPENSE.WAGES';
  static const myBillsPurchaseType = 'EXPENSE.PURCHASE';
  static const myBillsSupervisionType = 'EXPENSE.WAGES';
  static const searchIndividual = 'HOME_INDIVIDUAL_SEARCH';
  static List<String> bndHospitalNamesList = [
    "Neelkanth Hospital",
    "Ajit Hospital",
    "Dashmesh Hospital",
    "Biala Orthopaedics And Multispeciality Hospital",
    "Dr. Parminder Singh Pannu Memorial Janta Hospital",
    "Med Card Multispeciality Hospital",
    "Taj Hospital Mattewal"
  ];
  static List<String> bndGenderList = ['MALE', 'FEMALE', 'OTHERS'];
  static List<String> wageSeekerSkillList = [
    'UNSKILLED.MALE_MULIA',
    'SEMI_SKILLED.SCAVENGER',
    'HIGHLY_SKILLED.PAINTER'
  ];
  static List<String> socialCategoryList = ['GEN', 'SC/ST', 'Other'];
  static List<String> relationshipList = [
    'FATHER',
    'HUSBAND',
  ];
  static List<String> cityList = ['pg.citya', 'pg.cityb', 'pg.cityc'];
  static List<String> wardList = ['Ward 1', 'Ward 2', 'Ward 3'];
  static List<String> localityList = ['Amritsar', 'Ludhiana', 'Delhi'];
}

final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
