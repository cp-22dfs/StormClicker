import 'user.dart';

class Game {
  List<User> users = [];
  String password = "";
  int gameNumber = 1;
  String winner = "";
  bool gameStarted = false;
  // string bestPlayer = "";

  Game(List<User> listUser, String passwordWord) {
    users = listUser;
    password = passwordWord;
  }

  void Restart() {
    gameNumber++;
    for (int i = 0; i < users.length; i++) {
      users[i].ready = false;
    }
    gameStarted = false;
  }

  void StartGame() {
    if (CanStartgame()) {
      gameStarted = true;
    }
  }

  bool CanStartgame() {
    return users.length == 2 &&
        users.where((user) => user.ready).length == users.length;
  }

  bool CanBeJoigned() {
    return users.length <= 1;
  }
}
