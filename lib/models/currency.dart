class Currency {
  String txt;
  double rate;

  Currency(this.txt, this.rate);

  factory Currency.fromJson(Map<String, dynamic> json) {
    return Currency(json['txt'], json['rate']);
  }
}