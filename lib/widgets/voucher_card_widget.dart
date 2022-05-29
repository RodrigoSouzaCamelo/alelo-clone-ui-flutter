import 'package:alelo_clone_ui_flutter/models/voucher_card_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';

class VoucherCardWidget extends StatelessWidget {
  final VoucherCardModel card;

  const VoucherCardWidget({
    required this.card,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.27,
      height: 190,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: _getGradientByVoucherType(),
      ),
      child: Column(
        children: [
          SvgPicture.asset('assets/images/logo.svg', width: 40),
          const SizedBox(height: 10),
          Text(
            card.voucherType.description,
            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: _getTextColorByVoucherType(),
                ),
          ),
          const SizedBox(height: 10),
          Text(
            card.cardNumberHidden,
            style: Theme.of(context).textTheme.headline4?.copyWith(
                  fontWeight: FontWeight.w300,
                  fontSize: 14,
                  color: _getTextColorByVoucherType(),
                ),
          ),
          const SizedBox(height: 10),
          Text(
            card.availableCreditFormatted,
            style: Theme.of(context).textTheme.headline4?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: _getTextColorByVoucherType(),
                ),
          ),
          const SizedBox(height: 5),
          Text(
            'Gaste até ${card.dailySpendTheEndOfMonthFormatted} hoje',
            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                  color: _getTextColorByVoucherType(),
                ),
          ),
        ],
      ),
    );
  }

  Gradient _getGradientByVoucherType() {
    switch (card.voucherType) {
      case VoucherType.FOOD:
        return Constants.darkGreenGradient;
      case VoucherType.MEAL:
        return Constants.lightGreenGradient;
      default:
        break;
    }

    return Constants.lightGreenGradient;
  }

  Color _getTextColorByVoucherType() {
    switch (card.voucherType) {
      case VoucherType.FOOD:
        return Colors.white;
      case VoucherType.MEAL:
        return Constants.darkGreen;
      default:
        break;
    }

    return Colors.white;
  }
}
