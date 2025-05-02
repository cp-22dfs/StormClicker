import 'user.dart';
import 'package:uuid/uuid.dart';

Uuid uuid = Uuid();

class Game {
  String id = "";
  List<User> users = [];
  String password = "";
  int gameNumber = 1;
  String winner = "";
  bool gameStarted = false;
  // string bestPlayer = "";

  Game({String? id, required this.users, this.password = "12345",}): id = id ?? uuid.v4();

  void Restart() {
    gameNumber++;
    for (int i = 0; i < users.length; i++) {
      users[i].ready = false;
    }
    gameStarted = false;
  }

  void startGame(){
    if(canStartgame()){
      gameStarted = true;
    }
  }

  bool canStartgame(){
    return users.length == 2 && users.where((user) => user.ready).length == users.length;
  }

  bool canBeJoigned(){
    return users.length <= 1;
  }
}
