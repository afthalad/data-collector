import 'package:uuid/uuid.dart';
import '../../../core/utils/helpers/app_preferences.dart';

class IdSaver {
  static idSaver() {
    var id = const Uuid().v4().toString();
    var existId = AppPreferences.getString("id");

    if (existId == null) {
      String newId = AppPreferences.setString("id", id);
      return newId;
    }
    return existId;
  }
}
