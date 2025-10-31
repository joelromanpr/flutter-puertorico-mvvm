
abstract class HomeEvent {}

class LoadHomeData extends HomeEvent {}

class NavigateTo extends HomeEvent {
  final String route;

  NavigateTo(this.route);
}
