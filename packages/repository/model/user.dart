class User {
  final int id;
  final String pseudo ;

  final bool ready;

  User({required this.id, required this.pseudo ,required this.ready});

 
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
