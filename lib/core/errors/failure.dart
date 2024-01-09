import 'package:dio/dio.dart';

abstract class Faluire {
  final String errorMessage;

  const Faluire(this.errorMessage);
}

class ServerFailure extends Faluire {
  ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.connectionTimeout:
        return ServerFailure('connectionTimeout With apiserver');
      case DioErrorType.sendTimeout:
        return ServerFailure('sendTimeout With apiserver');
      case DioErrorType.receiveTimeout:
        return ServerFailure('receiveTimeout With apiserver');

      case DioErrorType.badCertificate:
        return ServerFailure('CERTIFICATE VERIFY FAILED');
      case DioErrorType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode!, dioError.response!.data!);
      case DioErrorType.cancel:
        return ServerFailure('your request is canceld With apiserver');
      case DioErrorType.connectionError:
        return ServerFailure('connectionError With apiserver');
      case DioErrorType.unknown:
      
        if (dioError.message!.contains('SocketException')) {
          return ServerFailure('no internet connection');
        }
      return ServerFailure('un excpected error, please try again');
      
         default : 
       return   ServerFailure('oops there is an error please try again');
    }
  }
  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('request not found , please try again later !');
    } else if (statusCode == 500) {
      return ServerFailure('internal server error , please try again later !');
    } else {
      return ServerFailure('oops there is an error please try again');
    }
  }
}
