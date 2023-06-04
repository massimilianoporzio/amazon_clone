import 'package:dio/dio.dart';

import 'package:amazon_clone/core/services/api/api_auth_interface.dart';

import '../../../../features/auth/domain/entities/user.dart';
import '../../../domain/errors/exceptions.dart';

class DioApiService implements AuthService {
  final Dio dio;
  DioApiService({
    required this.dio,
  });
  @override
  void signupUser(
      {required String email,
      required String password,
      required String name}) async {
    try {
      User user = User(
        email: email,
        password: password,
        name: name,
        id: '',
      );
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectionError ||
          e.type == DioErrorType.unknown) {
        throw NetworkException();
      }
      rethrow;
    } on Exception {
      throw RestApiException();
    }
  }
}
