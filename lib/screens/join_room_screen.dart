import 'package:flutter/material.dart';
import '../services/salon_service.dart';
import 'game_screen.dart';

class JoinRoomScreen extends StatefulWidget {
  final String nickname;

  const JoinRoomScreen({super.key, required this.nickname});

  @override
  State<JoinRoomScreen> createState() => _JoinRoomScreenState();
}

class _JoinRoomScreenState extends State<JoinRoomScreen> {
  final TextEditingController _controller = TextEditingController();
  String? error;

  @override
  Widget build(BuildContext context) {
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
        child: Stack(
          children: [
            Positioned(
              top: 20,
              left: 20,
              child: Text(
                widget.nickname,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Rejoindre salon',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color:  Color.fromARGB(255, 104, 58, 168),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: 250,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        hintText: 'Code...',
                        border: InputBorder.none,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      final code = _controller.text.trim();
                      if (SalonService.joinSalon(code, widget.nickname)) {
                        SalonService.setReady(code, widget.nickname);
                        if (SalonService.allReady(code)) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => GameScreen(code: code, nickname: widget.nickname),
                            ),
                          );
                        }
                      } else {
                        setState(() => error = 'Code invalide');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white.withOpacity(0.8),
                      foregroundColor: const Color.fromARGB(255, 104, 58, 168),
                    ),
                    child: const Text('Rejoindre'),
                  ),
                  if (error != null) ...[
                    const SizedBox(height: 10),
                    Text(error!, style: const TextStyle(color: Colors.red)),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
