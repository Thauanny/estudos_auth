import 'package:estudo_auth/src/shared/core/abstractions/auth/key_type.dart';
import 'package:estudo_auth/src/shared/core/abstractions/auth/secure_storage.dart';
import 'package:estudo_auth/src/shared/core/environment/routers/restore_route.dart';
import 'package:flutter/material.dart';
import 'package:estudo_auth/src/modules/home/domain/repository/home_repository.dart';
import 'package:estudo_auth/src/modules/home/home_module.dart';
import 'package:get_it/get_it.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends HomeModule<MyHomePage> {
  late final HomeRepository homeRepository;
  late final SecureStorage localStorage;
  @override
  void initState() {
    super.initState();
    homeRepository = GetIt.I.get<HomeRepository>();
    localStorage = GetIt.I.get<SecureStorage>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: const Scaffold(
        body: Center(
          child: Text('Home'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          localStorage.remove(KeyType.accesstoken);
          restoreRoute(context: context, initialRouteName: '/boas_vindas');
        },
        tooltip: 'Deslogar',
        child: const Icon(Icons.logout_outlined),
      ),
    );
  }
}
