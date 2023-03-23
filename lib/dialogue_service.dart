import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'alert_request.dart';
import 'alert_response.dart';

class DialogService {
  final _dialogNavigationKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> get dialogNavigationKey => _dialogNavigationKey;
  Function(AlertRequest)? _showDialogListener;
  Function(AlertRequest)? _showCustomDialogListener;
  Function(AlertRequest)? _showConfirmationDialogListener;
  Function(AlertRequest)? _bottomSheetListener;
  Function(AlertRequest)? _showRemoveDialog;

  Completer<AlertResponse>? _dialogCompleter;

  void registerDialogListener(
      Function(AlertRequest) showDialogListener,
      Function(AlertRequest) showCustomDialogListener,
      Function(AlertRequest) showConfirmationDialogListener,
      Function(AlertRequest) bottomSheetListener,
      Function(AlertRequest) removeDialogListener) {
    _showDialogListener = showDialogListener;
    _showCustomDialogListener = showCustomDialogListener;
    _showConfirmationDialogListener = showConfirmationDialogListener;
    _showConfirmationDialogListener = showConfirmationDialogListener;
    _bottomSheetListener = bottomSheetListener;
    _showRemoveDialog = removeDialogListener;
  }

  Future<AlertResponse> showDialog({
    String title = 'Message',
    String? description,
    String buttonTitle = 'Done',
    bool dismissable = true,
    Function? func,
    Color? titleColor,
  }) {
    _dialogCompleter = Completer<AlertResponse>();
    _showDialogListener!(AlertRequest(
        description: description,
        buttonTitle: buttonTitle,
        title: title,
        dismissable: dismissable,
        function: func,
        titleColor: titleColor));

    return _dialogCompleter!.future;
  }

  Future<AlertResponse> showCustomAlertDialog(
      {String? image,
        String? title,
        String? subtitle,
        String primaryButton = 'OK',
        String? secondaryButton}) {
    _dialogCompleter = Completer<AlertResponse>();
    _showCustomDialogListener!(AlertRequest(
        image: image,
        description: subtitle,
        buttonTitle: primaryButton,
        secondaryButtonTitle: secondaryButton,
        title: title));

    return _dialogCompleter!.future;
  }

  Future<AlertResponse> showConfirmationAlertDialog(
      {String? image,
        String? title,
        String? subtitle,
        String primaryButton = 'OK',
        String? secondaryButton,
        bool dismissable = true}) {
    _dialogCompleter = Completer<AlertResponse>();
    _showConfirmationDialogListener!(AlertRequest(
        image: image,
        description: subtitle,
        buttonTitle: primaryButton,
        secondaryButtonTitle: secondaryButton,
        title: title,
        dismissable: dismissable));

    return _dialogCompleter!.future;
  }

  Future<AlertResponse> showBottomSheet(
      {String? title,
        Widget? iconWidget,
        Widget? child,
        bool showActionBar = true,
        bool showCloseIcon = true,
        bool showSwipeIndicator = true,
        Color? indicatorColor,
        bool? isDismissable}) {
    _dialogCompleter = Completer<AlertResponse>();
    _bottomSheetListener!(AlertRequest(
        title: title,
        iconWidget: iconWidget,
        contentWidget: child,
        showActionBar: showActionBar,
        showCloseIcon: showCloseIcon,
        showSwipeIndicator: showSwipeIndicator,
        indicatorColor: indicatorColor,
        dismissable: isDismissable));

    return _dialogCompleter!.future;
  }

  // showToast(String message,{ToastGravity gravity}){
  //   Fluttertoast.showToast(
  //       msg: message,
  //       toastLength: Toast.LENGTH_SHORT,
  //       gravity: gravity == null ? ToastGravity.BOTTOM : gravity,
  //       timeInSecForIosWeb: 1,
  //       backgroundColor: Colors.black54,
  //       textColor: Colors.white,
  //       fontSize: 14.0
  //   );
  // }

  void dialogComplete(AlertResponse? alertResponse) {
    _dialogCompleter!.complete(alertResponse);
    _dialogNavigationKey.currentState!.pop(alertResponse);
    _dialogCompleter = null;
  }

  Future<AlertResponse> showContentDialog(
      {Widget? widget,
        bool dismissable = true,
        AlignmentGeometry alignment = Alignment.topCenter,
        EdgeInsets padding =
        const EdgeInsets.only(left: 20, right: 20, top: 22, bottom: 20),
        BorderRadius? borderRadius}) {
    _dialogCompleter = Completer<AlertResponse>();
    _showRemoveDialog!(AlertRequest(
        contentWidget: widget,
        dismissable: dismissable,
        alignment: alignment,
        padding: padding,
        bottomRadius: borderRadius));
    return _dialogCompleter!.future;
  }
}
