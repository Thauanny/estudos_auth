import 'package:aad_oauth/model/config.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

Config configAadOAuth({required Widget loadingWidget}) {
  return Config(
    tenant: "YOUR_TENANT_ID",
    clientId: "YOUR_CLIENT_ID",
    scope: "openid profile offline_access",
    redirectUri: '/home',
    navigatorKey: GetIt.I.get<GlobalKey<NavigatorState>>(),
    webUseRedirect:
        true, // default is false - on web only, forces a redirect flow instead of popup auth
    loader: loadingWidget, //optional
  );
}
