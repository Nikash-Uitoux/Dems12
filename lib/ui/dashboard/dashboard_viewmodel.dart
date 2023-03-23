import 'package:dems1/core/model/dashboard_details_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'package:dems1/api_base_service.dart';

import '../../constants.dart';
import '../../locator.dart';

// class DashViewModel extends DashPage {
//
//   void navigateToTripList(String title,int type) {
//     SystemChrome.setSystemUIOverlayStyle(
//         SystemUiOverlayStyle());
//     if(type==1) {
//       if(title.toLowerCase() == "pending");
//         //Constants.initialIndex =0;
//       else if(title.toLowerCase() == "approved");
//         // Constants.initialIndex =1;
//        else if(title.toLowerCase() == "rejected");
//         //Constants.initialIndex =2;
//       else if(title.toLowerCase() == "completed");
//         //Constants.initialIndex =3;
//       else if(title.toLowerCase() == "cancelled");
//         //Constants.initialIndex =4;
//       var navigationService;
//       navigationService.pushNamed(Routes.trip_list,
//           arguments: {'title': title,
//             'role': "Employee"})!.then((value) {
//
//       });
//     }
//     else
//     {   var navigationService;
//    navigationService.pushNamed(Routes.claim_list,
//         arguments: {'title': title,
//           'role': "Employee"})!.then((value) {
//
//     });
//
//     }
//   }
//
//
//
//
// }
//
// class Routes {
//   static var trip_list;
//
//   static var claim_list;
// }
class DashViewModel extends BaseViewModel {
  int? trip_completed;
  int? trip_pending;
  int? trip_approved;
  int? trip_rejected;
  int? trip_cancelled;
  int? claim_rejected;
  bool changeColor = false;
  ScrollController? scrollController;
  //List<Upcommingtrip>? upcoming_trip_list;



  void navigateToTripList(String title,int type) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle());
    if (type == 1) {
      if (title.toLowerCase() == "pending")
        Constants.initialIndex = 0;
      else if (title.toLowerCase() == "approved")
        Constants.initialIndex = 1;
      else if (title.toLowerCase() == "rejected")
        Constants.initialIndex = 2;
      else if (title.toLowerCase() == "completed")
        Constants.initialIndex = 3;
      else if (title.toLowerCase() == "cancelled")
        Constants.initialIndex = 4;
      navigationService.pushNamed;
    }
  }
}