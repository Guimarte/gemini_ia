import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemini_click/features/home/bloc/home_event.dart';
import 'package:gemini_click/features/home/bloc/home_state.dart';
import 'package:gemini_click/features/home/domain/usecase/home_usecase.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<HomeEventRequest>(_requestGemini);
    on<HomeSetInitialEvent>(_resetEvent);
  }

  void _requestGemini(HomeEventRequest event, Emitter emitter) async {
    emitter(HomeLoadingState());
    final response = await GetGeminiAnswerImplementation().call(
      question: event.answer,
    );

    emitter(HomeRequestLoaded(response: response));
  }

  void _resetEvent(HomeSetInitialEvent event, Emitter emitter) {
    emitter(HomeLoadingState());

    Future.delayed(Duration(seconds: 2));

    emitter(HomeInitialState());
  }
}
