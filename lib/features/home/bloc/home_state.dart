abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeRequestLoaded extends HomeState {
  String? response;
  HomeRequestLoaded({required this.response});
}
