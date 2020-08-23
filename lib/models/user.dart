class UserModel {

  final String name;
  final String cpf;
  final String phone;
  final String email;
  final String OAB;
  final String CRP;
  final bool isProfessional;
  final String lat;
  final String long;
  final String CEP;

  UserModel({
    this.cpf,
    this.name,
    this.phone,
    this.email,
    this.OAB,
    this.CRP,
    this.isProfessional,
    this.lat,
    this.long,
    this.CEP
  });
}