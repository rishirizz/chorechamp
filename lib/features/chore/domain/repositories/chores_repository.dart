import '../entities/chore_entity.dart';

abstract class ChoreRepository {
  Future<List<ChoreEntity>> getChores();
  Future<void> addChore(ChoreEntity chore);
  Future<void> updateChore(ChoreEntity chore);
  Future<void> deleteChore(String id);
}
