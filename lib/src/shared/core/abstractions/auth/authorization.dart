import 'package:estudo_auth/src/shared/core/abstractions/local_storage/key_type.dart';
import 'package:estudo_auth/src/shared/core/abstractions/local_storage/secure_storage.dart';
import 'package:estudo_auth/src/shared/helpers/debug_print/debug_print.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthotorizationImpl {
  late SecureStorage _storage;

  static AuthotorizationImpl? _instance;

  AuthotorizationImpl._singleton(this._storage);

  factory AuthotorizationImpl(SecureStorage _storage) {
    if (_instance == null) {
      return _instance = AuthotorizationImpl._singleton(_storage);
    } else {
      return _instance!;
    }
  }
  Future<bool> loginWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignIn = await GoogleSignIn(
        clientId: 'clientID',
        serverClientId: 'serverClientId',
      ).signIn();
      googleSignIn;
      final authentication = await googleSignIn?.authentication;
      _storage.save(
        key: KeyType.accesstoken,
        value: authentication?.accessToken ?? '',
      );

      return _storage.exist(KeyType.accesstoken);
    } catch (e) {
      debugPrintHelper(e.toString());
      return false;
    }
  }

  Future<bool> login(String token) async {
    try {
      _storage.save(
        key: KeyType.accesstoken,
        value: token,
      );
      return true;
    } catch (e) {
      debugPrintHelper(e.toString());
      return false;
    }
  }

  Future<bool> logOut() async {
    try {
      await _storage.remove(
        KeyType.accesstoken,
      );
      return true;
    } catch (e) {
      debugPrintHelper(e.toString());
      return false;
    }
  }

  Future<bool> logedIn() async {
    try {
      if (await _storage.exist(KeyType.accesstoken)) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      debugPrintHelper(e.toString());
      return false;
    }
  }
  // Future<String> refreshTokenGoogle() async {
  //   final GoogleSignInAccount? googleSignIn = await GoogleSignIn().signInSilently();
  //   final GoogleSignInAuthentication googleSignInAuthentication = GoogleAuthProvider
  // }
}
