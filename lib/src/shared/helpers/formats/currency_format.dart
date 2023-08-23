import 'package:intl/intl.dart';

String currencyFormat(double value) =>
    NumberFormat.currency(locale: 'pt_BR', symbol: r'R$').format(value);
