import 'dart:convert';
import 'dart:io';
import 'package:dellioo/core/config/config.dart';
import 'package:dellioo/core/enums/server_error_types.dart';
import 'package:dellioo/core/services/api/error_response.dart';
import 'package:dellioo/core/services/api/server_error_model.dart';
import 'package:dellioo/core/services/api/service_state.dart';
import 'package:dellioo/utils/constants.dart';
import 'package:dellioo/utils/error_helpers.dart';
import 'package:dio/dio.dart';
import 'dart:developer' as developer;

class HttpHelper {
  static Dio? _client;
  static final _config = Config();
  static String? baseURL =_config.baseURL;

  static Future<Dio> _getInstance() async {

    _client ??= Dio();

    Map<String, dynamic> headers = {};

    _client!.options.headers = headers;
    _client!.options.baseUrl = baseURL!;
    _client!.options.setRequestContentTypeWhenNoPayload = true;
    _client!.options.contentType = 'application/json';
    _client!.options.responseType = ResponseType.json;
    _client!.options.sendTimeout = CONNECT_TIMEOUT;
    _client!.options.receiveTimeout = CONNECT_TIMEOUT;
    _client!.options.connectTimeout = CONNECT_TIMEOUT;

    return _client!;
  }

  @override
  Future<dynamic> get(
      String route, {
        List<int> successStatusCodes = const [200, 201],
        onError,
      }) async {
    final instance = await _getInstance();
    String hed = instance.options.headers.toString();

    Response response;

    developer.log('Sending GET to $route');

    try {
      final fullRoute = '$route';
      response = await instance.get(fullRoute);
      developer.log(response.toString());

    } on SocketException {
      return _internetError;
    } on FormatException {
      return _unknownError;
    } on DioError catch (dioError) {
      return _getDioErrorState(dioError, onError: onError);
    } catch (e) {
      return _unknownError;
    }

    dynamic _dataResponse = responseDecoder(response.data);

    if (successStatusCodes.contains(response.statusCode) && _dataResponse != null) {
      developer.log("data response --- ${_dataResponse.toString()}");

      return ServiceState.success(_dataResponse);
    }


    if(_dataResponse == null){
      return _unknownError;
    }

    return onError != null
        ? onError(response.data, response.statusCode)
        : _dioError(
      response.data,
      response.statusCode!,
    );
  }

  @override
  Future<dynamic> post(
      String route, {
        body,
        headers,
        List<int> successStatusCodes = const [200, 201],
        onError,
      }) async {
    final instance = await _getInstance();
    String hed = instance.options.headers.toString();
    print("Dio instance headers $hed");
    print('base url is ${instance.options.baseUrl}$route');

    Response response;

    developer.log('Sending $body to $route');

    try {
      final fullRoute = '$route';
      response = await instance.post(
        fullRoute,
        data: body,
        // options: options,
      );

      developer.log('$response');
    } on SocketException {
      return _internetError;
    } on FormatException {
      return _unknownError;
    } on DioError catch (dioError) {
      return _getDioErrorState(dioError, onError: onError);
    } catch (e) {
      return _unknownError;
    }

    dynamic _dataResponse = responseDecoder(response.data);

    if (successStatusCodes.contains(response.statusCode) && _dataResponse != null) {
      developer.log("data response --- ${_dataResponse.toString()}");

      return ServiceState.success(_dataResponse);
    }

    if(_dataResponse == null){
      return _unknownError;
    }

    return onError != null
        ? onError(response.data, response.statusCode)
        : _dioError(
      response.data,
      response.statusCode!,
    );
  }

  @override
  Future<dynamic> put(
      String route, {
        body,
        headers,
        List<int> successStatusCodes = const [200, 201],
        onError,
      }) async {
    final instance = await _getInstance();
    String hed = instance.options.headers.toString();
    developer.log("Dio instance headers $hed");

    Response response;

    developer.log('Sending $body to $route');

    try {
      final fullRoute = '$route';
      response = await instance.put(
        fullRoute,
        data: body,
        // options: options,
      );

    } on SocketException {
      return _internetError;
    } on FormatException {
      return _unknownError;
    } on DioError catch (dioError) {
      return _getDioErrorState(dioError, onError: onError);
    } catch (e) {
      return _unknownError;
    }

    dynamic _dataResponse = responseDecoder(response.data);

    if (successStatusCodes.contains(response.statusCode) && _dataResponse != null) {
      developer.log("data response --- ${_dataResponse.toString()}");

      return ServiceState.success(_dataResponse);
    }

    if(_dataResponse == null){
      return _unknownError;
    }

    return onError != null
        ? onError(response.data, response.statusCode)
        : _dioError(
      response.data,
      response.statusCode!,
    );
  }

  //PATCH
  @override
  Future<dynamic> patch(
      String route, {
        body,
        headers,
        List<int> successStatusCodes = const [200, 201],
        onError,
      }) async {
    final instance = await _getInstance();
    String hed = instance.options.headers.toString();
    print("Dio instance headers $hed");

    Response response;

    developer.log('Sending $body to $route');

    try {
      final fullRoute = route;
      response = await instance.patch(
        fullRoute,
        data: body,
        // options: options,
      );

    } on SocketException {
      return _internetError;
    } on FormatException {
      return _unknownError;
    } on DioError catch (dioError) {
      return _getDioErrorState(dioError, onError: onError);
    } catch (e) {
      return _unknownError;
    }

    dynamic _dataResponse = responseDecoder(response.data);

    if (successStatusCodes.contains(response.statusCode) && _dataResponse != null) {
      developer.log("data response --- ${_dataResponse.toString()}");

      return ServiceState.success(_dataResponse);
    }

    if(_dataResponse == null){
      return _unknownError;
    }

    return onError != null
        ? onError(response.data, response.statusCode)
        : _dioError(
      response.data,
      response.statusCode!,
    );
  }

