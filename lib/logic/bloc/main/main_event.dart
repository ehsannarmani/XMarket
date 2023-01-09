part of 'main_bloc.dart';

@immutable
abstract class MainEvent {}

class UpdateBottomBar extends MainEvent{
  int index;
  UpdateBottomBar(this.index);
}
