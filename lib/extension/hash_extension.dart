// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:crypto/crypto.dart';


/// Add hash functionality to our String id
extension HashStringExtension on String {

  /// Returns the SHA256 hash of this [String]
  String get hashValue {
    return sha256.convert(utf8.encode(this)).toString();
  }
}
