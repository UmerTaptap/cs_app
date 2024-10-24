import 'package:cs_app/core/response/api_failure_response.dart';
import 'package:cs_app/core/response/api_response.dart';
import 'package:fpdart/fpdart.dart';

typedef FR = Future<ApiResponse>;


typedef ER<T> = Future<Either<Failure, T>>;

