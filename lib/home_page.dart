import 'package:alelo_clone_ui_flutter/constants.dart';
import 'package:alelo_clone_ui_flutter/widgets/voucher_card_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> {
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
        children: const <Widget>[
          VoucherCardWidget(),
        ],
      ),
    );
  }
}
