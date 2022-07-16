import 'package:dio/dio.dart';

import '../instacart_api.dart';

extension HeadersX on Json {
  Options toOptions() => Options(headers: this);
}
