import 'package:flutter_test/flutter_test.dart';

import '../packages/repository/model/game.dart';
import '../packages/repository/model/user.dart';

void main(){
  test('Game class should be created', (){
    final game = Game(password: "12345");
    expect(game.gameNumber, 1);
  });

  test('Game class should have two users', (){
    final game = Game(password: "12345", users: [User(pseudo: "Tester")]);
    final user = User(pseudo: "AlsoTester");
    game.users.add(user);
    expect(game.gameNumber, 1);
  });
}