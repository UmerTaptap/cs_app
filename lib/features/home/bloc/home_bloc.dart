import 'package:bloc/bloc.dart';
import 'package:cs_app/config/tts/tts_provider.dart';
import 'package:equatable/equatable.dart';

import '../model/message_model.dart';
import '../repository/home_repository.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository _homeRepository;
  HomeBloc(this._homeRepository) : super(HomeInitial()) {
    on<FetchGptResponse>(_onFetchGptResponse);
  }

  void _onFetchGptResponse(FetchGptResponse event, Emitter<HomeState> emit) async {
    try {
      MessageModel userMessage = MessageModel(
        text: event.userMessage,
        isMe: true,
        time: DateTime.now().toString(),
        isSeen: true,
        isDelivered: true,
      );
      // TtsProvider().stop();
      emit(state.copyWith(messages: [...state.messages, userMessage]));

      emit(HomeBotTypingStart(state.copyWith(messages: state.messages).messages));

      final data = await _homeRepository.getMessageResponse(message: event.userMessage);

      // TtsProvider().speak(data.fold((l) => 'Sorry, I don\'t understand', (r) => r));

      emit(HomeBotTypingEnd(state.copyWith(messages: state.messages).messages));


      data.fold(
        (f) {
          MessageModel error = MessageModel(
            text: f.message,
            isMe: false,
            time: DateTime.now().toString(),
            isSeen: true,
            isDelivered: true,
          );
          emit(state.copyWith(messages: [...state.messages, error]));
        },
        (s) {
          MessageModel gptAnswer = MessageModel(
            text: s,
            isMe: false,
            time: DateTime.now().toString(),
            isSeen: true,
            isDelivered: true,
          );
          emit(state.copyWith(messages: [...state.messages, gptAnswer]));
        },
      );
    } catch (e) {
      emit(state.copyWith(messages: [...state.messages, MessageModel(
        text: "Sorry, I don't understand",
        isMe: false,
        time: DateTime.now().toString(),
        isSeen: true,
        isDelivered: true,
      )]));
    }
  }
}
