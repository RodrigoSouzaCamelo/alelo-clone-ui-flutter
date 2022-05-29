import 'package:alelo_clone_ui_flutter/constants.dart';
import 'package:alelo_clone_ui_flutter/widgets/voucher_card_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'models/voucher_card_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> {
  int _selectedCardIndex = 0;

  _setSelectedCardIdx(int idx) {
    setState(() => _selectedCardIndex = idx);
  }

  List<VoucherCardModel> cardList = [
    VoucherCardModel(
      cardNumber: 5461456433124645,
      availableCredit: 890,
      voucherType: VoucherType.MEAL,
    ),
    VoucherCardModel(
      cardNumber: 4687912345647989,
      availableCredit: 1250.35,
      voucherType: VoucherType.FOOD,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Olá, Rodrigo', style: Theme.of(context).textTheme.headline4),
            const SizedBox(
              width: 10,
            ),
            Text(
              '=)',
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  ?.copyWith(color: Constants.purple, fontSize: 16),
            )
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          CarouselSlider(
            items: cardList.map((e) => VoucherCardWidget(card: e)).toList(),
            options: CarouselOptions(
                height: 190,
                enableInfiniteScroll: false,
                viewportFraction: .83,
                onPageChanged: (index, reason) => _setSelectedCardIdx(index)),
          ),
          const SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: (MediaQuery.of(context).size.width * .085) + 8,
            ),
            width: double.infinity,
            child: Text(
              '12/10 às 20:07h',
              textAlign: TextAlign.end,
              style: Theme.of(context).textTheme.bodyText2?.copyWith(
                    fontSize: 11,
                    color: Colors.grey,
                  ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: cardList.map((e) {
              int index = cardList.indexOf(e);

              return Container(
                width: 7,
                height: 7,
                margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: index == _selectedCardIndex
                      ? Colors.grey[600]
                      : Colors.grey[350],
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
