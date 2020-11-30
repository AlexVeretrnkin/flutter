import 'package:flutter/material.dart';
import 'package:mobile_app_flutter/models/currency.dart';
import 'package:mobile_app_flutter/services/currency.service.dart';

class CurrencyScreen extends StatefulWidget {
  CurrencyScreen({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<CurrencyScreen> {
  Future<List<Currency>> futureCurrency;

  @override
  void initState() {
    super.initState();
    futureCurrency = fetchCurrencyData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Currency>>(
      future: futureCurrency,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return CurrencyList(list: snapshot.data);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
              width: 50,
              child: CircularProgressIndicator(),
            ),
          ],
        );
      },
    );
  }
}

class CurrencyList extends StatelessWidget {
  final List<Currency> currencyList;

  CurrencyList({List<Currency> list}) : this.currencyList = list;

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children:
          this.currencyList.map((e) => CurrencyItem(currency: e)).toList(),
        ));
  }
}

class CurrencyItem extends StatelessWidget {
  final Currency currency;

  CurrencyItem({Currency currency}) : this.currency = currency;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),

      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(this.currency.txt, textAlign: TextAlign.center,),
            SizedBox(height: 20,),
            Text(this.currency.rate.toString()),
          ],
        ),
        color: Colors.blueGrey[800],
      );,
    )
  }
}
