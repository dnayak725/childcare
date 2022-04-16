class LoginResponse {
  LoginResponse({
    required this.message,
    required this.user,
    required this.tokenAuthentication,
  });
  late final String message;
  late final List<User> user;
  late final String tokenAuthentication;

  LoginResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    user = List.from(json['user']).map((e) => User.fromJson(e)).toList();
    tokenAuthentication = json['tokenAuthentication'];
  }
  LoginResponse.fromError(Map<String, dynamic> json) {
    message = json['message'];
  }
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['user'] = user.map((e) => e.toJson()).toList();
    _data['tokenAuthentication'] = tokenAuthentication;
    return _data;
  }
}

class User {
  User({
    required this.id,
    required this.password,
    this.lastLogin,
    required this.isSuperuser,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.isStaff,
    required this.isActive,
    required this.dateJoined,
    required this.groups,
    required this.userPermissions,
  });
  late final int id;
  late final String password;
  late final lastLogin;
  late final bool isSuperuser;
  late final String username;
  late final String firstName;
  late final String lastName;
  late final String email;
  late final bool isStaff;
  late final bool isActive;
  late final String dateJoined;
  late final List<dynamic> groups;
  late final List<dynamic> userPermissions;

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    password = json['password'];
    lastLogin = json['last_login'];
    isSuperuser = json['is_superuser'];
    username = json['username'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    isStaff = json['is_staff'];
    isActive = json['is_active'];
    dateJoined = json['date_joined'];
    groups = List.castFrom<dynamic, dynamic>(json['groups']);
    userPermissions = List.castFrom<dynamic, dynamic>(json['user_permissions']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['password'] = password;
    _data['last_login'] = lastLogin;
    _data['is_superuser'] = isSuperuser;
    _data['username'] = username;
    _data['first_name'] = firstName;
    _data['last_name'] = lastName;
    _data['email'] = email;
    _data['is_staff'] = isStaff;
    _data['is_active'] = isActive;
    _data['date_joined'] = dateJoined;
    _data['groups'] = groups;
    _data['user_permissions'] = userPermissions;
    return _data;
  }
}
