import 'package:estudo_auth/src/shared/core/abstractions/client_http/cliente_response.dart';

abstract class ClientHttp {
  Future<ClienteResponse> get({
    required String url,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });

  Future<ClienteResponse> post({
    required String url,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });

  Future<ClienteResponse> put({
    required String url,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });

  Future<ClienteResponse> delete({
    required String url,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });
}
