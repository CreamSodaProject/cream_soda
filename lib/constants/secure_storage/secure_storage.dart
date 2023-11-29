import 'package:cream_soda/constants/secure_storage/secure_storage_enum.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static const _storage = FlutterSecureStorage();

  static void setKey(SecureStorageEnum enums, String value) {
    _storage.write(key: enums.name, value: value);
  }

  static Future<String?> get(SecureStorageEnum enums) async{
    return _storage.read(key: enums.name);
  }

  static Future<void> deleteKey (SecureStorageEnum enums) async{
    await _storage.delete(key: enums.name);
  }

  static Future<void> clear () async{
    await _storage.deleteAll();
  }
}