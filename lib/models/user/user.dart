part of models;


@Serializable(serializers:const [Serializers.map,Serializers.json,Serializers.typescript])
class _User{
  String email;
  String username;

}