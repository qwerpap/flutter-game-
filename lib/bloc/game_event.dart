
abstract class GameEvent {}
class StartGame extends GameEvent {
  final int n;
  final int m;
  StartGame(this.n, this.m);
}
class MakeGuess extends GameEvent {
  final int guess;
  MakeGuess(this.guess);
}
class ResetGame extends GameEvent {}