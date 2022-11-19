class RequestError {
  int? code;
  String? message;
  dynamic result;

  RequestError({this.code, this.message, this.result});

  RequestError.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    data['result'] = result;
    return data;
  }
}
