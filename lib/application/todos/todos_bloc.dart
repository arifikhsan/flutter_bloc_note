import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_todo/domain/model/todo_model.dart';
import 'package:flutter_bloc_todo/domain/repository/todos_repository.dart';

part 'todos_event.dart';
part 'todos_state.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  final TodosRepository todosRepository;

  TodosBloc({
    @required this.todosRepository,
  });

  @override
  TodosState get initialState => TodosLoadInProgress();

  @override
  Stream<TodosState> mapEventToState(
    TodosEvent event,
  ) async* {
    if (event is TodosLoadSuccess) {
      yield* _mapTodosLoadedToState();
    } else if (event is TodosAdded) {
      yield* _mapTodosAddedToState();
    } else if (event is TodosUpdated) {
      yield* _mapTodosUpdatedToState();
    } else if (event is TodosDeleted) {
      yield* _mapTodosDeletedToState();
    } else if (event is ToggleAll) {
      yield* _mapToggleAllToState();
    } else if (event is ClearCompleted) {
      yield* _mapClearCompletedToState();
    }
  }

  Stream<TodosState> _mapTodosLoadedToState() async* {
    try {
      final todos = await this.todosRepository.loadTodos();
      yield TodosLoadSuccess(
        todos.map(TodoModel.fromEntity).toList(),
      );
    } catch (_) {
      yield TodosLoadFailure();
    }
  }

  Stream<TodosState> _mapTodosAddedToState() async* {
    if (state is TodosLoadSuccess) {
      final List<TodoModel> updatedTodos = List.from((state as TodosLoadSuccess).todos)..add(event.todo) ;
      yield TodosLoadSuccess(updatedTodos);
      _saveTodos(updatedTodos);
    }
  }

  Stream<TodosState> _mapTodosUpdatedToState() async* {
    if (state is TodosLoadSuccess) {
      final List<TodoModel> updatedTodos = (state as TodosLoadSuccess).todos
    }
  }

  Stream<TodosState> _mapTodosDeletedToState() async* {}
  Stream<TodosState> _mapToggleAllToState() async* {}
  Stream<TodosState> _mapClearCompletedToState() async* {}

  Future _saveTodos(List<TodoModel> todos) {
    return todosRepository.saveTodos(
      todos.map((todo) => todo.toEntity()).toList(),
    );
  }
}
