import 'package:chorechamp/features/chore/domain/entities/chore_entity.dart';

class ChoreModel extends ChoreEntity {
  const ChoreModel({
    super.id,
    super.title,
    super.description,
    super.dateTime,
  });

  factory ChoreModel.fromJson(Map<String, dynamic> map) {
    return ChoreModel(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      dateTime: map['dateTime'] ?? '',
    );
  }

  factory ChoreModel.fromEntity(ChoreEntity entity) {
    return ChoreModel(
      id: entity.id,
      title: entity.title,
      description: entity.description,
      dateTime: entity.dateTime,
    );
  }
}
