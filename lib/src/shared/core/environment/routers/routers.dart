import 'package:estudo_auth/src/modules/boas_vindas/boas_vindas_page.dart';
import 'package:estudo_auth/src/modules/home/presentation/pages/home_page.dart';
import 'package:estudo_auth/src/modules/login/login_page.dart';

final routers = {
  '/home': (context) => const MyHomePage(),
  '/boas_vindas': (context) => const BoasVindasPage(),
  '/login': (context) => const LoginPage()
};
