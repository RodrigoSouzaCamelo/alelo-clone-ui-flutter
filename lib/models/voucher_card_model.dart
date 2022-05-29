import 'package:flutter_money_formatter/flutter_money_formatter.dart';

enum VoucherType {
  MEAL,
  FOOD,
}

extension VoucherTypeExtension on VoucherType {
  String get description {
    switch (this) {
      case VoucherType.MEAL:
        return 'Refeição';
      case VoucherType.FOOD:
        return 'Alimentação';
      default:
        return '';
    }
  }
}

class VoucherCardModel {
  int cardNumber;
  double availableCredit;
  VoucherType voucherType;

  VoucherCardModel({
    required this.cardNumber,
    required this.availableCredit,
    required this.voucherType,
  });

  String get availableCreditFormatted => _formatToBrl(availableCredit);

  String get cardNumberHidden {
    final number = cardNumber.toString();

    return '•••• •••• •••• ${number.substring(number.length - 4)}';
  }

  String get dailySpendTheEndOfMonthFormatted {
    final now = DateTime.now();

    int lastDayOfMonth = DateTime(now.year, now.month + 1, 0).day;
    final diff = lastDayOfMonth - now.day;

    return _formatToBrl(availableCredit / diff);
  }

  String _formatToBrl(double amount) {
    return FlutterMoneyFormatter(
      amount: amount,
      settings: MoneyFormatterSettings(
        decimalSeparator: ',',
        thousandSeparator: '.',
        symbol: 'R\$',
        fractionDigits: 2,
        symbolAndNumberSeparator: ' ',
      ),
    ).output.symbolOnLeft;
  }
}
