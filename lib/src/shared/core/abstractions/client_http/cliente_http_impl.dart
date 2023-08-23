import 'package:dio/dio.dart';
import 'package:estudo_auth/src/shared/core/abstractions/client_http/cliente_http.dart';
import 'package:estudo_auth/src/shared/core/abstractions/client_http/cliente_response.dart';

import 'package:estudo_auth/src/shared/helpers/debug_print/debug_print.dart';

class ClienteHttpImpl implements ClientHttp {
  final Dio clienteHttp;
  final String baseUrl;
  final String prefixo;

  ClienteHttpImpl({
    required this.clienteHttp,
    required this.baseUrl,
    required this.prefixo,
  }) {
    clienteHttp.options.headers = {
      'Access-Control-Allow-Origin': '*',
      'Acess-Control-Allow-Methods':
          'GET, HEAD, PUT, PATCH, POST, DELETE, OPTIONS'
    };
  }

  @override
  Future<ClienteResponse> delete({
    required String url,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    Response response;
    try {
      debugPrintHelper("url: $baseUrl$prefixo$url");
      debugPrintHelper("queryParameters: $queryParameters");

      response = await clienteHttp.delete(
        baseUrl + prefixo + url,
        data: body,
        queryParameters: queryParameters,
        options: headers != null ? Options(headers: headers) : Options(),
      );

      return ClienteResponse(
        body: response.data,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
      );
    } on DioException catch (e) {
      final Map<String, dynamic> body = Map.from(e.response?.data);
      return ClienteResponse(
        body: body,
        statusCode: e.response?.statusCode,
        errorMessage: body['message'],
      );
    } catch (e) {
      debugPrintHelper(e.toString());
      return ClienteResponse();
    }
  }

  @override
  Future<ClienteResponse> get({
    required String url,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    Response response;
    try {
      debugPrintHelper("url: $baseUrl$prefixo$url");
      debugPrintHelper("queryParameters: $queryParameters");

      response = await clienteHttp.get(
        baseUrl + prefixo + url,
        queryParameters: queryParameters,
        options: headers != null ? Options(headers: headers) : Options(),
      );

      return ClienteResponse(
        body: response.data,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
      );
    } on DioException catch (e) {
      final Map<String, dynamic> body = Map.from(e.response?.data);
      return ClienteResponse(
        body: body,
        statusCode: e.response?.statusCode,
        errorMessage: body['message'],
      );
    } catch (e) {
      debugPrintHelper(e.toString());
      return ClienteResponse();
    }
  }

  @override
  Future<ClienteResponse> post({
    required String url,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    Response response;
    try {
      debugPrintHelper("url: $baseUrl$prefixo$url");
      debugPrintHelper("queryParameters: $queryParameters");

      response = await clienteHttp.post(
        baseUrl + prefixo + url,
        data: body,
        queryParameters: queryParameters,
        options: headers != null ? Options(headers: headers) : Options(),
      );

      return ClienteResponse(
        body: response.data,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
      );
    } on DioException catch (e) {
      final Map<String, dynamic> body = Map.from(e.response?.data);
      return ClienteResponse(
        body: body,
        statusCode: e.response?.statusCode,
        errorMessage: body['message'],
      );
    } catch (e) {
      debugPrintHelper(e.toString());
      return ClienteResponse();
    }
  }

  @override
  Future<ClienteResponse> put({
    required String url,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    Response response;
    try {
      debugPrintHelper("url: $baseUrl$prefixo$url");
      debugPrintHelper("queryParameters: $queryParameters");

      response = await clienteHttp.put(
        baseUrl + prefixo + url,
        data: body,
        queryParameters: queryParameters,
        options: headers != null ? Options(headers: headers) : Options(),
      );

      return ClienteResponse(
        body: response.data,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
      );
    } on DioException catch (e) {
      final Map<String, dynamic> body = Map.from(e.response?.data);
      return ClienteResponse(
        body: body,
        statusCode: e.response?.statusCode,
        errorMessage: body['message'],
      );
    } catch (e) {
      debugPrintHelper(e.toString());
      return ClienteResponse();
    }
  }
}
