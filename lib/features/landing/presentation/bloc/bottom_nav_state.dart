part of 'bottom_nav_bloc.dart';

class BottomNavState extends Equatable {
  const BottomNavState({
    required this.selectedIndex,
  });

  final int selectedIndex;

  factory BottomNavState.initial() {
    return const BottomNavState(
      selectedIndex: 0,
    );
  }

  BottomNavState copyWith({
    int? selectedIndex,
  }) {
    return BottomNavState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }

  @override
  List<Object> get props => [
        selectedIndex,
      ];
}
