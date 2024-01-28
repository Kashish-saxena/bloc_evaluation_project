abstract class ApiEvent {
  const ApiEvent();
  List<Object> get props => [];
}

class GetApiList extends ApiEvent {}

class DeleteList extends ApiEvent {
  int userId;
  DeleteList(this.userId);
}

