import 'package:estudo_auth/src/shared/core/abstractions/auth/authorization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class BoasVindasPage extends StatefulWidget {
  const BoasVindasPage({super.key});

  @override
  State<BoasVindasPage> createState() => _BoasVindasPageState();
}

class _BoasVindasPageState extends State<BoasVindasPage> {
  late final AuthotorizationImpl auth;
  @override
  void initState() {
    super.initState();
    auth = GetIt.I.get<AuthotorizationImpl>();
    auth.logedIn().then((value) {
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
