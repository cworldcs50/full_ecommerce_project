import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import '../constants/enums/request_status.dart';
import '../functions/check_internet_connection.dart';

class Api {
  const Api._();
  factory Api() => instance;
  static const instance = Api._();

  Future<Either<RequestStatus, Map>> post(String url, Map dataForm) async {
    try {
      if (await checkInternetConnection()) {
        http.Response response = await http.post(
          Uri.parse(url),
          body: dataForm,
        );

        if (response.statusCode >= 200 && response.statusCode < 300) {
          log(response.body);
          dynamic responseBody = jsonDecode(response.body);
          return Right(responseBody);
        } else {
          return const Left(RequestStatus.serverFailure);
        }
      } else {
        return const Left(RequestStatus.offlineFailure);
      }
    } catch (_) {
      return const Left(RequestStatus.failure);
    }
  }
}
