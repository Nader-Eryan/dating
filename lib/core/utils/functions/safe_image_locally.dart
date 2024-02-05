import 'package:shared_preferences/shared_preferences.dart';

import '../service_locator.dart';

Future<void> safeImagelocally({required String path}) async {
  SharedPreferences prefs = await getIt.get<Future<SharedPreferences>>();
  prefs.setString('imagePath', path);
}
