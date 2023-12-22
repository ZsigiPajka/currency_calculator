/// Envelope : {"gesmes":"http://www.gesmes.org/xml/2002-08-01","xmlns":"http://www.ecb.int/vocabulary/2002-08-01/eurofxref","subject":"Reference rates","Sender":{"name":"European Central Bank"},"Cube":{"Cube":{"time":"2023-12-20","Cube":[{"currency":"USD","rate":"1.0944"},{"currency":"JPY","rate":"157.12"},{"currency":"BGN","rate":"1.9558"},{"currency":"CZK","rate":"24.538"},{"currency":"DKK","rate":"7.4565"},{"currency":"GBP","rate":"0.86555"},{"currency":"HUF","rate":"385.23"},{"currency":"PLN","rate":"4.3413"},{"currency":"RON","rate":"4.9699"},{"currency":"SEK","rate":"11.1290"},{"currency":"CHF","rate":"0.9460"},{"currency":"ISK","rate":"150.30"},{"currency":"NOK","rate":"11.2895"},{"currency":"TRY","rate":"31.8830"},{"currency":"AUD","rate":"1.6186"},{"currency":"BRL","rate":"5.3287"},{"currency":"CAD","rate":"1.4609"},{"currency":"CNY","rate":"7.8121"},{"currency":"HKD","rate":"8.5439"},{"currency":"IDR","rate":"16993.62"},{"currency":"ILS","rate":"3.9983"},{"currency":"INR","rate":"91.0595"},{"currency":"KRW","rate":"1425.62"},{"currency":"MXN","rate":"18.6867"},{"currency":"MYR","rate":"5.0977"},{"currency":"NZD","rate":"1.7421"},{"currency":"PHP","rate":"60.991"},{"currency":"SGD","rate":"1.4562"},{"currency":"THB","rate":"38.252"},{"currency":"ZAR","rate":"20.1107"}]}}}



class CurrencyRates {
  CurrencyRates({
      Envelope? envelope,}){
    _envelope = envelope;
}

  CurrencyRates.fromJson(dynamic json) {
    _envelope = json['Envelope'] != null ? Envelope.fromJson(json['Envelope']) : null;
  }
  Envelope? _envelope;
CurrencyRates copyWith({  Envelope? envelope,
}) => CurrencyRates(  envelope: envelope ?? _envelope,
);
  Envelope? get envelope => _envelope;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_envelope != null) {
      map['Envelope'] = _envelope?.toJson();
    }
    return map;
  }

}

/// gesmes : "http://www.gesmes.org/xml/2002-08-01"
/// xmlns : "http://www.ecb.int/vocabulary/2002-08-01/eurofxref"
/// subject : "Reference rates"
/// Sender : {"name":"European Central Bank"}
/// Cube : {"Cube":{"time":"2023-12-20","Cube":[{"currency":"USD","rate":"1.0944"},{"currency":"JPY","rate":"157.12"},{"currency":"BGN","rate":"1.9558"},{"currency":"CZK","rate":"24.538"},{"currency":"DKK","rate":"7.4565"},{"currency":"GBP","rate":"0.86555"},{"currency":"HUF","rate":"385.23"},{"currency":"PLN","rate":"4.3413"},{"currency":"RON","rate":"4.9699"},{"currency":"SEK","rate":"11.1290"},{"currency":"CHF","rate":"0.9460"},{"currency":"ISK","rate":"150.30"},{"currency":"NOK","rate":"11.2895"},{"currency":"TRY","rate":"31.8830"},{"currency":"AUD","rate":"1.6186"},{"currency":"BRL","rate":"5.3287"},{"currency":"CAD","rate":"1.4609"},{"currency":"CNY","rate":"7.8121"},{"currency":"HKD","rate":"8.5439"},{"currency":"IDR","rate":"16993.62"},{"currency":"ILS","rate":"3.9983"},{"currency":"INR","rate":"91.0595"},{"currency":"KRW","rate":"1425.62"},{"currency":"MXN","rate":"18.6867"},{"currency":"MYR","rate":"5.0977"},{"currency":"NZD","rate":"1.7421"},{"currency":"PHP","rate":"60.991"},{"currency":"SGD","rate":"1.4562"},{"currency":"THB","rate":"38.252"},{"currency":"ZAR","rate":"20.1107"}]}}

class Envelope {
  Envelope({
      String? gesmes, 
      String? xmlns, 
      String? subject, 
      Sender? sender, 
      Cube? cube,}){
    _gesmes = gesmes;
    _xmlns = xmlns;
    _subject = subject;
    _sender = sender;
    _cube = cube;
}

  Envelope.fromJson(dynamic json) {
    _gesmes = json['gesmes'];
    _xmlns = json['xmlns'];
    _subject = json['subject'];
    _sender = json['Sender'] != null ? Sender.fromJson(json['Sender']) : null;
    _cube = json['Cube'] != null ? Cube.fromJson(json['Cube']) : null;
  }
  String? _gesmes;
  String? _xmlns;
  String? _subject;
  Sender? _sender;
  Cube? _cube;
Envelope copyWith({  String? gesmes,
  String? xmlns,
  String? subject,
  Sender? sender,
  Cube? cube,
}) => Envelope(  gesmes: gesmes ?? _gesmes,
  xmlns: xmlns ?? _xmlns,
  subject: subject ?? _subject,
  sender: sender ?? _sender,
  cube: cube ?? _cube,
);
  String? get gesmes => _gesmes;
  String? get xmlns => _xmlns;
  String? get subject => _subject;
  Sender? get sender => _sender;
  Cube? get cube => _cube;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['gesmes'] = _gesmes;
    map['xmlns'] = _xmlns;
    map['subject'] = _subject;
    if (_sender != null) {
      map['Sender'] = _sender?.toJson();
    }
    if (_cube != null) {
      map['Cube'] = _cube?.toJson();
    }
    return map;
  }

}

