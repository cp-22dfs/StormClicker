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

  Game({String? id,  this.users = const [], required this.password,}): id = id ?? uuid.v4();


  void restart(){
    gameNumber++;
    for(int i = 0; i<users.length; i++){
      users[i].ready = false;
    }
    winner = "";
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
    return users.length <= 1 && !gameStarted;
  }

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      id: json['id'],
      users: json['users'],
      password: json['password']
    );
  }

  @override
  String toString() {
    return 'Game(id: \$id, users : \$users , password : \$password )';
  }
}
