import 'package:estudo_auth/src/shared/core/abstractions/auth/key_type.dart';
import 'package:estudo_auth/src/shared/core/abstractions/auth/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class BoasVindasPage extends StatefulWidget {
  const BoasVindasPage({super.key});

  @override
  State<BoasVindasPage> createState() => _BoasVindasPageState();
}

class _BoasVindasPageState extends State<BoasVindasPage> {
  late final SecureStorage localStorage;
  @override
  void initState() {
    super.initState();
    localStorage = GetIt.I.get<SecureStorage>();
    localStorage.exist(KeyType.accesstoken).then((value) {
      if (value) {
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        Navigator.pushReplacementNamed(context, '/login');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
