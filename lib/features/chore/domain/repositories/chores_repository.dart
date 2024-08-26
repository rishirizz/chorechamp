import '../entities/chore_model.dart';

abstract class ChoreRepository {
  Future<List<Chore>> getChores();
  Future<void> addChore(Chore chore);
  Future<void> updateChore(Chore chore);
  Future<void> deleteChore(String id);
}
