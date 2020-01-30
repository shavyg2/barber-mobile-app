
T doImmediately<T>(T Function() action){
  return action();
}