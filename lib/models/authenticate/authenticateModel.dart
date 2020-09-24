class AuthenticateModel{
  String email;
  String password ;
  bool rememberMe = false;

  AuthenticateModel(this.email,this.password);


  AuthenticateModel.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        password = json['password'],
        rememberMe=json["rememberMe"];

  Map<String, dynamic> toJson() =>
      {
        'email': email,
        'password': password,
        'rememberMe':rememberMe,
      };
}