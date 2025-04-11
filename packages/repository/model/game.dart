<<<<<<< HEAD
class Game {}
=======
import 'user.dart';

class Game {
  List<User> users = [];

  Game({List<User>? listUser}){
    if(listUser == null){
      users = [new User(), new User()];
    }
    else{
      users = listUser;
    }
  }
}
>>>>>>> origin/main
