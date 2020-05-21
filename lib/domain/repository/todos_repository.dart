import 'package:flutter_bloc_todo/domain/entity/todo_entity.dart';

abstract class TodosRepository {
  Future<List<TodoEntity>> loadTodos();
  Future saveTodos(List<TodoEntity> todosEntity);
}
