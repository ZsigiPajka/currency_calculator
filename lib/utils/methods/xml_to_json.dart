import 'dart:convert';
import 'package:xml2json/xml2json.dart';
import 'dart:developer' as developer;


class Utils {
  static dynamic decodeXmlResponseIntoJson(String data) {
    final Xml2Json transformer = Xml2Json();
    transformer.parse(data);
    final json = transformer.toOpenRally();
    // developer.log("RATES: $json", name: 'my.app.category');
    return jsonDecode(json);
  }
}