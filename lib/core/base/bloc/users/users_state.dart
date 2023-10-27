part of 'users_bloc.dart';

 class UsersState extends Equatable {
  const UsersState();
  @override
  List<Object?> get props => [];
}


class UsersInitial extends UsersState {}

class UsersLoading extends UsersState {}

class UsersLoaded extends UsersState {
  final UsersModel usersModel;
  final bool? isLoading;
  const UsersLoaded({ required this.usersModel, this.isLoading = false});
  @override
  List<Object> get props => [];
}

class UsersError extends UsersState {
  final String? message;
  const UsersError(this.message);
}

class DisableUsers extends UsersEvent {
  final bool isLoading;
  const DisableUsers(this.isLoading);
}