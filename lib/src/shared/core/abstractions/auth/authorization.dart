import 'package:aad_oauth/aad_oauth.dart';
import 'package:estudo_auth/src/shared/core/abstractions/auth/config_aad_o_auth.dart';
import 'package:estudo_auth/src/shared/core/abstractions/local_storage/key_type.dart';
import 'package:estudo_auth/src/shared/core/abstractions/local_storage/secure_storage.dart';
import 'package:estudo_auth/src/shared/helpers/debug_print/debug_print.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthotorizationImpl {
  late SecureStorage _storage;
  late AadOAuth? oauth;
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

  Future<bool> loginWithSSO({
    required Widget loadingWidget,
  }) async {
    try {
      final oauth = AadOAuth(configAadOAuth(loadingWidget: loadingWidget));
      final result = await oauth.login(refreshIfAvailable: true);
      result.fold(
        (failure) => throw Exception(failure.message),
        (token) => true,
      );
      String accessToken = await oauth.getAccessToken() ?? '';
      return accessToken.isNotEmpty;
    } catch (e) {
      debugPrintHelper(e.toString());
      return false;
    }
  }

  Future<void> logOutSSO() async {
    try {
      if (oauth != null) {
        await oauth?.logout();
      }
    } catch (e) {
      debugPrintHelper(e.toString());
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
