import 'package:currency_calculator/utils/constants/Strings.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../utils/methods/xml_to_json.dart';
import '../models/CurrencyRates.dart';
import 'dart:developer' as developer;


part 'currency_rates_service.g.dart';


@RestApi(baseUrl: baseUrl)
abstract class CurrencyRatesService {
  factory CurrencyRatesService(Dio dio) {
    dio.interceptors.add(InterceptorsWrapper(
      onResponse: (Response response, ResponseInterceptorHandler handler) {
        response.data = Utils.decodeXmlResponseIntoJson(response.data);
        return handler.next(response);
      },
    ));
    dio.interceptors.add(LogInterceptor());
    return _CurrencyRatesService(dio, baseUrl: baseUrl);
  }

  @GET("/eurofxref/eurofxref-daily.xml")
  @DioResponseType(ResponseType.plain)
  Future<HttpResponse<CurrencyRates>> getRates();
}
