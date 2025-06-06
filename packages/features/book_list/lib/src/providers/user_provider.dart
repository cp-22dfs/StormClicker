import 'package:flutter/material.dart';
import '../../../../../repository/model/game.dart';
import '../../../../../repository/model/user.dart';

class UserProvider with ChangeNotifier {
  List<User> _users = [];
  List<User> get users => _users;

  void addUser(User user) {
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
      _users[index].ready = true;
      notifyListeners();
    }
  }

  void joinGame(Game game, String id, String password) {
    if (game.canBeJoigned() && game.password == password) {
      game.users.add(_users.firstWhere((u) => u.id == id));
      notifyListeners();
    }
  }
}
