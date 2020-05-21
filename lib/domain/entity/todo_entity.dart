class TodoEntity {
  final String id;
  final String note;
  final String task;
  final bool complete;

  TodoEntity(this.id, this.note, this.task, this.complete);

  @override
  int get hashCode =>
      id.hashCode ^ task.hashCode ^ note.hashCode ^ complete.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodoEntity &&
          id == other.id &&
          note == other.note &&
          task == other.task &&
          complete == other.complete &&
          runtimeType == other.runtimeType;

  Map<String, Object> toJson() {
    return {
      'complete': complete,
      'task': task,
      'note': note,
      'id': id,
    };
  }

  @override
  String toString() =>
      'TodoEntity {id: $id, task: $task, note: $note, complete: $complete} ';

  static TodoEntity fromJson(Map<String, Object> json) {
    return TodoEntity(
      json['id'] as String,
      json['task'] as String,
      json['note'] as String,
      json['complete'] as bool,
    );
  }
}
