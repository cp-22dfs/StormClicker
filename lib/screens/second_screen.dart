import 'package:flutter/material.dart';
import 'join_room_screen.dart';
import 'create_room_screen.dart';

class SecondScreen extends StatelessWidget {
  final String nickname;

  const SecondScreen({super.key, required this.nickname});

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
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildRoundedButton(context, 'Créer salon', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreateRoomScreen(nickname: nickname),
                  ),
                );
              }),
              const SizedBox(height: 20),
              _buildRoundedButton(context, 'Rejoindre un salon', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => JoinRoomScreen(nickname: nickname),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRoundedButton(BuildContext context, String text, VoidCallback onPressed) {
    return SizedBox(
      width: 250,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          backgroundColor: Colors.white.withOpacity(0.8),
          foregroundColor: const Color.fromARGB(255, 104, 58, 168),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        child: Text(text, textAlign: TextAlign.center),
      ),
    );
  }
}
