part of 'home_bloc.dart';

class HomeState extends Equatable {
  List<MessageModel> messages = [];

  HomeState(this.messages);

  // copy with
  HomeState copyWith({
    List<MessageModel>? messages,
  }) {
    return HomeState(
      messages ?? this.messages,
    );
  }

  @override
  List<Object?> get props => [messages];
}

class HomeInitial extends HomeState {
  HomeInitial() : super([]);

  @override
  List<Object?> get props => [];
}

class HomeLoaded extends HomeState {
  HomeLoaded(List<MessageModel> messages) : super(messages);

  @override
  List<Object?> get props => [messages];
}

class HomeError extends HomeState {
  final String error;

  HomeError(this.error) : super([]);

  @override
  List<Object?> get props => [error];
}

class HomeBotTypingStart extends HomeState {
  HomeBotTypingStart(List<MessageModel> messages) : super(messages);

  @override
  List<Object?> get props => [messages];
}

class HomeBotTypingEnd extends HomeState {
  HomeBotTypingEnd(List<MessageModel> messages) : super(messages);

  @override
  List<Object?> get props => [messages];
}
