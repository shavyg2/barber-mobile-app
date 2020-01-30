// GENERATED CODE - DO NOT MODIFY BY HAND

part of models;

// **************************************************************************
// JsonModelGenerator
// **************************************************************************

@generatedSerializable
class LoginResponse extends _LoginResponse {
  LoginResponse({this.token, this.user});

  @override
  String token;

  @override
  _User user;

  LoginResponse copyWith({String token, _User user}) {
    return LoginResponse(token: token ?? this.token, user: user ?? this.user);
  }

  bool operator ==(other) {
    return other is _LoginResponse &&
        other.token == token &&
        other.user == user;
  }

  @override
  int get hashCode {
    return hashObjects([token, user]);
  }

  @override
  String toString() {
    return "LoginResponse(token=$token, user=$user)";
  }

  Map<String, dynamic> toJson() {
    return LoginResponseSerializer.toMap(this);
  }
}

@generatedSerializable
class SignupResponse extends _SignupResponse {
  SignupResponse({this.message, this.token, this.user});

  @override
  String message;

  @override
  String token;

  @override
  _User user;

  SignupResponse copyWith({String message, String token, _User user}) {
    return SignupResponse(
        message: message ?? this.message,
        token: token ?? this.token,
        user: user ?? this.user);
  }

  bool operator ==(other) {
    return other is _SignupResponse &&
        other.message == message &&
        other.token == token &&
        other.user == user;
  }

  @override
  int get hashCode {
    return hashObjects([message, token, user]);
  }

  @override
  String toString() {
    return "SignupResponse(message=$message, token=$token, user=$user)";
  }

  Map<String, dynamic> toJson() {
    return SignupResponseSerializer.toMap(this);
  }
}

@generatedSerializable
class User extends _User {
  User({this.email, this.username});

  @override
  String email;

  @override
  String username;

  User copyWith({String email, String username}) {
    return User(
        email: email ?? this.email, username: username ?? this.username);
  }

  bool operator ==(other) {
    return other is _User && other.email == email && other.username == username;
  }

  @override
  int get hashCode {
    return hashObjects([email, username]);
  }

  @override
  String toString() {
    return "User(email=$email, username=$username)";
  }

  Map<String, dynamic> toJson() {
    return UserSerializer.toMap(this);
  }
}

// **************************************************************************
// SerializerGenerator
// **************************************************************************

const LoginResponseSerializer loginResponseSerializer =
    LoginResponseSerializer();

class LoginResponseEncoder extends Converter<LoginResponse, Map> {
  const LoginResponseEncoder();

  @override
  Map convert(LoginResponse model) => LoginResponseSerializer.toMap(model);
}

class LoginResponseDecoder extends Converter<Map, LoginResponse> {
  const LoginResponseDecoder();

  @override
  LoginResponse convert(Map map) => LoginResponseSerializer.fromMap(map);
}

class LoginResponseSerializer extends Codec<LoginResponse, Map> {
  const LoginResponseSerializer();

  @override
  get encoder => const LoginResponseEncoder();
  @override
  get decoder => const LoginResponseDecoder();
  static LoginResponse fromMap(Map map) {
    return LoginResponse(
        token: map['token'] as String,
        user: map['user'] != null
            ? UserSerializer.fromMap(map['user'] as Map)
            : null);
  }

  static Map<String, dynamic> toMap(_LoginResponse model) {
    if (model == null) {
      return null;
    }
    return {'token': model.token, 'user': UserSerializer.toMap(model.user)};
  }
}

abstract class LoginResponseFields {
  static const List<String> allFields = <String>[token, user];

  static const String token = 'token';

  static const String user = 'user';
}

const SignupResponseSerializer signupResponseSerializer =
    SignupResponseSerializer();

class SignupResponseEncoder extends Converter<SignupResponse, Map> {
  const SignupResponseEncoder();

  @override
  Map convert(SignupResponse model) => SignupResponseSerializer.toMap(model);
}

class SignupResponseDecoder extends Converter<Map, SignupResponse> {
  const SignupResponseDecoder();

  @override
  SignupResponse convert(Map map) => SignupResponseSerializer.fromMap(map);
}

class SignupResponseSerializer extends Codec<SignupResponse, Map> {
  const SignupResponseSerializer();

  @override
  get encoder => const SignupResponseEncoder();
  @override
  get decoder => const SignupResponseDecoder();
  static SignupResponse fromMap(Map map) {
    return SignupResponse(
        message: map['message'] as String,
        token: map['token'] as String,
        user: map['user'] != null
            ? UserSerializer.fromMap(map['user'] as Map)
            : null);
  }

  static Map<String, dynamic> toMap(_SignupResponse model) {
    if (model == null) {
      return null;
    }
    return {
      'message': model.message,
      'token': model.token,
      'user': UserSerializer.toMap(model.user)
    };
  }
}

abstract class SignupResponseFields {
  static const List<String> allFields = <String>[message, token, user];

  static const String message = 'message';

  static const String token = 'token';

  static const String user = 'user';
}

const UserSerializer userSerializer = UserSerializer();

class UserEncoder extends Converter<User, Map> {
  const UserEncoder();

  @override
  Map convert(User model) => UserSerializer.toMap(model);
}

class UserDecoder extends Converter<Map, User> {
  const UserDecoder();

  @override
  User convert(Map map) => UserSerializer.fromMap(map);
}

class UserSerializer extends Codec<User, Map> {
  const UserSerializer();

  @override
  get encoder => const UserEncoder();
  @override
  get decoder => const UserDecoder();
  static User fromMap(Map map) {
    return User(
        email: map['email'] as String, username: map['username'] as String);
  }

  static Map<String, dynamic> toMap(_User model) {
    if (model == null) {
      return null;
    }
    return {'email': model.email, 'username': model.username};
  }
}

abstract class UserFields {
  static const List<String> allFields = <String>[email, username];

  static const String email = 'email';

  static const String username = 'username';
}
