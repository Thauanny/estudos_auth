import 'package:estudo_auth/src/shared/core/abstractions/auth/key_type.dart';

abstract class SecureStorage {
  Future<void> save({required KeyType key, required String value});
  Future<void> remove(KeyType key);
  Future<bool> exist(KeyType key);
}
