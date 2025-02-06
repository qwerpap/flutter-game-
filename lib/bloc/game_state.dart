// Состояния игры
abstract class GameState {}
class GameInitial extends GameState {}
class GameInProgress extends GameState {
  final int remainingAttempts;
  final int targetNumber;
  GameInProgress(this.remainingAttempts, this.targetNumber);
}
class GameWon extends GameState {}
class GameLost extends GameState {
  final int correctNumber;
  GameLost(this.correctNumber);
}