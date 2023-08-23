import 'package:estudo_auth/src/shared/core/abstractions/auth/authorization.dart';
import 'package:estudo_auth/src/shared/helpers/extensions/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();
    final auth = GetIt.I.get<AuthotorizationImpl>();

    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  auth.login(
                    'akjdkasjdasdsd_asd.asdajsdhgasdgahsdgasdsd_asdjashdjsdsd.asdhgakjshgdahsdgasd_asdasdgsh',
                  );

                  Navigator.pushReplacementNamed(context, '/home');
                }
              },
              child: const Text('Login'),
            ),
            ElevatedButton(
              onPressed: () {
                auth.loginWithGoogle().then((value) {
                  if (value) {
                    Navigator.pushReplacementNamed(context, '/home');
                  }
                });
              },
              child: Text('Login with Google'),
            ),
          ],
        ),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Email'),
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (email) {
                    if (email != null && email.isEmailValido()) {
                      return null;
                    } else {
                      return 'Digite um email válido';
                    }
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Password'),
                  controller: _passwordController,
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  validator: (senha) {
                    if (senha == null || senha.isEmpty) {
                      return 'Digite uma senha valida';
                    } else if (senha.length < 6) {
                      return 'Senha muito pequena';
                    } else {
                      return null;
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
