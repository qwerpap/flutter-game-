import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/bloc.dart';
import '../result/result_screen.dart';

class GameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController guessController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text('Попробуйте угадать!')),
      body: BlocBuilder<GameBloc, GameState>(
        builder: (context, state) {
          if (state is GameInProgress) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Осталось попыток: ${state.remainingAttempts}', style: TextStyle(color: Colors.white, fontSize: 23),),
                  SizedBox(height: 10),
                  TextField(
                    controller: guessController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'Введите число',
                        hintStyle: TextStyle(
                            color: Colors.white)), 
                    style: TextStyle(color: Colors.blue),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      final int guess = int.tryParse(guessController.text) ?? 0;
                      context.read<GameBloc>().add(MakeGuess(guess));
                    },
                    child: Text('Проверить'),
                  ),
                ],
              ),
            );
          } else if (state is GameWon) {
            return ResultScreen(isWin: true);
          } else if (state is GameLost) {
            return ResultScreen(
                isWin: false, correctNumber: state.correctNumber);
          }
          return Container();
        },
      ),
    );
  }
}
