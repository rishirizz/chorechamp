import '../repositories/chores_repository.dart';

class DeleteChoreUseCase {
  final ChoreRepository repository;

  DeleteChoreUseCase(this.repository);

  Future<void> call(String id) async {
    await repository.deleteChore(id);
  }
}