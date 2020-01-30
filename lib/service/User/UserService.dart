part of service;

@contained
class UserService{

  Api _api;
  Client client;
  UserService(Api api,this.client){
    _api = api;
  }



  Future<SignupResult> signup (dynamic signup) async {
    final res = await client.put(_api.endpoint(["/api/user/signup"]),body:signup );
    return SignupResult(res,await jsonParser(res.body));
  }

  Future<JsonApi<LoginResponse>> login(dynamic login)async {

    final result = await JsonApi.post<LoginResponse>(
      url:_api.endpoint(["/api/user/login"]),
      body: login,
      serialize: (t)=>LoginResponseSerializer.fromMap(t),
    );

    return result;

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