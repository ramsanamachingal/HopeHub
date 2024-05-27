class Drmodel {
  String name;
  String qualification;
  String expert;
  String language;
  String phone;
  String email;
  String password;
  String? id;

  Drmodel({
    required this.name,
    required this.qualification,
    required this.expert,
    required this.language,
    required this.phone,
    required this.email,
    required this.password,
    this.id
  });
  Map<String,dynamic>data(docId)=>{
    "name":name,
    "qualification":qualification,
    "expert":expert,
    "language":language,
    "phone":phone,
    "email":email,
    "password":password,
    "id":docId
  };
  factory Drmodel.fromData(Map<String,dynamic>i){
    return Drmodel(name: i["name"],
     qualification: i["qualification"],
      expert: i["expert"], 
      language: i["language"],
       phone: i["phone"],
        email: i["email"],
        password: i["password"]
        );
  }
}
