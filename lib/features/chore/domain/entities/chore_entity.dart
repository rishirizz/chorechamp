import 'package:equatable/equatable.dart';

class ChoreEntity extends Equatable {
  final String? id;
  final String? title;
  final String? description;
  final DateTime? dateTime;

  const ChoreEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.dateTime,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        dateTime,
      ];
}
