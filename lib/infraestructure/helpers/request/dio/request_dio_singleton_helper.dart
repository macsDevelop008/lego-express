import 'package:dio/dio.dart';
import 'package:lego_express/configuration/configuration.dart';

class RequestDioSingletonHelper {
  static Dio? _dio;

  static final RequestDioSingletonHelper shared = RequestDioSingletonHelper._();
  RequestDioSingletonHelper._();

  Future<Dio> get instace async {
    if (_dio != null) _dio;

    _dio = await initialization();

    return _dio!;
  }

  Future<Dio> initialization() async {
    // Base url para las peticiones
    BaseOptions options = BaseOptions(baseUrl: Enviroment.urlBase);
    return Dio(options);
  }
}
