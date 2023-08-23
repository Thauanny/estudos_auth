import 'package:estudo_auth/src/modules/home/domain/usecases/example_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:estudo_auth/src/modules/home/presentation/pages/bloc/home_event.dart';
import 'package:estudo_auth/src/modules/home/presentation/pages/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required this.exampleUseCase,
  }) : super(HomeInitial()) {
    on(_onEvent);
  }

  final ExampleUseCase exampleUseCase;

  Future<void> _onEvent(HomeEvent event, Emitter<HomeState> emit) async {
    switch (event.runtimeType) {
      case HomeEventExample:
        _example(emit: emit, useCase: exampleUseCase);
        break;
      default:
    }
  }

  void _example({
    required Emitter<HomeState> emit,
    required ExampleUseCase useCase,
  }) async {
    final result = await exampleUseCase();
    result.fold(
      (l) => emit(HomeExampleError()),
      (r) => emit(HomeExampleSucess()),
    );
  }
}
