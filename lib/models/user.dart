class User {
  User(
    this.id,
    this.email,
    this.password,
    this.name,
    this.token,
    this.timeStamp,
  );

  int? id;
  String? email;
  String? password;
  String? name;
  String? token;
  int? timeStamp;

   User.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    email = json["email"];
    password = json["password"];
    name = json["name"];
    token = json["token"];
    timeStamp = json["timeStamp"];
   }

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "password": password,
        "name": name,
        "token": token,
        "timeStamp": timeStamp,
      };
}
