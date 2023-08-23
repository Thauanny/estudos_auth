class ClienteResponse {
  int? statusCode;
  dynamic body;
  String? statusMessage;
  dynamic errorMessage;

  ClienteResponse({
    this.statusCode,
    this.body,
    this.statusMessage,
    this.errorMessage,
  });
}
