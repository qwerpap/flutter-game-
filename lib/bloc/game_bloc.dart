
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_game/bloc/bloc.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  int? _targetNumber;
  int? _remainingAttempts;

  GameBloc() : super(GameInitial()) {
    on<StartGame>((event, emit) {
      _targetNumber = Random().nextInt(event.n) + 1;
      _remainingAttempts = event.m;
      emit(GameInProgress(_remainingAttempts!, _targetNumber!));
    });

    on<MakeGuess>((event, emit) {
      if (_remainingAttempts == null || _targetNumber == null) return;

      _remainingAttempts = _remainingAttempts! - 1;
      if (event.guess == _targetNumber) {
        emit(GameWon());
      } else if (_remainingAttempts! <= 0) {
        emit(GameLost(_targetNumber!));
      } else {
        emit(GameInProgress(_remainingAttempts!, _targetNumber!));
      }
    });

    on<ResetGame>((event, emit) {
      _targetNumber = null;
      _remainingAttempts = null;
      emit(GameInitial());
    });
  }
}
