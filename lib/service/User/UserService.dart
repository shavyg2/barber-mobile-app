part of service;


class UserService{

  Api _api;
  UserService(Api api){
    _api = api;
  }

  static UserService _instance;
  factory UserService.instance(){
    return _instance = _instance ?? UserService(Api.instance());
  }

  Future<SignupResult> signup (dynamic signup) async {
    final res = await Request.put(_api.endpoint(["/api/user/signup"]),body:signup );
    return SignupResult(res,await jsonParser(res.body));
  }

  Future<LoginResult> login(dynamic login)async {
    final res = await Request.post(_api.endpoint(["/api/user/login"]),body: login);
    var json = await jsonParser(res.body!=null && res.body.isNotEmpty?res.body:"{}");
        return LoginResult(res,json);
  }
}

class SignupResult extends ApiResult{

  dynamic _json;

  SignupResult(http.Response response,dynamic json) : super(response){
    _json = json;
  }
}


class LoginResult extends ApiResult{
  dynamic _json;

  LoginResult(http.Response response,dynamic json) : super(response){
    _json = json;
  }

  String get token{
    return _json["token"];
  }


  String get username{
    return _json["user"]["username"];
  }

}