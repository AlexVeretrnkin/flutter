import 'package:flutter/material.dart';
import 'package:mobile_app_flutter/models/currency.dart';
import 'package:mobile_app_flutter/services/currency.service.dart';

final int animDuration = 500;

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
          children: this
              .currencyList
              .map((e) => CurrencyItem(
                    currency: e,
                  ))
              .toList(),
        ));
  }
}

class CurrencyItem extends StatefulWidget {
  final Currency currency;

  CurrencyItem({Currency currency}) : this.currency = currency;

  @override
  _CurrencyItem createState() => _CurrencyItem(currency: this.currency);
}

class _CurrencyItem extends State<CurrencyItem> {
  final Currency currency;
  int dimension = 0;
  bool componentDisposed = false;

  _CurrencyItem({Currency currency}) : this.currency = currency;

  @override
  void initState() {
    super.initState();

    if (this.mounted) {
      Future.delayed(Duration(milliseconds: 500)).then((value) {
        if (this.mounted && !componentDisposed) {
          setState(() {
            dimension = 1000;
          });
        }
      });
    }
  }

  @override
  void dispose() {
    super.dispose();

    componentDisposed = true;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        height: dimension.toDouble(),
        width: dimension.toDouble(),
        duration: Duration(milliseconds: animDuration),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(color: Colors.blueGrey[800]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: Center(
                child: Text(
                  this.currency.txt,
                  textAlign: TextAlign.center,
                ),
              )),
              Expanded(
                  child: Center(
                child: Text(
                  this.currency.rate.toString(),
                  textAlign: TextAlign.center,
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
