class User {
  User({
    this.id,
    required this.username,
    required this.password,
  });

  final int? id;
  final String username;
  final String password;


  factory User.fromMap(Map<String, dynamic> json) {
    return User(id: json["id"], username: json["username"], password: json["password"]);
  }


  Map<String, dynamic> toMap(){
    return {
      'id': id,
      'username': username,
      'password': password
    };
  }

}