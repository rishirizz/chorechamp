part of 'bottom_nav_bloc.dart';

class BottomNavEvent extends Equatable {
  const BottomNavEvent();

  @override
  List<Object> get props => [];
}

class BottomNavPageChanged extends BottomNavEvent {
  const BottomNavPageChanged({
    required this.selectedIndex,
  });
  final int selectedIndex;

  @override
  List<Object> get props => [
        selectedIndex,
      ];
}
