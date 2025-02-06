import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/bloc.dart';
import '../game/game_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController nController = TextEditingController();
    final TextEditingController mController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text('Угадай число')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'Угадать число от 0 до ...',
                  hintStyle:
                      TextStyle(color: Colors.white)), // change hint text color
              style: TextStyle(color: Colors.blue),
            ),
            TextField(
              controller: mController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'Введите количество попыток',
                  hintStyle:
                      TextStyle(color: Colors.white)), // change hint text color
              style: TextStyle(color: Colors.blue),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final int n = int.tryParse(nController.text) ?? 10;
                final int m = int.tryParse(mController.text) ?? 5;
                context.read<GameBloc>().add(StartGame(n, m));
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GameScreen()),
                );
              },
              child: Text('Начать игру'),
            ),
          ],
        ),
      ),
    );
  }
}