/// Cube : {"time":"2023-12-20","Cube":[{"currency":"USD","rate":"1.0944"},{"currency":"JPY","rate":"157.12"},{"currency":"BGN","rate":"1.9558"},{"currency":"CZK","rate":"24.538"},{"currency":"DKK","rate":"7.4565"},{"currency":"GBP","rate":"0.86555"},{"currency":"HUF","rate":"385.23"},{"currency":"PLN","rate":"4.3413"},{"currency":"RON","rate":"4.9699"},{"currency":"SEK","rate":"11.1290"},{"currency":"CHF","rate":"0.9460"},{"currency":"ISK","rate":"150.30"},{"currency":"NOK","rate":"11.2895"},{"currency":"TRY","rate":"31.8830"},{"currency":"AUD","rate":"1.6186"},{"currency":"BRL","rate":"5.3287"},{"currency":"CAD","rate":"1.4609"},{"currency":"CNY","rate":"7.8121"},{"currency":"HKD","rate":"8.5439"},{"currency":"IDR","rate":"16993.62"},{"currency":"ILS","rate":"3.9983"},{"currency":"INR","rate":"91.0595"},{"currency":"KRW","rate":"1425.62"},{"currency":"MXN","rate":"18.6867"},{"currency":"MYR","rate":"5.0977"},{"currency":"NZD","rate":"1.7421"},{"currency":"PHP","rate":"60.991"},{"currency":"SGD","rate":"1.4562"},{"currency":"THB","rate":"38.252"},{"currency":"ZAR","rate":"20.1107"}]}

class Cube {
  Cube({
      MiddleCube? cube,}){
    _cube = cube;
}

  Cube.fromJson(dynamic json) {
    _cube = json['Cube'] != null ? MiddleCube.fromJson(json['Cube']) : null;
  }
  MiddleCube? _cube;
Cube copyWith({  MiddleCube? cube,
}) => Cube(  cube: cube ?? _cube,
);
  MiddleCube? get cube => _cube;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_cube != null) {
      map['Cube'] = _cube?.toJson();
    }
    return map;
  }

}

/// time : "2023-12-20"
/// Cube : [{"currency":"USD","rate":"1.0944"},{"currency":"JPY","rate":"157.12"},{"currency":"BGN","rate":"1.9558"},{"currency":"CZK","rate":"24.538"},{"currency":"DKK","rate":"7.4565"},{"currency":"GBP","rate":"0.86555"},{"currency":"HUF","rate":"385.23"},{"currency":"PLN","rate":"4.3413"},{"currency":"RON","rate":"4.9699"},{"currency":"SEK","rate":"11.1290"},{"currency":"CHF","rate":"0.9460"},{"currency":"ISK","rate":"150.30"},{"currency":"NOK","rate":"11.2895"},{"currency":"TRY","rate":"31.8830"},{"currency":"AUD","rate":"1.6186"},{"currency":"BRL","rate":"5.3287"},{"currency":"CAD","rate":"1.4609"},{"currency":"CNY","rate":"7.8121"},{"currency":"HKD","rate":"8.5439"},{"currency":"IDR","rate":"16993.62"},{"currency":"ILS","rate":"3.9983"},{"currency":"INR","rate":"91.0595"},{"currency":"KRW","rate":"1425.62"},{"currency":"MXN","rate":"18.6867"},{"currency":"MYR","rate":"5.0977"},{"currency":"NZD","rate":"1.7421"},{"currency":"PHP","rate":"60.991"},{"currency":"SGD","rate":"1.4562"},{"currency":"THB","rate":"38.252"},{"currency":"ZAR","rate":"20.1107"}]

class MiddleCube {
  MiddleCube({
      String? time, 
      List<InnerCube>? cube,}){
    _time = time;
    _cube = cube;
}

  MiddleCube.fromJson(dynamic json) {
    _time = json['time'];
    if (json['Cube'] != null) {
      _cube = [];
      json['Cube'].forEach((v) {
        _cube?.add(InnerCube.fromJson(v));
      });
    }
  }
  String? _time;
  List<InnerCube>? _cube;
MiddleCube copyWith({  String? time,
  List<InnerCube>? cube,
}) => MiddleCube(  time: time ?? _time,
  cube: cube ?? _cube,
);
  String? get time => _time;
  List<InnerCube>? get cube => _cube;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['time'] = _time;
    if (_cube != null) {
      map['Cube'] = _cube?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// currency : "USD"
/// rate : "1.0944"

class InnerCube {
  InnerCube({
      String? currency, 
      String? rate,}){
    _currency = currency;
    _rate = rate;
}

  InnerCube.fromJson(dynamic json) {
    _currency = json['currency'];
    _rate = json['rate'];
  }
  String? _currency;
  String? _rate;
InnerCube copyWith({  String? currency,
  String? rate,
}) => InnerCube(  currency: currency ?? _currency,
  rate: rate ?? _rate,
);
  String? get currency => _currency;
  String? get rate => _rate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['currency'] = _currency;
    map['rate'] = _rate;
    return map;
  }

}

/// name : "European Central Bank"

class Sender {
  Sender({
      String? name,}){
    _name = name;
}

  Sender.fromJson(dynamic json) {
    _name = json['name'];
  }
  String? _name;
Sender copyWith({  String? name,
}) => Sender(  name: name ?? _name,
);
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    return map;
  }

}