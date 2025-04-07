class HomeEvent {}

class HomeEventRequest extends HomeEvent {
  String answer;
  HomeEventRequest({required this.answer});
}

class HomeSetInitialEvent extends HomeEvent {}
