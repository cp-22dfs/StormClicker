import 'package:flutter_test/flutter_test.dart';

import '../packages/features/book_list/lib/src/providers/user_provider.dart';
import '../packages/repository/model/game.dart';
import '../packages/repository/model/user.dart';

void main(){
  late UserProvider provider;
  late User user;
  
  setUp(() {
    provider = UserProvider();
    user = User(id: '1', pseudo: "Player1");
  });

  test('addUser adds a user', () {
    provider.addUser(user);
    expect(provider.users.length, 1);
  });
  
  test('deleteUser removes a user by ID', () {
    provider.addUser(user);
    provider.deleteUser('1');
    expect(provider.users.length, 0);
  });
  
  test('ready toggles user ready variable', () {
    provider.addUser(user);
    expect(provider.users.first.ready, false);
    provider.ready('1');
    expect(provider.users.first.ready, true);
  });
  
  test('joinGame adds user to game if game not started', () {
    provider.addUser(user);
    final game = Game(password: "12345", users: []);
    provider.joinGame(game, '1');
    expect(game.users.length, 1);
  });
}