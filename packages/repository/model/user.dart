import 'package:uuid/uuid.dart';
Uuid uuid = const Uuid();
class User {
  final String id;
  final String pseudo ;

  bool ready;

  User({String? id, required this.pseudo, this.ready = false,}): id = id ?? uuid.v4();

 
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'pseudo ': pseudo ,
      'ready': ready,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      pseudo : json['pseudo '],
      ready: json['ready']
    );
  }

  @override
  String toString() {
    return 'User(id: \$id, pseudo : \$pseudo , ready \$ready )';
  }
}
