import 'package:bloc_1/core/base/model/users_model.dart';

import '../../init/network/dio_manager.dart';

abstract class IUsersService {
  final DioManager dioManager;

  IUsersService(this.dioManager);

  Future<UsersModel> getUserList();
}