  @override
  Future delete(
      String route, {
        body,
        headers,
        List<int> successStatusCodes = const [200, 201],
        onError,
      }) async {
    final instance = await _getInstance();
    String hed = instance.options.headers.toString();
    developer.log("Dio instance headers $hed");

    Response response;

    developer.log('Sending $body to $route');

    try {
      final fullRoute = '$route';
      response = await instance.delete(
        fullRoute,
        data: body,
        // options: options,
      );

    } on SocketException {
      return _internetError;
    } on FormatException {
      return _unknownError;
    } on DioError catch (dioError) {
      return _getDioErrorState(dioError, onError: onError);
    } catch (e) {
      return _unknownError;
    }

    dynamic _dataResponse = responseDecoder(response.data);

    if (successStatusCodes.contains(response.statusCode) && _dataResponse != null) {
      developer.log("data response --- ${_dataResponse.toString()}");

      return ServiceState.success(_dataResponse);
    }

    if(_dataResponse == null){
      return _unknownError;
    }

    return onError != null
        ? onError(response.data, response.statusCode)
        : _dioError(
      response.data,
      response.statusCode!,
    );
  }

  //Map `DioError` to `ServiceState`
  ServiceState? _getDioErrorState(
      DioError dioError, {
        ServiceState Function(dynamic data, int statusCode)? onError,
      }) {
    print(dioError.type);
    switch (dioError.type) {
      case DioErrorType.response:
        if (onError != null) {
          return onError(dioError.response!.data,
              dioError.response!.statusCode!);
        } else {
          return _dioError(
            dioError.response!.data,
            dioError.response!.statusCode!,
          );
        }
      case DioErrorType.other:
      case DioErrorType.connectTimeout:
        return _requestTimeOutState;
      case DioErrorType.receiveTimeout:
        return _requestTimeOutState;
      case DioErrorType.sendTimeout:
        return _requestTimeOutState;
      default:
        return _unknownError;
    }
  }

  final ServiceState _requestTimeOutState =
  ServiceState<ServerErrorModel>.error(
    const ServerErrorModel(
      statusCode: 400,
      errorMessage: 'Request timeout. Please, try again',
      data: null,
      type: ServerErrorTypes.timeout,
    ),
  );

  final ServiceState _internetError = ServiceState<ServerErrorModel>.error(
    const ServerErrorModel(
      statusCode: 400,
      errorMessage:
      // ignore: lines_longer_than_80_chars
      'Something went wrong please check your internet connection and try again',
      data: null,
      type: ServerErrorTypes.internetConnection,
    ),
  );

  final ServiceState _unknownError = ServiceState<ServerErrorModel>.error(
    ServerErrorModel(
      statusCode: 500,
      errorMessage: genericErrorMessageString,
      data: null,
      type: ServerErrorTypes.unknown,
    ),
  );

  ServiceState? _dioError(
      // String message,
      dynamic data,
      int statusCode,
      ) {
    print("DIO ERROR StatusCode: ---- $statusCode");
    print("DIO ERROR data: ---- $data");
    String _errorMessage = genericErrorMessageString;

    ErrorResponse _errorResponse = ErrorResponse.fromJson(data);
    print(_errorResponse);

    if (data.runtimeType == Map ||
        data.runtimeType.toString() != "_OneByteString") {
      ErrorResponse _errorResponse = ErrorResponse.fromJson(data);
      print(_errorResponse);

      if(statusCode == 401){

        _getInstance().then((value){
          value.clear();
          value.close();
        });

        return null;
      }

      if (_errorResponse.success != null && _errorResponse.success == false) {
        if (_errorResponse.message != null &&
            _errorResponse.message.runtimeType == String &&
            _errorResponse.message != 'Operation failed') {
          _errorMessage = _errorResponse.message!;
        } else if (_errorResponse.data != null &&
            _errorResponse.data.runtimeType == String) {
          _errorMessage = _errorResponse.data;
        }

        return ServiceState.error(
          ServerErrorModel(
              statusCode: statusCode, errorMessage: _errorMessage),
        );
      }
    }

    return ServiceState<ServerErrorModel>.error(
      ServerErrorModel(
        statusCode: statusCode,
        errorMessage: _errorMessage,
        data: data,
      ),
    );
  }

  @override
  void dispose() async {
    final instance = await _getInstance();

    instance.clear();
    instance.close(force: true);
  }

  //decode response from user
  dynamic responseDecoder(dynamic data){

    print("Data from DIO --- ${data.runtimeType}");
    if(data.runtimeType != String){
      return data;
    }else if(data.runtimeType == String){
      try{
        dynamic _jsonData = json.decode(data);
        print("Data from DIO --- try ${_jsonData.toString()}");


        if(_jsonData != null){
          return _jsonData;
        }

      } catch(e) {
        print("Data from DIO ---  catch");
        return null;
      }
    }

    return null;
  }

}