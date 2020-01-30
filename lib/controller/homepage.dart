



import 'package:angel_container_generator/angel_container_generator.dart';
import 'package:mobile_app/container.dart';
import 'package:mobile_app/service/Store/ApplicationStore.dart';
import 'package:tight/tight.dart';

@contained
class HomepageController extends TightController<HomepageController>{

  HomepageController();


  String get username{
    return _store.getUsername();
  }

  ApplicationStore get _store{
    final store = getContainer().make<ApplicationStore>();
    return store;
  }

}