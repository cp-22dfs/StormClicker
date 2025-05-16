import 'package:flutter/material.dart';

import '../../../../../repository/model/game.dart';
import '../../../../../repository/model/user.dart';

class GameProvider extends ChangeNotifier {
  final List<Game> _games = [];
  List<Game> get games => _games;

  void addgame(Game game) {
    _games.add(game);
    notifyListeners(); 
  }

  void changeGamePassword(String gameId, String newPassword){
    _games.firstWhere((game) => game.id == gameId).password = newPassword;
    notifyListeners();
  }

  void removeGame(String gameId){
    _games.removeWhere((game) => game.id == gameId);
    notifyListeners();
  }

  void addUser(String gameId, User user){
    final game = _games.firstWhere((game) => game.id == gameId);
    if(game.canBeJoigned()){
      game.users.add(user);
      notifyListeners();
    }
  }
}