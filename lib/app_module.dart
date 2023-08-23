import 'package:dio/dio.dart';
import 'package:estudo_auth/src/shared/core/abstractions/auth/authorization.dart';
import 'package:estudo_auth/src/shared/core/abstractions/local_storage/secure_storage.dart';
import 'package:estudo_auth/src/shared/core/abstractions/local_storage/secure_storage_impl.dart';
import 'package:flutter/material.dart';
import 'package:estudo_auth/src/shared/core/abstractions/client_http/cliente_http.dart';
import 'package:estudo_auth/src/shared/core/abstractions/client_http/cliente_http_impl.dart';
import 'package:estudo_auth/src/shared/core/abstractions/network_settings/network_settings.dart';
import 'package:estudo_auth/src/shared/core/environment/routers/routers.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

class AppModule extends StatefulWidget {
  final String env;
  final String envLaunch;
  final String baseUrl;
  final String prefixo;

  AppModule({
    super.key,
    required this.env,
    required this.envLaunch,
    required this.baseUrl,
    required this.prefixo,
  }) {
    GetIt.I.registerSingleton<NetworkSettings>(
      _networkSettings(
        envLaunch.isEmpty ? env : envLaunch,
      ),
    );

    GetIt.I.registerSingleton<SecureStorage>(
      SecureStorageImpl(
        const FlutterSecureStorage(
          aOptions: AndroidOptions(
            encryptedSharedPreferences: true,
          ),
        ),
      ),
    );
    GetIt.I.registerSingleton<AuthotorizationImpl>(
      AuthotorizationImpl(GetIt.I.get<SecureStorage>()),
    );
    GetIt.I.registerSingleton<ClientHttp>(
      ClienteHttpImpl(
        clienteHttp: Dio(),
        baseUrl: baseUrl,
        prefixo: prefixo,
      ),
    );
  }

  NetworkSettings _networkSettings(String? env) {
    switch (env) {
      case 'hml':
        return HmlSettingsNetwork();

      default:
        return DevSettingsNetwork();
    }
  }

  @override
  State<AppModule> createState() => _AppModuleState();
}

class _AppModuleState extends State<AppModule> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Estudo Auth",
      routes: routers,
      initialRoute: '/boas_vindas',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [Locale('pt', 'BR')],
    );
  }

  @override
  void dispose() {
    GetIt.I.unregister<ClientHttp>();
    GetIt.I.unregister<NetworkSettings>();
    super.dispose();
  }
}
