class AppModel
{
  String? phone;
  String? uId;
  String? password;


  AppModel({
    this.phone,
    this.uId,
    this.password


  });

  AppModel.fromjson( json)
  {
    uId =json['uId'];
    phone =json['phone'];
    password =json['password'];

  }

  Map<String,dynamic> toMap(){
    return{
      'uId' : uId,
      'password' : password,
      'phone' : phone,

    };
  }



}