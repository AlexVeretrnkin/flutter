import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobile_app_flutter/models/currency.dart';

Future<List<Currency>> fetchCurrencyData() async {
  final response = await Future.delayed(Duration(seconds: 1))
      .then((value) => http.get('https://bank.gov.ua/NBUStatService/v1/statdirectory/exchange?json'))
      .then((value) => jsonDecode(value.body));

  return List.from(response).map((e) => Currency.fromJson(e)).toList();
}

Future<List<Currency>> fetchCurrencyDataWithThen() {
  return http.get('https://bank.gov.ua/NBUStatService/v1/statdirectory/exchange?json')
      .then((value) => jsonDecode(value.body)['txt']['rate']);
}