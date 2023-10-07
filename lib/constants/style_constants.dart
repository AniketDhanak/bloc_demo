import 'package:bloc_demo_api/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'font_constants.dart';

class StyleConstants {

  //style used in app for responsive

  static h128PxStyleBold({required Color color, double letterSpacing = 0.0}) {
    return TextStyle(
        fontFamily: FontConstants.bold,
        fontWeight: FontWeight.w600,
        fontSize: 4.19 * SizeConfig.textMultiplier,
        letterSpacing: letterSpacing,
        color: color);
  }

  static h128PxStyleMedium({required Color color, double letterSpacing = 0.0}) {
    return TextStyle(
        fontFamily: FontConstants.medium,
        fontSize: 4.19 * SizeConfig.textMultiplier,
        letterSpacing: letterSpacing,
        color: color);
  }

  static h128PxStyleRegular(
      {required Color color, double letterSpacing = 0.0}) {
    return TextStyle(
        fontFamily: FontConstants.regular,
        fontSize: 4.19 * SizeConfig.textMultiplier,
        letterSpacing: letterSpacing,
        color: color);
  }

  static h224PxStyleBold({required Color color}) {
    return TextStyle(
        fontFamily: FontConstants.bold,
        fontSize: 3.59 * SizeConfig.textMultiplier,
        letterSpacing: 0.0,
        color: color);
  }

  static h224PxStyleMedium({required Color color, double letterSpacing = 0.0}) {
    return TextStyle(
        fontFamily: FontConstants.medium,
        fontSize: 3.59 * SizeConfig.textMultiplier,
        letterSpacing: 0.0,
        color: color);
  }

  static h224PxStyleRegular(
      {required Color color, double letterSpacing = 0.0}) {
    return TextStyle(
        fontFamily: FontConstants.regular,
        fontSize: 3.59 * SizeConfig.textMultiplier,
        letterSpacing: 0.0,
        color: color);
  }

  static h320PxStyleBold({required Color color}) {
    return TextStyle(
        fontFamily: FontConstants.bold,
        fontSize: 2.99 * SizeConfig.textMultiplier,
        //fontSize: 20.0,
        letterSpacing: 0.0,
        color: color);
  }

  static h320PxStyleMedium({required Color color}) {
    return TextStyle(
        fontFamily: FontConstants.medium,
        fontSize: 2.99 * SizeConfig.textMultiplier,
        letterSpacing: 0.0,
        color: color);
  }

  static h320PxStyleRegular({required Color color}) {
    return TextStyle(
        fontFamily: FontConstants.regular,
        fontSize: 2.99 * SizeConfig.textMultiplier,
        letterSpacing: 0.0,
        color: color);
  }

  static h818PxStyleBold({required Color color}) {
    return TextStyle(
        fontFamily: FontConstants.bold,
        fontWeight: FontWeight.bold,
        fontSize: 2.39 * SizeConfig.textMultiplier,
        letterSpacing: 0.0,
        color: color);
  }

  static h818PxStyleMedium({required Color color, double letterSpacing = 0.0}) {
    return TextStyle(
        fontFamily: FontConstants.medium,
        fontSize: 2.39 * SizeConfig.textMultiplier,
        letterSpacing: 0.0,
        color: color);
  }

  static h818PxStyleRegular(
      {required Color color, double letterSpacing = 0.0}) {
    return TextStyle(
        fontFamily: FontConstants.regular,
        fontSize: 2.39 * SizeConfig.textMultiplier,
        letterSpacing: 0.0,
        color: color);
  }

  static h818PxStyleRegularWithoutSpacing(
      {required Color color, double letterSpacing = 0.0}) {
    return TextStyle(
        fontFamily: FontConstants.regular,
        fontSize: 2.39 * SizeConfig.textMultiplier,
        letterSpacing: 0.0,
        color: color);
  }

  static h416PxStyleBold({required Color color}) {
    return TextStyle(
        fontFamily: FontConstants.bold,
        fontWeight: FontWeight.bold,
        fontSize: 2.39 * SizeConfig.textMultiplier,
        letterSpacing: 0.0,
        color: color);
  }

