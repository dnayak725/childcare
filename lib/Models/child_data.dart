class ChildResponse {
  final int? id;
  final User? user;
  final String? registrationNumber;
  final String? gender;
  final String? phone;
  final int? age;
  final String? weight;
  final String? height;
  final bool? vaccinated;
  final String? vacine;
  final bool? delete;
  final String? createdAt;
  final int? staff;

  ChildResponse({
    this.id,
    this.user,
    this.registrationNumber,
    this.gender,
    this.phone,
    this.age,
    this.weight,
    this.height,
    this.vaccinated,
    this.vacine,
    this.delete,
    this.createdAt,
    this.staff,
  });

  ChildResponse.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        user = (json['user'] as Map<String, dynamic>?) != null
            ? User.fromJson(json['user'] as Map<String, dynamic>)
            : null,
        registrationNumber = json['registration_number'] as String?,
        gender = json['gender'] as String?,
        phone = json['phone'] as String?,
        age = json['age'] as int?,
        weight = json['weight'] as String?,
        height = json['height'] as String?,
        vaccinated = json['vaccinated'] as bool?,
        vacine = json['vacine'] as String?,
        delete = json['delete'] as bool?,
        createdAt = json['created_at'] as String?,
        staff = json['staff'] as int?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'user': user?.toJson(),
        'registration_number': registrationNumber,
        'gender': gender,
        'phone': phone,
        'age': age,
        'weight': weight,
        'height': height,
        'vaccinated': vaccinated,
        'vacine': vacine,
        'delete': delete,
        'created_at': createdAt,
        'staff': staff
      };
}

class User {
  final int? id;
  final String? password;
  final dynamic lastLogin;
  final bool? isSuperuser;
  final String? username;
  final String? firstName;
  final String? lastName;
  final String? email;
  final bool? isStaff;
  final bool? isActive;
  final String? dateJoined;

  User({
    this.id,
    this.password,
    this.lastLogin,
    this.isSuperuser,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.isStaff,
    this.isActive,
    this.dateJoined,
  });

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        password = json['password'] as String?,
        lastLogin = json['last_login'],
        isSuperuser = json['is_superuser'] as bool?,
        username = json['username'] as String?,
        firstName = json['first_name'] as String?,
        lastName = json['last_name'] as String?,
        email = json['email'] as String?,
        isStaff = json['is_staff'] as bool?,
        isActive = json['is_active'] as bool?,
        dateJoined = json['date_joined'] as String?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'password': password,
        'last_login': lastLogin,
        'is_superuser': isSuperuser,
        'username': username,
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'is_staff': isStaff,
        'is_active': isActive,
        'date_joined': dateJoined,
      };
}
