part of models;


@Serializable(serializers:const [Serializers.map,Serializers.json,Serializers.typescript])
class _SignupResponse{
   String message;
   String token;
   _User user;
}