import 'package:angel_container_generator/angel_container_generator.dart';
import 'package:mobile_app/container.dart';

@contained
class ApplicationStore {


  String _token = "";
  String _username = "";

  String getUsername() {
    return _username;
  }

  void setUserName(String username) {
    _username = username;
  }


  String getToken(){
    return _token;
  }

  void setToken(String token){
    _token = token;
  }
}




ApplicationStore getStore(){
  return getContainer().make<ApplicationStore>();
}