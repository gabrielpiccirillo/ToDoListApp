import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class HiveService {
  static const String boxName = 'tasks';

  Future<void> init() async {
    if (kIsWeb) {
      await Hive.initFlutter();
    } else {
      final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
      await Hive.initFlutter(appDocumentDir.path);
    }
    await Hive.openBox(boxName);
  }

  Box getBox() {
    return Hive.box(boxName);
  }
}