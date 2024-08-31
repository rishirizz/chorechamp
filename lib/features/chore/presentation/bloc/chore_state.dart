part of 'chore_bloc.dart';

class ChoreState extends Equatable {
  const ChoreState({
    required this.chores,
    required this.choreStatus,
    required this.scrollDirection,
    required this.isChoreAdded,
  });
  final List<Chore> chores;
  final ChoresStatus choreStatus;
  final ScrollDirection scrollDirection;
  final bool isChoreAdded;

  factory ChoreState.initial() {
    return const ChoreState(
      chores: [],
      choreStatus: ChoresStatus.initial,
      scrollDirection: ScrollDirection.idle,
      isChoreAdded: false,
    );
  }

  ChoreState copyWith({
    List<Chore>? chores,
    ChoresStatus? choreStatus,
    ScrollDirection? scrollDirection,
    bool? isChoreAdded,
  }) {
    return ChoreState(
      chores: chores ?? this.chores,
      choreStatus: choreStatus ?? this.choreStatus,
      scrollDirection: scrollDirection ?? this.scrollDirection,
      isChoreAdded: isChoreAdded ?? this.isChoreAdded,
    );
  }

  @override
  List<Object> get props => [
        chores,
        choreStatus,
        scrollDirection,
        isChoreAdded,
      ];
}
