import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:elevate_online_exam/core/languages/locale_keys.g.dart';

class ParsingHelper {
  static Map<String, dynamic> parseErrorResponse(dynamic response) {
  if (response is Map<String, dynamic>) return response;
  if (response is String) {
    try {
      return jsonDecode(response) as Map<String, dynamic>;
    } catch (_) {
      return {'message': response};
    }
  }
  return {'message': LocaleKeys.error_api_failure_unknown.tr()};
}
}