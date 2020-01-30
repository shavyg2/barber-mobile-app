import 'package:angel_container/angel_container.dart';
import 'package:angel_container_generator/angel_container_generator.dart';
import 'package:http/http.dart';
import 'package:mobile_app/api/Api.dart';
import 'package:mobile_app/api/Request/Request.dart' as R;
import 'package:mobile_app/api/endpoint/endpoint.dart';
import 'package:mobile_app/controller/homepage.dart';
import 'package:mobile_app/controller/login.dart';
import 'package:mobile_app/controller/signup.dart';
import 'package:mobile_app/page/pages.dart';
import 'package:mobile_app/service/Store/ApplicationStore.dart';
import 'package:mobile_app/service/service.dart';
import 'package:mobile_app/util/JsonApi.dart';

final _container = Container(GeneratedReflector());
final container = Container(GeneratedReflector());

void setContainer(Container container) {
  _container.registerNamedSingleton("container", container);
  
}

Container getContainer() {
  return _container.findByName<Container>("container");
}

void initContainer() {
  final container = getContainer();
  container.registerNamedSingleton("client", Client());
  container.registerLazySingleton<R.Request>(
      (container) => R.Request(container.findByName<Client>("client")));

  container.registerLazySingleton<Api>((container) => Api(ENDPOINT));

  container.registerLazySingleton((container) => UserService(
      container.make<Api>(), container.findByName<Client>("client")));





  container.registerFactory((container){
    final client = container.findByName<Client>("client");
    final api = JsonApi(client: client);
    return api;
  });

  initApplication(container);
  initPages(container);
}

void initApplication(Container container) {
  container.registerLazySingleton<ApplicationStore>((_)=>ApplicationStore());
}




void initPages(Container container){

  container.registerSingleton(Pages());


    container.registerFactory((container) {
    return LoginController(
        container.make<R.Request>(), container.make<UserService>());
  });

  container.registerFactory((container) {
    return SignupController(userService: container.make<UserService>());
  });

  container.registerFactory((container){
    return HomepageController();
  });

} 
