import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';

class VoucherCardWidget extends StatelessWidget {
  const VoucherCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.27,
      height: 190,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: Constants.lightGreenGradient,
      ),
      child: Column(
        children: [
          SvgPicture.asset('assets/images/logo.svg', width: 40),
          const SizedBox(height: 10),
          Text(
            'Alimentação',
            style: Theme.of(context)
                .textTheme
                .bodyText2
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 10),
          Text(
            'R\$ 500,00',
            style: Theme.of(context).textTheme.headline4?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                ),
          ),
          const SizedBox(height: 5),
          Text(
            'Pague apenas R\$ 5,00',
            style: Theme.of(context)
                .textTheme
                .headline4
                ?.copyWith(fontWeight: FontWeight.w300, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
