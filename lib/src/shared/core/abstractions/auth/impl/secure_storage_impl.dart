import 'package:estudo_auth/src/shared/core/abstractions/auth/key_type.dart';
import 'package:estudo_auth/src/shared/core/abstractions/auth/secure_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageImpl implements SecureStorage {
  late FlutterSecureStorage _storage;

  static SecureStorageImpl? _instance;

  SecureStorageImpl._singleton(this._storage);

  factory SecureStorageImpl(FlutterSecureStorage _storage) {
    if (_instance == null) {
      return _instance = SecureStorageImpl._singleton(_storage);
    } else {
      return _instance!;
    }
  }
  @override
  Future<void> remove(KeyType key) async {
    await _storage.delete(key: key.name);
  }

  @override
  Future<void> save({required KeyType key, required String value}) async {
    return _storage.write(key: key.name, value: value);
  }

  @override
  Future<bool> exist(KeyType key) async {
    if ((await _storage.read(key: key.name))?.isNotEmpty ?? false) {
      return true;
    } else {
      return false;
    }
  }
}
