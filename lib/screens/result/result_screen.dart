// Экран результата
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/bloc.dart';

class ResultScreen extends StatelessWidget {
  final bool isWin;
  final int? correctNumber;

  const ResultScreen({required this.isWin, this.correctNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isWin ? 'Поздравляем! Вы угадали число!' : 'Вы проиграли. Загаданное число: $correctNumber',
              style: TextStyle(fontSize: 24, color: isWin ? Colors.green : Colors.red),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.read<GameBloc>().add(ResetGame());
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: Text('Начать заново'),
            ),
          ],
        ),
      ),
    );
  }
}
