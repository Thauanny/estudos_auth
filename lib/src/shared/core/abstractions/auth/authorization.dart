import 'package:flutter/material.dart';

abstract class Authotorization {
  Future<bool> loginWithGoogle();

  Future<bool> login(String token);

  Future<bool> loginWithSSO({
    required Widget loadingWidget,
  });

  Future<void> logOutSSO();

  Future<bool> logOut();

  Future<bool> logedIn();

  // Future<String> refreshTokenGoogle() ;
}
