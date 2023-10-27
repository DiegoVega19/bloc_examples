import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:bloc_1/core/base/model/users_model.dart';
import 'package:bloc_1/core/base/service/interface_user_service.dart';
import 'package:equatable/equatable.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final IUsersService usersService;
  UsersBloc(this.usersService) : super(UsersInitial()) {
    on<GetUserList>((event, emit) async {
      try{
        emit(UsersLoading());
        final mList = await usersService.getUserList();
        emit(UsersLoaded(usersModel: mList));
        if (mList.error != null) {
          emit(UsersError(mList.error));
        }
      } on SocketException {
        emit(const UsersError("Failed to fetch data. is your device online?"));
      }
      catch(e){
        log(e.toString());
        emit(const UsersError('failed to fetch data. is your device online?'));
      }
    });

  
  }



  
}
