import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainState()) {
    on<UpdateBottomBar>((event, emit) {
      emit(MainState(bottomBarIndex: event.index));
    });
  }
}
