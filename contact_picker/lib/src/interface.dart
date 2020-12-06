import 'dart:async';

import 'package:contact_picker_platform_interface/contact_picker_platform_interface.dart';
import 'package:contact_picker_platform_interface/email_contact.dart';
import 'package:contact_picker_platform_interface/full_contact/full_contact.dart';
import 'package:contact_picker_platform_interface/phone_contact.dart';

///Plugin to interact with contact Pickers
class FlutterContactPicker {
  ///Picks a Phone contact
  ///Automatically checks for permission if [askForPermission] is true
  ///Requires [hasPermission] on Android 11+
  static Future<PhoneContact> pickPhoneContact(
          {bool askForPermission = true}) async => ContactPickerPlatform.instance.pickPhoneContact(askForPermission: askForPermission);

  ///Picks an Email contact
  ///Automatically checks for permission if [askForPermission] is true
  ///Requires [hasPermission] on Android 11+
  static Future<EmailContact> pickEmailContact(
          {bool askForPermission = true}) async => ContactPickerPlatform.instance.pickEmailContact(askForPermission: askForPermission);

  ///Picks a full contact
  ///Automatically checks for permission if [askForPermission] is true
  ///Always requires [hasPermission] to return true
  /// Currently Android only because iOS does not provide api to select whole contact
  @Deprecated(
      'Name is misleading as this returns a FullContact and not a contact. Use pickFullContact instead.')
  static Future<FullContact> pickContact(
          {bool askForPermission = true}) async => ContactPickerPlatform.instance.pickContact(askForPermission: askForPermission);

  ///Picks a full contact
  ///Automatically checks for permission if [askForPermission] is true
  ///Always requires [hasPermission] to return true
  /// Currently Android only because iOS does not provide api to select whole contact
  static Future<FullContact> pickFullContact(
          {bool askForPermission = true}) async => ContactPickerPlatform.instance.pickFullContact(askForPermission: askForPermission);

  /// Checks if the contact permission is already granted
  static Future<bool> hasPermission() async => ContactPickerPlatform.instance.hasPermission();

  /// Checks if the permission is already granted and requests if it is not or [force] is true
  static Future<bool> requestPermission({bool force = false}) async => ContactPickerPlatform.instance.requestPermission(force: force);
}
