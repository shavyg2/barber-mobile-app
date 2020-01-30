part of models;

@Serializable(serializers: const [
  Serializers.map,
  Serializers.json,
  Serializers.typescript
])
class _LoginResponse {
  String token;
  _User user;
}
