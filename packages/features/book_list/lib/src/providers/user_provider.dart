import 'package:flutter/material.dart';

import '../../../../../repository/model/user.dart';

class UserProvider  with ChangeNotifier {
  List<User> _users = [];
  List<User> get users => _users;

  void AddUser(User user) {
    _users.add(user);
    notifyListeners(); 
  }}

 