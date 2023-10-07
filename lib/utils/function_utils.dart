import 'package:bloc_demo_api/constants/database_keys.dart';
import 'package:bloc_demo_api/database/dao/session_dao.dart';
import 'package:bloc_demo_api/utils/string_utils.dart';

class FunctionalUtils {
  static Future<String> getSessionKey() async {
    String sessionKey = StringUtils.empty;
    var idObj = await SessionDAO().getValueForKey(DatabaseKeys.sessionKey);
    if (idObj != null) {
      sessionKey = idObj.value;
    }
    return sessionKey;
  }

  static Future<String> getValueByKey(String key) async {
    String sessionKey = StringUtils.empty;
    var idObj = await SessionDAO().getValueForKey(key);
    if (idObj != null) {
      sessionKey = idObj.value;
    }
    return sessionKey;
  }

  static Future<String> clearDb() async {
    SessionDAO().clearSessionData();
    return StringUtils.empty;
  }
}
