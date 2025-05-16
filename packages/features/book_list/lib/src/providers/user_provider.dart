import 'package:flutter/material.dart';
import '../../../../../repository/model/game.dart';
import '../../../../../repository/model/user.dart';

class UserProvider with ChangeNotifier {
  List<User> _users = [];
  List<User> get users => _users;

  void AddUser(User user) {
    _users.add(user);
    notifyListeners();
  }

  void deleteUser(String id) {
    _users.removeWhere((user) => user.id == id);
    notifyListeners();
  }

  void ready(String id) {
    final index = _users.indexWhere((user) => user.id == id);
    if (index != -1) {
      final ancienUser = _users[index];
      _users[index] = User(
        id: ancienUser.id,
        pseudo: ancienUser.pseudo,
        ready: !ancienUser.ready,
      );
      notifyListeners();
    }
  }

  void joinGame(Game game, String id) {
    final index = _users.indexWhere((user) => user.id == id);
  }
}
