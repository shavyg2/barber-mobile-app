

part of service;



abstract class ApiResult{

  dynamic get _json;

  @protected http.Response response;


  bool get isGood{
    if(response==null){
      return false;
    }

    return response.statusCode <300 && response.statusCode >=200;
  }


  bool get hasError{
    return !isGood;
  }


  ApiResult(http.Response response){
    this.response = response;
  }

  bool get hasMessage{
    return errorMsg!=null;
  }
  String get errorMsg{
    return _json["message"];
  }
}

