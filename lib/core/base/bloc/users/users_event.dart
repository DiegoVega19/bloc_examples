part of 'users_bloc.dart';

sealed class UsersEvent extends Equatable {
  const UsersEvent();

  @override
  List<Object?> get props => [];
}

class GetUserList extends UsersEvent {}

class SwithUserList extends UsersEvent {
final bool isSwitchVisibleData;
const SwithUserList(this.isSwitchVisibleData);

}
