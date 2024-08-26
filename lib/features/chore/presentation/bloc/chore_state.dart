part of 'chore_bloc.dart';

class ChoreState extends Equatable {
  const ChoreState({
    required this.chores,
    required this.choreStatus,
    required this.scrollDirection,
  });
  final List<Chore> chores;
  final ChoresStatus choreStatus;
  final ScrollDirection scrollDirection;

  factory ChoreState.initial() {
    return const ChoreState(
      chores: [],
      choreStatus: ChoresStatus.initial,
      scrollDirection: ScrollDirection.idle,
    );
  }

  ChoreState copyWith({
    List<Chore>? chores,
    ChoresStatus? choreStatus,
    ScrollDirection? scrollDirection,
  }) {
    return ChoreState(
      chores: chores ?? this.chores,
      choreStatus: choreStatus ?? this.choreStatus,
      scrollDirection: scrollDirection ?? this.scrollDirection,
    );
  }

  @override
  List<Object> get props => [
        chores,
        choreStatus,
        scrollDirection,
      ];
}
