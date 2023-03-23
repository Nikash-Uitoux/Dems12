import 'dart:core';
import 'dart:core';
class Constants {
  static int? travelAttachViewed = 0;
  static int? lodgingAttachViewed=0;
  static int? boardingAttachViewed=0;
  static int? proofAttachViewed=0;
  static int? localClaimViewed=0;

  static int? claimAttachCount=0;


  static int? initialIndex=0;
  static int? claimTabLength=0;
  static String? TripListType="Pending";
  static String? ClaimListType="Claims Completed";
  static String? notificationType="All";
  static String? start_departDM;
  static String? start_departWY;
  static String? dash_tripApprovals_status="Pending";
  static String? dash_claimApprovals_status="Claims Approval Pending";


//  single_trip =0;
//  round_trip =1;
// multi_trip =2;
  static int trip_type = 0;

  static int multi_city_count = 1;

  static bool isShowingBottomSheet = false;

  static DateTime? pickedStartDate;
  static DateTime? pickedEndDate;

  static int edit_tripMode=0;
  static int pages=0;
  static int current_pages=0;

  static String triptype="One-Way";
  static int getformData=0;

  static String? tripID;

  static String? bearerToken;

}
