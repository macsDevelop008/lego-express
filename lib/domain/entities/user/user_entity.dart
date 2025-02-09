class UserEntity {
  String? names;
  String? surnames;
  String? email;

  UserEntity({this.names, this.surnames, this.email});
}

class UserDbEntity extends UserEntity {
  // id db
  int id;
  // id firebase
  String uuid;

  UserDbEntity({
    required this.uuid,
    required this.id,
    super.names,
    super.surnames,
    super.email,
  });
}
