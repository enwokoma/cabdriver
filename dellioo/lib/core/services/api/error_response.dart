
class ErrorResponse {
  bool? success;
  String? message;
  dynamic data;

  ErrorResponse({
    this.success,
    this.message,
    this.data,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    //`data` can come as String, List, Map or null
    dynamic dataObj;

    if (json['data'] != null) {
      dynamic d = json["data"];

      switch (d.runtimeType) {
        case String:
          dataObj = d;
          break;
        case List:
          dataObj = null;
          break;
        case Map:
          dataObj = d;
          break;
        default:
          dataObj = null;
      }
    }

    return ErrorResponse(
      success: json["success"] != null ? json["success"] as bool : false,
      message: json["message"] != null ? json["message"] as String : null,
      data: dataObj,
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    "success": success,
    "message": message,
    "data": data.toJson(),
  };
}
