import 'package:flutter/material.dart';
import '../services/salon_service.dart';
import 'game_screen.dart';

class CreateRoomScreen extends StatefulWidget {
  final String nickname;
  const CreateRoomScreen({super.key, required this.nickname});

  @override
  State<CreateRoomScreen> createState() => _CreateRoomScreenState();
}

class _CreateRoomScreenState extends State<CreateRoomScreen> {
  late final String code;
  bool ready = false;

  @override
  void initState() {
    super.initState();
    code = SalonService.createSalon(widget.nickname);
  }

  @override
  Widget build(BuildContext context) {
    final room = SalonService.getRoom(code);
    final joined = room?.guest != null;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Code: $code', style: const TextStyle(fontSize: 24, color: Color.fromARGB(255, 104, 58, 168))),
              const SizedBox(height: 20),
              Text(joined ? 'Un joueur a rejoint !' : 'En attente de joueur...', style: const TextStyle(fontSize: 18)),
              const SizedBox(height: 20),
              if (joined) _buildReadyButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildReadyButton() {
    return ElevatedButton(
      onPressed: () {
        SalonService.setReady(code, widget.nickname);
        setState(() {
          ready = true;
        });
        if (SalonService.allReady(code)) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => GameScreen(code: code, nickname: widget.nickname),
            ),
          );
        }
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        backgroundColor: Colors.white70,
        foregroundColor: const Color.fromARGB(255, 104, 58, 168),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      child: Text(ready ? 'Pret !' : 'Pret ?'),
    );
  }
}
