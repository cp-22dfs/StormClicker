import 'dart:math';

class Room {
  final String host;
  String? guest;
  bool hostReady = false;
  bool guestReady = false;
  int hostScore = 0;
  int guestScore = 0;

  Room(this.host);
}

class SalonService {
  static final Map<String, Room> _rooms = {};

  static String createSalon(String nickname) {
    final code = _generateCode();
    _rooms[code] = Room(nickname);
    return code;
  }

  static bool joinSalon(String code, String nickname) {
    final room = _rooms[code];
    if (room != null && room.guest == null) {
      room.guest = nickname;
      return true;
    }
    return false;
  }

  static Room? getRoom(String code) => _rooms[code];

  static void setReady(String code, String nickname) {
    final room = _rooms[code];
    if (room == null) return;
    if (room.host == nickname) {
      room.hostReady = true;
    } else if (room.guest == nickname) {
      room.guestReady = true;
    }
  }

  static bool allReady(String code) {
    final room = _rooms[code];
    if (room == null) return false;
    return room.hostReady && room.guestReady && room.guest != null;
  }

  static void incrementScore(String code, String nickname) {
    final room = _rooms[code];
    if (room == null) return;
    if (room.host == nickname) {
      room.hostScore++;
    } else if (room.guest == nickname) {
      room.guestScore++;
    }
  }

  static Map<String, int>? getScores(String code) {
    final room = _rooms[code];
    if (room == null) return null;
    return {
      room.host: room.hostScore,
      if (room.guest != null) room.guest!: room.guestScore,
    };
  }

  static String _generateCode() {
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final rand = Random();
    return List.generate(4, (index) => chars[rand.nextInt(chars.length)]).join();
  }
}
