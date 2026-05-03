import 'package:bloc/bloc.dart';
import 'package:block_practice_project/bloc/switch_example/switch_event.dart';
import 'package:block_practice_project/bloc/switch_example/switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() :super(SwitchState()) {
    on<ToggleSwitch>(_toggleSwitch);
    on<SliderEvent>(_slider);
  }

  void _toggleSwitch(ToggleSwitch event, Emitter<SwitchState> emit) {
    emit(state.copyWith(isSwitch: !state.isSwitch));
  }

  void _slider(SliderEvent event, Emitter<SwitchState> emit) {
    emit(state.copyWith(slider: event.sliderValue.toDouble()));
  }
}