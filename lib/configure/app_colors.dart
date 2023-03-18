import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors{
  static const primaryColor                = Colors.white;
  static const secondaryColor              = Colors.black;
  static const backgroundColor             = Colors.white;
  static const secondaryBackgroundColor    = Colors.black;
  static const iconColor                   = Color(0xFF18181B);
  static var shadowColor                   = Colors.grey.shade200;
  static const appBarColor                 = Colors.white;
  static const redColor                    = Colors.redAccent;
  static const blueColor                   = Colors.blueAccent;
  static const greyColor                   = Color(0xFF8a9694);
  static const textColor                   = Colors.black;
  static const secondaryTextColor          = Colors.white;
  static const primaryTextColor            = Colors.black;
  static const grayLight                   = Color(0xFF8b97a2);
  static const whiteColor                  = Colors.white;
  static const blackColor                  = Colors.black;
  static final gradientColor               = [primaryColor, secondaryColor];
}

class AppStyle{
  static const titleText          = TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: AppColors.textColor);
  static const timingText         = TextStyle(color: Colors.white);
  static const appTitle           = 'Taksi Pro';
  static const splashTitle        = 'TAKSI PRO';
  static const checkOutStyle      = TextStyle(fontWeight: FontWeight.w600, fontSize: 15);
  static const checkOutTextStyle  = TextStyle(fontWeight: FontWeight.w300, fontSize: 16, color: AppColors.textColor);
  static const title1             = TextStyle(fontWeight: FontWeight.bold, fontSize: 28, color: AppColors.textColor);
  static const title2             = TextStyle(fontWeight: FontWeight.bold, fontSize: 28, color: AppColors.primaryTextColor);
  static const title3             = TextStyle(fontWeight: FontWeight.w600, fontSize: 20, color: AppColors.textColor);
  static const title3Override     = TextStyle(fontWeight: FontWeight.w400, fontSize: 18, color: AppColors.textColor);
  static const namazText          = TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: AppColors.textColor);
  static const title1Override     = TextStyle(fontWeight: FontWeight.w200, fontSize: 16, color: AppColors.greyColor);
  static const bodyText1          = TextStyle(fontWeight: FontWeight.w400, fontSize: 18, color: Colors.black);
  static const bodyText2          = TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.white);
  static const bodyText1Override  = TextStyle(fontWeight: FontWeight.w200, fontSize: 14, color: AppColors.textColor, letterSpacing: 1);
  static const splashTitleStyle   = TextStyle(fontWeight: FontWeight.w100, fontSize: 28, color: AppColors.secondaryTextColor, letterSpacing: 10);
}

class AppSize{
  static const borderRadiusSize = 8.00;
}