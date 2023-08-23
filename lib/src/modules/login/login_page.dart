import 'package:estudo_auth/src/shared/core/abstractions/auth/key_type.dart';
import 'package:estudo_auth/src/shared/core/abstractions/auth/secure_storage.dart';
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
    final localStorage = GetIt.I.get<SecureStorage>();

    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: ElevatedButton(
          onPressed: () {
            if (_formKey.currentState?.validate() ?? false) {
              localStorage.save(
                key: KeyType.accesstoken,
                value:
                    'asdh_jaskjdaksjdhasjd.ajsd_hajsdsadasd.asdasd_fasfsdsdd',
              );

              Navigator.pushReplacementNamed(context, '/home');
            }
          },
          child: const Text('Login'),
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
