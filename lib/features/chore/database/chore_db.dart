import 'package:hive/hive.dart';
part 'chore_db.g.dart';

@HiveType(typeId: 0)
class ChoreHive extends HiveObject {
  @HiveField(0)
  String? id;

  @HiveField(1)
  String? title;

  @HiveField(2)
  String? description;

  @HiveField(3)
  String? dateTime;
}
