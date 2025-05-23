import 'package:flutter_test/flutter_test.dart';

import '../packages/features/book_list/lib/src/providers/game_provider.dart';
import '../packages/repository/model/game.dart';
import '../packages/repository/model/user.dart';

void main(){

  late GameProvider provider;
  late Game game;
  
  setUp(() {
    provider = GameProvider();
    game = Game(password: "12345", users: []);
  });

  test('addGame adds a Game', () {
    provider.addGame(game);
    expect(provider.games.length, 1);
  });
  
  test('removeGame removes a Game by id', () {
    provider.addGame(game);
    provider.removeGame(game.id);
    expect(provider.games.length, 0);
  });
  
  test('changeGamePassword change the password of the Game', () {
    provider.addGame(game);
    provider.changeGamePassword(game.id, "98765");
    expect(provider.games[0].password, "98765");
  });
  
  test('addUser should add a User to a Game if it has not started', () {
    provider.addGame(game);
    provider.addUser(game.id, User(pseudo: "Hello"));
    expect(provider.games[0].users.length, 1);
  });
}