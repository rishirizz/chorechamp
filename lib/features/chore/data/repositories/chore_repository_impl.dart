import 'package:chorechamp/features/chore/domain/entities/chore_entity.dart';
import 'package:chorechamp/features/chore/domain/repositories/chores_repository.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../database/chore_db.dart';
import '../model/chore_model.dart';

class ChoreRepositoryImplementation extends ChoreRepository {
  final Box<ChoreHive> choreBox;

  ChoreRepositoryImplementation(this.choreBox);

  @override
  Future<List<ChoreEntity>> getChores() async {
    final chores = choreBox.values.toList();
    return chores
        .map((chore) => ChoreModel(
              id: chore.id,
              title: chore.title,
              description: chore.description,
              dateTime: DateTime.parse(chore.dateTime ?? ''),
            ))
        .toList();
  }

  @override
  Future<void> addChore(ChoreEntity chore) async {
    final choreModel = ChoreModel.fromEntity(chore);
    final choreHive = ChoreHive()
      ..id = choreModel.id
      ..title = choreModel.title
      ..description = choreModel.description
      ..dateTime = choreModel.dateTime?.toIso8601String();
    await choreBox.put(choreModel.id, choreHive);
  }

  @override
  Future<void> updateChore(ChoreEntity chore) async {
    final choreModel = ChoreModel.fromEntity(chore);
    final choreHive = choreBox.get(choreModel.id);
    if (choreHive != null) {
      choreHive
        ..title = choreModel.title
        ..description = choreModel.description
        ..dateTime = choreModel.dateTime?.toIso8601String();
      await choreHive.save();
    }
  }

  @override
  Future<void> deleteChore(String id) async {
    await choreBox.delete(id);
  }
}
