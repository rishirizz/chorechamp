import '../entities/chore_entity.dart';
import '../repositories/chores_repository.dart';

class AddChoreUseCase {
  final ChoreRepository repository;

  AddChoreUseCase(this.repository);

  Future<void> call(ChoreEntity chore) async {
    await repository.addChore(chore);
  }
}