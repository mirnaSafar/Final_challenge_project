import 'package:flutter_templete/core/enums/request_type.dart';

import '../../../ui/shared/utils.dart';

//ملف الاعدادادتى لكامل ال api
class NetworkConfig {
  static String BASE_API = 'api/';
  static String getFullApiRoute(String apiroute) {
    return BASE_API + apiroute;
  }

  static Map<String, String>? getHeaders(
      {bool needAuth = true,
      RequestType? type,
      Map<String, String>? extraHeaders}) {
    return {
      if (needAuth)
        "Authorization":
            "Bearer ${storage.getTokenInfo()?.accessToken ?? 'Bearer 2|BR11Tn2IY8Uvg5rzn54fJkHypIoFQhGLmRDKFjrc'}",
      if (type != RequestType.GET)
        "Content-Type": 'application/x-www-form-urlencoded',
      //  type == RequestType.MULTIPART
      //      "multipart/form-data":
      ...extraHeaders ?? {}
    };
  }
}
