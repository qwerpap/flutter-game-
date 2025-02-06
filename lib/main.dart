import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/bloc.dart';
import 'screens/screens.dart';
import 'theme.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GameBloc(),
      child: MaterialApp(
        title: 'Угадай число',
        theme: themeData,
        home: BlocBuilder<GameBloc, GameState>(
          builder: (context, state) {
            if (state is GameInitial) {
              return HomeScreen();
            } else if (state is GameInProgress) {
              return GameScreen();
            } else if (state is GameWon) {
              return ResultScreen(isWin: true);
            } else if (state is GameLost) {
              return ResultScreen(isWin: false, correctNumber: state.correctNumber);
            }
            return HomeScreen();
          },
        ),
      ),
    );
  }
}