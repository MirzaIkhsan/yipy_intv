import 'package:intl/intl.dart';

extension PriceExt on int {
  String get toIDR => formatCurrency(symbol: 'Rp');

  String formatCurrency({String? symbol}) {
    return NumberFormat.currency(
      locale: 'id',
      symbol: symbol ?? '',
      decimalDigits: 0,
    ).format(this);
  }
}
