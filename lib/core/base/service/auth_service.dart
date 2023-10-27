import 'dart:io';
import 'package:bloc_1/core/base/model/auth_model.dart';
import 'package:bloc_1/core/base/model/login_model.dart';
import 'package:bloc_1/core/base/service/interface_auth_service.dart';
import 'package:bloc_1/core/constants/enums/network_enums.dart';

class AuthService extends IAuthService {
  AuthService(super.dioManager);

  @override
  Future<String?> login({
    required String email,
    required String password,
  }) async {
    var response = await dioManager.dio.post(
      NetworkEnums.login.path,
      data: LoginModel(
        email: email,
        password: password,
      ).toJson(),
    );

    if (response.statusCode == HttpStatus.ok) {
      return AuthModel.fromJson(response.data).token;
    } else {
      return throw Exception();
    }
  }
}
