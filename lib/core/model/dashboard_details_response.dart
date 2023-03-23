import 'package:dems1/core/model/oldmodel/base_model.dart';
import 'package:stacked/stacked.dart';



import 'dart:convert';

DashBoardDetails dashBoardDetailsFromJson(String str) => DashBoardDetails.fromJson(json.decode(str));

String dashBoardDetailsToJson(DashBoardDetails data) => json.encode(data.toJson());

class DashBoardDetails {
  DashBoardDetails({
    required this.dashboardDetails,
    required this.success,
    required this.user,
    required this.expensive,
    required this.upcommingtrip,
  });

  DashboardDetails dashboardDetails;
  bool success;
  User user;
  Expensive expensive;
  List<dynamic> upcommingtrip;

  factory DashBoardDetails.fromJson(Map<String, dynamic> json) => DashBoardDetails(
    dashboardDetails: DashboardDetails.fromJson(json["dashboard_details"]),
    success: json["success"],
    user: User.fromJson(json["user"]),
    expensive: Expensive.fromJson(json["expensive"]),
    upcommingtrip: List<dynamic>.from(json["upcommingtrip"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "dashboard_details": dashboardDetails.toJson(),
    "success": success,
    "user": user.toJson(),
    "expensive": expensive.toJson(),
    "upcommingtrip": List<dynamic>.from(upcommingtrip.map((x) => x)),
  };
}

class DashboardDetails {
  DashboardDetails({
    required this.totalTrips,
    required this.totalClaimsPending,
    required this.totalUpcomingTrips,
    required this.tripsPending,
    required this.tripsApproved,
    required this.tripsCompleted,
    required this.tripsRejected,
    required this.tripsCancelled,
    required this.claimsNew,
    required this.claimsRequested,
    required this.claimsApproved,
    required this.claimsRejected,
    required this.claimsCompleted,
    required this.verificationRequested,
    required this.verificationApproved,
    required this.verificationRejected,
    required this.verificationClaim2Requested,
    required this.verificationClaim2Approved,
    required this.verificationClaim2Rejected,
    required this.verificationCompleted,
    required this.versionCode,
    required this.versionName,
  });

  int totalTrips;
  int totalClaimsPending;
  int totalUpcomingTrips;
  int tripsPending;
  int tripsApproved;
  int tripsCompleted;
  int tripsRejected;
  int tripsCancelled;
  int claimsNew;
  int claimsRequested;
  int claimsApproved;
  int claimsRejected;
  int claimsCompleted;
  int verificationRequested;
  int verificationApproved;
  int verificationRejected;
  int verificationClaim2Requested;
  int verificationClaim2Approved;
  int verificationClaim2Rejected;
  int verificationCompleted;
  int versionCode;
  String versionName;

  factory DashboardDetails.fromJson(Map<String, dynamic> json) => DashboardDetails(
    totalTrips: json["total_trips"],
    totalClaimsPending: json["total_claims_pending"],
    totalUpcomingTrips: json["total_upcoming_trips"],
    tripsPending: json["trips_pending"],
    tripsApproved: json["trips_approved"],
    tripsCompleted: json["trips_completed"],
    tripsRejected: json["trips_rejected"],
    tripsCancelled: json["trips_cancelled"],
    claimsNew: json["claims_new"],
    claimsRequested: json["claims_requested"],
    claimsApproved: json["claims_approved"],
    claimsRejected: json["claims_rejected"],
    claimsCompleted: json["claims_completed"],
    verificationRequested: json["verification_requested"],
    verificationApproved: json["verification_approved"],
    verificationRejected: json["verification_rejected"],
    verificationClaim2Requested: json["verification_claim2_requested"],
    verificationClaim2Approved: json["verification_claim2_approved"],
    verificationClaim2Rejected: json["verification_claim2_rejected"],
    verificationCompleted: json["verification_completed"],
    versionCode: json["version_code"],
    versionName: json["version_name"],
  );

  Map<String, dynamic> toJson() => {
    "total_trips": totalTrips,
    "total_claims_pending": totalClaimsPending,
    "total_upcoming_trips": totalUpcomingTrips,
    "trips_pending": tripsPending,
    "trips_approved": tripsApproved,
    "trips_completed": tripsCompleted,
    "trips_rejected": tripsRejected,
    "trips_cancelled": tripsCancelled,
    "claims_new": claimsNew,
    "claims_requested": claimsRequested,
    "claims_approved": claimsApproved,
    "claims_rejected": claimsRejected,
    "claims_completed": claimsCompleted,
    "verification_requested": verificationRequested,
    "verification_approved": verificationApproved,
    "verification_rejected": verificationRejected,
    "verification_claim2_requested": verificationClaim2Requested,
    "verification_claim2_approved": verificationClaim2Approved,
    "verification_claim2_rejected": verificationClaim2Rejected,
    "verification_completed": verificationCompleted,
    "version_code": versionCode,
    "version_name": versionName,
  };
}

class Expensive {
  Expensive({
    required this.monthly,
    required this.annual,
    required this.week,
  });

  Annual monthly;
  Annual annual;
  Week week;

  factory Expensive.fromJson(Map<String, dynamic> json) => Expensive(
    monthly: Annual.fromJson(json["monthly"]),
    annual: Annual.fromJson(json["annual"]),
    week: Week.fromJson(json["week"]),
  );

  Map<String, dynamic> toJson() => {
    "monthly": monthly.toJson(),
    "annual": annual.toJson(),
    "week": week.toJson(),
  };
}

class Annual {
  Annual({
    required this.fare,
    required this.lodging,
    required this.boarding,
    required this.others,
    required this.total,
    required this.displayFare,
    required this.displayLodging,
    required this.displayBoarding,
    required this.displayOthers,
    required this.displayTotal,
  });

  String fare;
  String lodging;
  String boarding;
  String others;
  String total;
  String displayFare;
  String displayLodging;
  String displayBoarding;
  String displayOthers;
  String displayTotal;

  factory Annual.fromJson(Map<String, dynamic> json) => Annual(
    fare: json["fare"],
    lodging: json["lodging"],
    boarding: json["boarding"],
    others: json["others"],
    total: json["total"],
    displayFare: json["display_fare"],
    displayLodging: json["display_lodging"],
    displayBoarding: json["display_boarding"],
    displayOthers: json["display_others"],
    displayTotal: json["display_total"],
  );

  Map<String, dynamic> toJson() => {
    "fare": fare,
    "lodging": lodging,
    "boarding": boarding,
    "others": others,
    "total": total,
    "display_fare": displayFare,
    "display_lodging": displayLodging,
    "display_boarding": displayBoarding,
    "display_others": displayOthers,
    "display_total": displayTotal,
  };
}

class Week {
  Week({
    required this.fare,
    required this.lodging,
    required this.boarding,
    required this.others,
    required this.total,
    required this.displayFare,
    required this.displayLodging,
    required this.displayBoarding,
    required this.displayOthers,
    required this.displayTotal,
  });

  int fare;
  int lodging;
  int boarding;
  int others;
  int total;
  int displayFare;
  int displayLodging;
  int displayBoarding;
  int displayOthers;
  int displayTotal;

  factory Week.fromJson(Map<String, dynamic> json) => Week(
    fare: json["fare"],
    lodging: json["lodging"],
    boarding: json["boarding"],
    others: json["others"],
    total: json["total"],
    displayFare: json["display_fare"],
    displayLodging: json["display_lodging"],
    displayBoarding: json["display_boarding"],
    displayOthers: json["display_others"],
    displayTotal: json["display_total"],
  );

  Map<String, dynamic> toJson() => {
    "fare": fare,
    "lodging": lodging,
    "boarding": boarding,
    "others": others,
    "total": total,
    "display_fare": displayFare,
    "display_lodging": displayLodging,
    "display_boarding": displayBoarding,
    "display_others": displayOthers,
    "display_total": displayTotal,
  };
}

class User {
  User({
    required this.id,
    required this.companyId,
    required this.entityType,
    required this.userTypeId,
    required this.entityId,
    required this.username,
    required this.name,
    required this.mobileNumber,
    required this.email,
    required this.mailMobUpdate,
    required this.forcePasswordChange,
    required this.imei,
    required this.otp,
    required this.mpin,
    required this.profileImage,
    required this.deviceToken,
    this.rememberToken,
    this.lastLogin,
    this.lastLogout,
    required this.createdBy,
    required this.updatedBy,
    this.deletedBy,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.code,
    required this.outletId,
    required this.reportingToId,
    required this.gradeId,
    required this.designationId,
    required this.dateOfJoining,
    required this.aadharNo,
    required this.panNo,
    required this.selfApprove,
    required this.paymentModeId,
    required this.dataSource,
    required this.departmentId,
    required this.sbuId,
    required this.gender,
    required this.dateOfBirth,
  });

  int id;
  int companyId;
  int entityType;
  int userTypeId;
  int entityId;
  String username;
  String name;
  String mobileNumber;
  String email;
  int mailMobUpdate;
  int forcePasswordChange;
  String imei;
  String otp;
  String mpin;
  String profileImage;
  String deviceToken;
  dynamic rememberToken;
  dynamic lastLogin;
  dynamic lastLogout;
  int createdBy;
  int updatedBy;
  dynamic deletedBy;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  String code;
  int outletId;
  int reportingToId;
  int gradeId;
  int designationId;
  DateTime dateOfJoining;
  String aadharNo;
  String panNo;
  int selfApprove;
  int paymentModeId;
  int dataSource;
  int departmentId;
  int sbuId;
  String gender;
  DateTime dateOfBirth;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    companyId: json["company_id"],
    entityType: json["entity_type"],
    userTypeId: json["user_type_id"],
    entityId: json["entity_id"],
    username: json["username"],
    name: json["name"],
    mobileNumber: json["mobile_number"],
    email: json["email"],
    mailMobUpdate: json["mail_mob_update"],
    forcePasswordChange: json["force_password_change"],
    imei: json["imei"],
    otp: json["otp"],
    mpin: json["mpin"],
    profileImage: json["profile_image"],
    deviceToken: json["device_token"],
    rememberToken: json["remember_token"],
    lastLogin: json["last_login"],
    lastLogout: json["last_logout"],
    createdBy: json["created_by"],
    updatedBy: json["updated_by"],
    deletedBy: json["deleted_by"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
    code: json["code"],
    outletId: json["outlet_id"],
    reportingToId: json["reporting_to_id"],
    gradeId: json["grade_id"],
    designationId: json["designation_id"],
    dateOfJoining: DateTime.parse(json["date_of_joining"]),
    aadharNo: json["aadhar_no"],
    panNo: json["pan_no"],
    selfApprove: json["self_approve"],
    paymentModeId: json["payment_mode_id"],
    dataSource: json["data_source"],
    departmentId: json["department_id"],
    sbuId: json["sbu_id"],
    gender: json["gender"],
    dateOfBirth: DateTime.parse(json["date_of_birth"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "company_id": companyId,
    "entity_type": entityType,
    "user_type_id": userTypeId,
    "entity_id": entityId,
    "username": username,
    "name": name,
    "mobile_number": mobileNumber,
    "email": email,
    "mail_mob_update": mailMobUpdate,
    "force_password_change": forcePasswordChange,
    "imei": imei,
    "otp": otp,
    "mpin": mpin,
    "profile_image": profileImage,
    "device_token": deviceToken,
    "remember_token": rememberToken,
    "last_login": lastLogin,
    "last_logout": lastLogout,
    "created_by": createdBy,
    "updated_by": updatedBy,
    "deleted_by": deletedBy,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "deleted_at": deletedAt,
    "code": code,
    "outlet_id": outletId,
    "reporting_to_id": reportingToId,
    "grade_id": gradeId,
    "designation_id": designationId,
    "date_of_joining": "${dateOfJoining.year.toString().padLeft(4, '0')}-${dateOfJoining.month.toString().padLeft(2, '0')}-${dateOfJoining.day.toString().padLeft(2, '0')}",
    "aadhar_no": aadharNo,
    "pan_no": panNo,
    "self_approve": selfApprove,
    "payment_mode_id": paymentModeId,
    "data_source": dataSource,
    "department_id": departmentId,
    "sbu_id": sbuId,
    "gender": gender,
    "date_of_birth": "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
  };
}
