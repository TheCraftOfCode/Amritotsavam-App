import 'package:amritotsavam_app/utils/constants.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const storage = FlutterSecureStorage();

Future<String> get jwtToken async {
  var jwt = await storage.read(key: storageJWTKey);
  if (jwt == null) return "";
  return jwt;
}
