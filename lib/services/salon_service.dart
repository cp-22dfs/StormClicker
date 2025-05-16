import 'dart:math';

class SalonService {
  static final Map<String, List<String>> _salons = {};

  static String createSalon(String nickname) {
    final code = _generateCode();
    _salons[code] = [nickname];
    return code;
  }

  static bool joinSalon(String code, String nickname) {
    if (_salons.containsKey(code) && _salons[code]!.length < 2) {
      _salons[code]!.add(nickname);
      return true;
    }
    return false;
  }

  static List<String>? getPlayers(String code) => _salons[code];

  static String _generateCode() {
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final rand = Random();
    return List.generate(4, (index) => chars[rand.nextInt(chars.length)]).join();
  }
}
