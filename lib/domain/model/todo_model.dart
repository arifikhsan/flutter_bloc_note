import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_todo/domain/entity/todo_entity.dart';
import 'package:uuid/uuid.dart';

class TodoModel extends Equatable {
  final String id;
  final String note;
  final String task;
  final bool complete;

  TodoModel({
    id,
    note = '',
    this.task,
    this.complete = false,
  })  : this.note = note ?? '',
        this.id = id ?? Uuid().v4();

  TodoModel copyWith({
    String id,
    String note,
    String task,
    bool complete,
  }) {
    return TodoModel(
      id: id ?? this.id,
      note: note ?? this.note,
      task: task ?? this.task,
      complete: complete ?? this.complete,
    );
  }

  @override
  List<Object> get props => [
        id,
        note,
        task,
        complete,
      ];

  @override
  String toString() {
    return 'Todo { id: $id, note: $note, task: $task, complete: $complete }';
  }

  TodoEntity toEntity() {
    return TodoEntity(
      id,
      note,
      task,
      complete,
    );
  }
}
