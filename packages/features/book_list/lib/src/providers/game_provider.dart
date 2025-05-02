import 'package:flutter/material.dart';

import '../../../../../repository/model/game.dart';

class GameProvider extends ChangeNotifier {
    List<Game> _games = [];
  List<Game> get games => _games;

  void Addgame(Game game) {
    _games.add(game);
    notifyListeners(); 
}
}