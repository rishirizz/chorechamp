import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/rendering.dart';

import '../../../core/enums.dart';
import '../model/chore_model.dart';

part 'chore_event.dart';
part 'chore_state.dart';

class ChoreBloc extends Bloc<ChoreEvent, ChoreState> {
  ChoreBloc() : super(ChoreState.initial()) {
    on<FetchChores>(_fetchChores);
    on<AddChore>(_addChore);
    on<UpdateChore>(_updateChore);
    on<DeleteChore>(_deleteChore);
    on<OnScroll>(_onScroll);
  }

  _fetchChores(FetchChores event, Emitter<ChoreState> emit) async {
    emit(
      state.copyWith(
        choreStatus: ChoresStatus.loading,
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
      ),
    );
  }

  _addChore(AddChore event, Emitter<ChoreState> emit) async {
    List<Chore> chores = List<Chore>.from(state.chores);
    emit(
      state.copyWith(choreStatus: ChoresStatus.loading),
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
        chores: chores,
      ),
    );
  }

  _updateChore(UpdateChore event, Emitter<ChoreState> emit) {}

  _deleteChore(DeleteChore event, Emitter<ChoreState> emit) async {
    List<Chore> chores = List<Chore>.from(state.chores);
    emit(
      state.copyWith(choreStatus: ChoresStatus.loading),
    );
    await Future.delayed(
      const Duration(
        milliseconds: 500,
      ),
    );
    chores.removeWhere((chore) => chore.id == event.chore.id);
    emit(
      state.copyWith(
        choreStatus: ChoresStatus.success,
        chores: chores,
      ),
    );
  }

  _onScroll(OnScroll event, Emitter<ChoreState> emit) {
    emit(
      state.copyWith(
        scrollDirection: event.scrollDirection,
      ),
    );
  }
}
