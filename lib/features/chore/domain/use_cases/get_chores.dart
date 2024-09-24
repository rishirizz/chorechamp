import '../entities/chore_entity.dart';
import '../repositories/chores_repository.dart';

class GetChoresUseCase {
  final ChoreRepository repository;

  GetChoresUseCase(this.repository);

  Future<List<ChoreEntity>> call() async {
    return await repository.getChores();
  }
}