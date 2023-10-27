
import 'package:bloc_1/core/base/model/users_model.dart';
import 'package:bloc_1/core/base/service/interface_user_service.dart';
import 'package:dio/dio.dart';


class UsersService extends IUsersService {
  UsersService(super.dioManager);

  @override
  Future<UsersModel> getUserList() async {
    try {
       Response response = await dioManager.dio.get('/users/');
       return UsersModel.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return UsersModel.withError("Data not found / Connection issue");
    }
  }
}
