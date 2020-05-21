part of 'todos_bloc.dart';

abstract class TodosEvent extends Equatable {
  const TodosEvent();

  @override
  List<Object> get props => [];
}

class TodosLoadSuccess extends TodosEvent {
  TodosLoadSuccess(List list);
}

class TodosAdded extends TodosEvent {
  final TodoModel todoModel;

  TodosAdded(this.todoModel);

  @override
  List<Object> get props => [todoModel];

  @override
  String toString() {
    return 'TodoAdded { todo: $todoModel }';
  }
}

class TodosUpdated extends TodosEvent {
  final TodoModel todoModel;

  TodosUpdated(this.todoModel);

  @override
  List<Object> get props => [todoModel];

  @override
  String toString() {
    return 'TodosUpdated { todo: $todoModel }';
  }
}

class TodosDeleted extends TodosEvent {
  final TodoModel todoModel;

  TodosDeleted(this.todoModel);

  @override
  List<Object> get props => [todoModel];

  @override
  String toString() {
    return 'TodosDeleted { todo: $todoModel }';
  }
}

class ClearCompleted extends TodosEvent {}

class ToggleAll extends TodosEvent {}
