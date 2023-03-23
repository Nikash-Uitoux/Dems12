import 'package:flutter/cupertino.dart';

class AlertRequest {
  final String? image;
  final String? title;
  final String? description;
  final String? buttonTitle;
  final String? secondaryButtonTitle;
  final bool? dismissable;
  final bool? showSwipeIndicator;
  final AlignmentGeometry? alignment;
  final EdgeInsets? padding;
  final BorderRadius? bottomRadius;

  final Widget? iconWidget;
  final Widget? contentWidget;
  final bool? showActionBar;
  final bool? showCloseIcon;
  Function? function;
  Color? titleColor;
  Color? indicatorColor;

  AlertRequest(
      {this.image,
        this.title,
        this.description,
        this.buttonTitle,
        this.secondaryButtonTitle,
        this.dismissable,
        this.iconWidget,
        this.showSwipeIndicator,
        this.contentWidget,
        this.alignment,
        this.padding,
        this.showActionBar,
        this.bottomRadius,
        this.showCloseIcon,
        this.function,
        this.indicatorColor,
        this.titleColor});
}
