import 'package:flutter/material.dart';
import 'dart:async';
import '../widgets/timer_display.dart';
import '../widgets/timer_button.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Stopwatch _stopwatch;
  late Timer _timer;
  String _elapsedTime = '00:00:00';

  @override
  void initState() {
    super.initState();
    _stopwatch = Stopwatch();
    _timer = Timer.periodic(Duration(seconds: 1), _updateTime);
  }

  void _updateTime(Timer timer) {
    if (_stopwatch.isRunning) {
      setState(() {
        _elapsedTime = _formatTime(_stopwatch.elapsed);
      });
    }
  }

  String _formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    String twoDigitHours = twoDigits(duration.inHours);
    return "$twoDigitHours:$twoDigitMinutes:$twoDigitSeconds";
  }

  void _startStopwatch() {
    setState(() {
      _stopwatch.start();
    });
  }

  void _stopStopwatch() {
    setState(() {
      _stopwatch.stop();
    });
  }

  void _resetStopwatch() {
    setState(() {
      _stopwatch.reset();
      _elapsedTime = '00:00:00';
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cronômetro'),
      ),
      body: Stack(
        children: <Widget>[
          // Imagem de fundo
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Conteúdo sobre a imagem
          Align(
            alignment: Alignment.topCenter, // Alinha a coluna no topo
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 220.0), // Ajusta o padding conforme necessário
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TimerDisplay(time: _elapsedTime),
                  SizedBox(height: 1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TimerButton(
                        text: 'Iniciar',
                        color: Colors.green,
                        onPressed: _startStopwatch,
                      ),
                      SizedBox(width: 10),
                      TimerButton(
                        text: 'Pausar',
                        color: Colors.yellow,
                        onPressed: _stopStopwatch,
                      ),
                      SizedBox(width: 10),
                      TimerButton(
                        text: 'Zerar',
                        color: Colors.red,
                        onPressed: _resetStopwatch,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