  static h416PxStyleMedium({required Color color, double letterSpacing = 0.0}) {
    return TextStyle(
        fontFamily: FontConstants.medium,
        fontSize: 2.39 * SizeConfig.textMultiplier,
        letterSpacing: 0.0,
        color: color);
  }

  static h416PxStyleRegular(
      {required Color color, double letterSpacing = 0.0}) {
    return TextStyle(
        fontFamily: FontConstants.regular,
        fontSize: 2.39 * SizeConfig.textMultiplier,
        letterSpacing: 0.0,
        color: color);
  }

  static h514PxStyleBold({required Color color}) {
    return TextStyle(
        fontFamily: FontConstants.bold,
        fontWeight: FontWeight.bold,
        fontSize: 2.09 * SizeConfig.textMultiplier,
        letterSpacing: 0.0,
        color: color);
  }

  static h514PxStyleMedium({required Color color, double letterSpacing = 0.0}) {
    return TextStyle(
        fontFamily: FontConstants.medium,
        fontWeight: FontWeight.w500,
        fontSize: 2.09 * SizeConfig.textMultiplier,
        letterSpacing: 0.0,
        color: color);
  }

  static h514PxStyleRegular(
      {required Color color, double letterSpacing = 0.0}) {
    return TextStyle(
        fontFamily: FontConstants.regular,
        fontSize: 2.09 * SizeConfig.textMultiplier,
        letterSpacing: 0.0,
        color: color);
  }

  static h612PxStyleBold({required Color color}) {
    return TextStyle(
        fontFamily: FontConstants.bold,
        fontSize: 1.79 * SizeConfig.textMultiplier,
        letterSpacing: 1.14,
        color: color);
  }

  static h612PxStyleMedium({required Color color, double letterSpacing = 0.0}) {
    return TextStyle(
        fontFamily: FontConstants.medium,
        fontSize: 1.79 * SizeConfig.textMultiplier,
        letterSpacing: 0.0,
        color: color);
  }

  static h612PxStyleRegular(
      {required Color color, double letterSpacing = 0.0}) {
    return TextStyle(
        fontFamily: FontConstants.regular,
        fontSize: 1.79 * SizeConfig.textMultiplier,
        letterSpacing: 0.0,
        color: color);
  }

  static h710PxStyleBold({required Color color}) {
    return TextStyle(
        fontFamily: FontConstants.bold,
        fontSize: 1.49 * SizeConfig.textMultiplier,
        letterSpacing: 0.0,
        color: color);
  }

  static h710PxStyleMedium({required Color color}) {
    return TextStyle(
        fontFamily: FontConstants.medium,
        fontSize: 1.49 * SizeConfig.textMultiplier,
        letterSpacing: 0.0,
        color: color);
  }

  static h710PxStyleRegular({required Color color}) {
    return TextStyle(
        fontFamily: FontConstants.regular,
        fontSize: 1.49 * SizeConfig.textMultiplier,
        letterSpacing: 0.0,
        color: color);
  }

  static h710PxStyleRegularWithoutSpacing({required Color color}) {
    return TextStyle(
        fontFamily: FontConstants.regular,
        fontSize: 1.49 * SizeConfig.textMultiplier,
        letterSpacing: 0.0,
        color: color);
  }

  static h86PxStyleMedium({required Color color}) {
    return TextStyle(
        fontFamily: FontConstants.medium,
        fontSize: 0.89 * SizeConfig.textMultiplier,
        letterSpacing: 0.0,
        color: color);
  }

  static h98PxStyleRegular({required Color color}) {
    return TextStyle(
        fontFamily: FontConstants.regular,
        fontSize: 1.19 * SizeConfig.textMultiplier,
        letterSpacing: 0.0,
        color: color);
  }

  static textFieldBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(10.0),
    );
  }

  static buttonStyle() {
    return ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)));
  }
  final  buttonHeight = 7* SizeConfig.heightMultiplier;
  final  buttonWidth = 90* SizeConfig.widthMultiplier;

  static textFieldBorderForms(){
    return  OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.0),
    );
  }
}
