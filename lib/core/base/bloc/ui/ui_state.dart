part of 'ui_bloc.dart';

 class UiState extends Equatable {
  final bool isVisible;
  final bool isSwitchVisible;
  const UiState({required this.isVisible, required this.isSwitchVisible});
  
  UiState copyWith({bool? isVisible, bool? isSwitchVisible}) {
    return UiState(
      isVisible: isVisible ?? this.isVisible,
      isSwitchVisible: isSwitchVisible ?? this.isSwitchVisible,
    );
  }
  @override
  List<Object> get props => [isVisible, isSwitchVisible];
}


class UiInitial extends UiState {
  const UiInitial() :super(isSwitchVisible: false, isVisible: false);
}


