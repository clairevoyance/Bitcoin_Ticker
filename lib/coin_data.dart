import 'dart:convert';
import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const openAPI = 'https://apiv2.bitcoinaverage.com/indices/global/ticker/';

class CoinData {
  Future getCoinData(String cryptoCurrency,String inputCurrency) async {
    var url = '$openAPI$cryptoCurrency$inputCurrency#';
    http.Response response = await http.get(url);
    if(response.statusCode >= 200)
      {
          var decodedData = jsonDecode(response.body);
          var lastPrice = decodedData['last'];
          return lastPrice;
      }
    else
      {
        print(response.statusCode);
        throw('Problem with the get request');
      }
  }
}
