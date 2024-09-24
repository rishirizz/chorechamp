import '../entities/chore_entity.dart';
import '../repositories/chores_repository.dart';

class UpdateChoreUseCase {
  final ChoreRepository repository;

  UpdateChoreUseCase(this.repository);

  Future<void> call(ChoreEntity chore) async {
    await repository.updateChore(chore);
  }
}
