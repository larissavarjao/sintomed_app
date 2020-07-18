class ResponseDataError {
  final dynamic data;
  final dynamic error;

  ResponseDataError({this.data, this.error});

  bool isErrorUnauthrized(dynamic error) {
    return error.response.statusCode == 401;
  }
}
