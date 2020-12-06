import 'package:flutter/services.dart';
import 'contact_picker_platform_interface.dart';

import 'email_contact.dart';
import 'full_contact/full_contact.dart';
import 'phone_contact.dart';

const MethodChannel _channel = const MethodChannel('me.schlaubi.contactpicker');

class MethodChannelContactPicker extends ContactPickerPlatform {
  @override
  Future<PhoneContact> pickPhoneContact({bool askForPermission = true}) async =>
      PhoneContact.fromMap(await _channel.invokeMethod<Map<dynamic, dynamic>>(
          'pickPhoneContact', {'askForPermission': askForPermission}));

  @override
  Future<EmailContact> pickEmailContact({bool askForPermission = true}) async =>
      EmailContact.fromMap(await _channel.invokeMethod<Map<dynamic, dynamic>>(
          'pickEmailContact', {'askForPermission': askForPermission}));

  @override
  Future<FullContact> pickContact(
      {bool askForPermission = true}) async =>
      pickFullContact(askForPermission: askForPermission);

  @override
  Future<FullContact> pickFullContact(
      {bool askForPermission = true}) async =>
      FullContact.fromMap(await _channel.invokeMethod<Map<dynamic, dynamic>>(
          'pickContact', {'askForPermission': askForPermission}));

  @override
  Future<bool> hasPermission() async =>
      _channel.invokeMethod('hasPermission');

  @override
  Future<bool> requestPermission({bool force = false}) async {
    if (!force) {
      var granted = await hasPermission();
      if (granted) return true;
    }
    return await _channel.invokeMethod('requestPermission');
  }
}
