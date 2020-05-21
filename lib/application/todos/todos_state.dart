part of 'todos_bloc.dart';

abstract class TodosState extends Equatable {
  const TodosState();

  @override
  List<Object> get props => [];
}

class TodosLoadInProgress extends TodosState {}

class TodosLoadSuccess extends TodosState {
  final List<TodoModel> todos;

  TodosLoadSuccess([this.todos = const []]);
}

class TodosLoadFailure extends TodosState {}
