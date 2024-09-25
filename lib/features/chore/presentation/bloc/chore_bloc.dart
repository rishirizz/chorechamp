import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/rendering.dart';

import '../../../../core/enums/enums.dart';
import '../../domain/entities/chore_entity.dart';

part 'chore_event.dart';
part 'chore_state.dart';

class ChoreBloc extends Bloc<ChoreEvent, ChoreState> {
  ChoreBloc() : super(ChoreState.initial()) {
    on<FetchChores>(_fetchChores);
    on<AddChore>(_addChore);
    on<UpdateChore>(_updateChore);
    // on<DeleteChore>(_deleteChore);
    on<OnScroll>(_onScroll);
  }

  _fetchChores(FetchChores event, Emitter<ChoreState> emit) async {
    emit(
      state.copyWith(
        choreStatus: ChoresStatus.loading,
        isChoreAdded: false,
      ),
    );
    await Future.delayed(
      const Duration(
        seconds: 2,
      ),
    );
    emit(
      state.copyWith(
        choreStatus: ChoresStatus.success,
        scrollDirection: ScrollDirection.idle,
      ),
    );
  }

  _addChore(AddChore event, Emitter<ChoreState> emit) async {
    List<ChoreEntity> chores = List<ChoreEntity>.from(state.chores);
    emit(
      state.copyWith(
        choreStatus: ChoresStatus.loading,
        isChoreAdded: false,
      ),
    );
    await Future.delayed(
      const Duration(
        milliseconds: 500,
      ),
    );
    chores.add(event.chore);
    emit(
      state.copyWith(
        choreStatus: ChoresStatus.success,
        isChoreAdded: true,
        chores: chores,
      ),
    );
  }

  _updateChore(UpdateChore event, Emitter<ChoreState> emit) {}

  // _deleteChore(DeleteChore event, Emitter<ChoreState> emit) async {
  //   List<ChoreEntity> chores = List<ChoreEntity>.from(state.chores);
  //   emit(
  //     state.copyWith(choreStatus: ChoresStatus.loading),
  //   );
  //   await Future.delayed(
  //     const Duration(
  //       milliseconds: 500,
  //     ),
  //   );
  //   chores.removeWhere((chore) => chore.id == event.chore.id);
  //   emit(
  //     state.copyWith(
  //       choreStatus: ChoresStatus.success,
  //       chores: chores,
  //     ),
  //   );
  // }

  _onScroll(OnScroll event, Emitter<ChoreState> emit) {
    emit(
      state.copyWith(
        scrollDirection: event.scrollDirection,
        isChoreAdded: false,
      ),
    );
  }
}
