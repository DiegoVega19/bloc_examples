part of 'ui_bloc.dart';

sealed class UiEvent extends Equatable {
  const UiEvent();
}

class SetVisibilityEvent extends UiEvent{
  final bool isVisible;
  const SetVisibilityEvent(this.isVisible);
  @override
  List<Object> get props => [isVisible];
}

class ToggleSwitchEvent extends UiEvent{
  final bool isSwitchVisibleData;
  const ToggleSwitchEvent(this.isSwitchVisibleData);
  @override
  List<Object> get props => [isSwitchVisibleData];
}