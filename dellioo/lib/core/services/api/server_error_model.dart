import 'package:dellioo/core/enums/server_error_types.dart';
import 'package:equatable/equatable.dart';

class ServerErrorModel extends Equatable {
  final int? statusCode;
  final String? errorMessage;
  final dynamic data;
  final ServerErrorTypes type;

  const ServerErrorModel({
    this.statusCode = 400,
    this.errorMessage,
    this.data,
    this.type = ServerErrorTypes.response,
  });

  @override
  List<Object> get props => [errorMessage!];

  @override
  bool get stringify => true;
}