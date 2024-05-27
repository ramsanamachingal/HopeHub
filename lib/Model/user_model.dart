class UserModel
{
  String name;
  String email;
  String phone;
  String address;
  String password;
  String? id;

  UserModel({
    required this.name,
     required this.email,
     required this.phone,
     required this.address,
     required this.password,
     this.id
     });

  Map<String,dynamic> data(docId)=>
  {
    "name":name,
    "email":email,
    "phone":phone,
    "address":address,
    "password":password,
    "id":docId
  };

  factory UserModel.fromData(Map<String,dynamic> i)
  {
    return UserModel(
      name: i["name"], 
    email: i["email"], 
    phone: i["phone"], 
    address: i["address"],
    password: i["password"]
    );
  }
}