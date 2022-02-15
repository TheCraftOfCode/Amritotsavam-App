import 'package:amritotsavam_app/utils/constants.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const storage = FlutterSecureStorage();


Future<String> get jwtTokenGet async {
  var jwt = await storage.read(key: storageJWTKey);
  print(jwt);
  if (jwt == null) return "";
  return jwt;
}

set jwtTokenSet(String jwt) {
  storage.write(key: storageJWTKey, value: jwt);
}
