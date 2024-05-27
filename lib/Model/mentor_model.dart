class MentorModel{
  String name;
  String qualification;
  String experience;
  String language;
  String phone;
  String email;
  String password;
  String ? id;

  MentorModel({
    required this.name,
    required this.qualification,
    required this.experience,
    required this.language,
    required this.phone,
    required this.email,
    required this.password,
    this.id

  });
  Map<String,dynamic>data(mentId)=>{
    "name":name,
    "qualification":qualification,
    "experience":experience,
    "language":language,
    "phone":phone,
    "email":email,
    "password":password,
    "id":mentId
  };
 factory MentorModel.fromData(Map<String,dynamic>i)
{
return MentorModel(
  name: i["name"],
   qualification: i["qualification"],
    experience: i["experience"], 
    language: i["language"],
     phone: i["phone"], 
     email: i["email"],
      password: i["password"]);
}

}