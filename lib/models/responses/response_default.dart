class ResponseDefault {
  ResponseDefault({
    this.responseResult,
    this.statusCode,
    this.data,
    this.message,
  });

  ResponseDefault.fromJson(dynamic json) {
    responseResult = json['responseResult'];
    statusCode = json['statusCode'];
    data = json['data'];
    message = json['message'] != null ? json['message'].cast<String>() : [];
  }

  bool? responseResult;
  num? statusCode;
  String? data;
  List<String>? message;

  ResponseDefault copyWith({
    bool? responseResult,
    num? statusCode,
    String? data,
    List<String>? message,
  }) =>
      ResponseDefault(
        responseResult: responseResult ?? this.responseResult,
        statusCode: statusCode ?? this.statusCode,
        data: data ?? this.data,
        message: message ?? this.message,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['responseResult'] = responseResult;
    map['statusCode'] = statusCode;
    map['data'] = data;
    map['message'] = message;
    return map;
  }
}
