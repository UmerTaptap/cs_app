part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class FetchGptResponse extends HomeEvent {
  final String userMessage;

  const FetchGptResponse(this.userMessage);

  @override
  List<Object?> get props => [userMessage];
}
