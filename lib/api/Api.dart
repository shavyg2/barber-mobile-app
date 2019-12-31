



import 'package:mobile_app/api/endpoint/endpoint.dart';


class Api{

  String _url;

  Api(String url){
    _url = url;
  }

  static final _start = RegExp(r'^/{1}');
  static final _end = RegExp(r'/{1,}$');

  String endpoint(List<String> path){

    final newPath = [_url,...path];
    return newPath.reduce(_stringJoin);
  }


  static String _stringJoin(String route1, String route2){
        if(_start.hasMatch(route1)){
          route1 = route1.replaceAll(_start, "");
        }
        if(_end.hasMatch(route1)){
          route1 = route1.replaceAll(_end, "");
        }
        if(_start.hasMatch(route2)){
          route2 = route2.replaceAll(_start, "");
        }
        if(_end.hasMatch(route2)){
          route2 = route2.replaceAll(_end, "");
        }

        return [route1,route2].join("/");


    }

  static Api _instance;
  factory Api.instance([String url=ENDPOINT]){
    return _instance = _instance ?? Api(url);
  }

}