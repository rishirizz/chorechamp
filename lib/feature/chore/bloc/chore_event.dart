part of 'chore_bloc.dart';

class ChoreEvent extends Equatable {
  const ChoreEvent();

  @override
  List<Object> get props => [];
}

class FetchChores extends ChoreEvent {}

class AddChore extends ChoreEvent {
  const AddChore({required this.chore});

  final Chore chore;

  @override
  List<Object> get props => [chore];
}

class UpdateChore extends ChoreEvent {}

class DeleteChore extends ChoreEvent {
  const DeleteChore({required this.chore});

  final Chore chore;

  @override
  List<Object> get props => [chore];
}

class OnScroll extends ChoreEvent {
  const OnScroll({required this.scrollDirection});

  final ScrollDirection scrollDirection;

  @override
  List<Object> get props => [scrollDirection];
}
