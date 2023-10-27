import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'ui_event.dart';
part 'ui_state.dart';

class UiBloc extends Bloc<UiEvent, UiState> {
  UiBloc() : super( const UiInitial()) {
    on<SetVisibilityEvent>(setVisibility);
    on<ToggleSwitchEvent>(toggleVisibility);
  }

  void setVisibility(SetVisibilityEvent event, Emitter<UiState> emit){
    emit(state.copyWith(isVisible: event.isVisible));
  }

  void toggleVisibility(ToggleSwitchEvent event, Emitter<UiState> emit){
    emit(state.copyWith(isSwitchVisible: event.isSwitchVisibleData));
  }
}
