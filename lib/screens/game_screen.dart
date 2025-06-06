import 'package:flutter/material.dart';
import '../services/salon_service.dart';

class GameScreen extends StatefulWidget {
  final String code;
  final String nickname;
  const GameScreen({super.key, required this.code, required this.nickname});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  bool started = false;
  bool ended = false;
  int localCount = 0;
  Color background = Colors.red;
  Map<String, int>? scores;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        started = true;
        background = Colors.green;
      });
      Future.delayed(const Duration(seconds: 5), () {
        setState(() {
          ended = true;
          scores = SalonService.getScores(widget.code);
        });
      });
    });
  }

  void _tap() {
    if (started && !ended) {
      setState(() => localCount++);
      SalonService.incrementScore(widget.code, widget.nickname);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (ended) {
      final entries = scores?.entries.toList() ?? [];
      return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Resultat',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              for (final e in entries)
                Text('${e.key}: ${e.value}',
                    style: const TextStyle(fontSize: 20)),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Fermer'),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: background,
      body: GestureDetector(
        onTap: _tap,
        child: Center(
          child: Text(
            started ? '$localCount' : 'Pret...',
            style: const TextStyle(fontSize: 32, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
