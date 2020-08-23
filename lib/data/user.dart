import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hackatanga_project/models/user.dart';

class UserData{

  Future save(UserModel user){
    FirebaseFirestore.instance.collection('users').add({
      'name': user.name,
      'email': user.email,
      'cpf': user.cpf,
      'phone': user.phone,
      'isProfessional': user.isProfessional,
    });
  }

  get(){

  }
}