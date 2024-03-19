import 'package:dart_mappable/dart_mappable.dart';

part 'individual_model.mapper.dart';

@MappableClass()
class IndividualListModel with IndividualListModelMappable {
  List<IndividualModel>? Individual;
  IndividualListModel({this.Individual});
}

@MappableClass()
class IndividualModel with IndividualModelMappable {
  String? id;
  String? individualId;
  String? tenantId;
  String? clientReferenceId;
  String? userId;
  IndividualName? name;
  String? dateOfBirth;
  String? gender;
  String? bloodGroup;
  String? mobileNumber;
  String? altContactNumber;
  String? email;
  List<String>? skills;
  List<IndividualAddress>? address;
  String? fatherName;
  String? husbandName;
  String? relationship;
  List<IndividualIdentifiers>? identifiers;
  String? photo;
  bool? isDeleted;
  int? rowVersion;
  CommonAuditDetails? auditDetails;

  IndividualModel(
      {this.id,
      this.name,
      this.tenantId,
      this.auditDetails,
      this.mobileNumber,
      this.individualId,
      this.gender,
      this.userId,
      this.address,
      this.altContactNumber,
      this.skills,
      this.bloodGroup,
      this.clientReferenceId,
      this.dateOfBirth,
      this.email,
      this.fatherName,
      this.husbandName,
      this.identifiers,
      this.isDeleted,
      this.photo,
      this.relationship,
      this.rowVersion});
}

@MappableClass()
class IndividualAddress with IndividualAddressMappable {
  String? id;
  String? clientReferenceId;
  String? individualId;
  String? tenantId;
  String? doorNo;
  double? latitude;
  double? longitude;
  double? locationAccuracy;
  String? type;
  String? addressLine1;
  String? addressLine2;
  String? landmark;
  String? city;
  String? pincode;
  String? buildingName;
  String? street;
  bool? isDeleted;
  IndividualLocalityOrWard? locality;
  IndividualLocalityOrWard? ward;
  CommonAuditDetails? auditDetails;
  IndividualAddress({
    this.id,
    this.tenantId,
    this.auditDetails,
    this.isDeleted,
    this.clientReferenceId,
    this.individualId,
    this.type,
    this.addressLine1,
    this.addressLine2,
    this.buildingName,
    this.city,
    this.doorNo,
    this.landmark,
    this.latitude,
    this.locationAccuracy,
    this.longitude,
    this.pincode,
    this.street,
    this.locality,
    this.ward,
  });
}

@MappableClass()
class IndividualLocalityOrWard with IndividualLocalityOrWardMappable {
  String? code;
  String? pincode;

  IndividualLocalityOrWard({
    this.code,
    this.pincode,
  });
}

@MappableClass()
class IndividualName with IndividualNameMappable {
  String? givenName;
  String? familyName;
  String? otherNames;

  IndividualName({this.familyName, this.givenName, this.otherNames});
}

@MappableClass()
class IndividualIdentifiers with IndividualIdentifiersMappable {
  String? id;
  String? clientReferenceId;
  String? individualId;
  String? identifierType;
  String? identifierId;
  bool? isDeleted;
  CommonAuditDetails? auditDetails;

  IndividualIdentifiers(
      {this.individualId,
      this.clientReferenceId,
      this.isDeleted,
      this.id,
      this.auditDetails,
      this.identifierId,
      this.identifierType});
}

@MappableClass()
class IndividualSkills with IndividualSkillsMappable {
  String? id;
  String? clientReferenceId;
  String? individualId;
  String? type;
  String? level;
  String? experience;
  bool? isDeleted;
  CommonAuditDetails? auditDetails;

  IndividualSkills(
      {this.individualId,
      this.clientReferenceId,
      this.isDeleted,
      this.id,
      this.auditDetails,
      this.type,
      this.experience,
      this.level});
}

@MappableClass()
class CommonAuditDetails with CommonAuditDetailsMappable {
  String? createdBy;
  String? lastModifiedBy;
  int? createdTime;
  int? lastModifiedTime;

  CommonAuditDetails(
      {this.createdTime,
      this.lastModifiedTime,
      this.createdBy,
      this.lastModifiedBy});
}
