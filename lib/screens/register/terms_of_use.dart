import 'package:cpfcnpj/cpfcnpj.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:hackatanga_project/data/auth.dart';
import 'package:hackatanga_project/data/user.dart';
import 'package:hackatanga_project/models/user.dart';
import 'package:hackatanga_project/screens/home/home.dart';
import 'package:hackatanga_project/screens/login/components/custom_button.dart';
import 'package:hackatanga_project/screens/register/register.dart';
import 'package:location/location.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class TermsOfUses extends StatefulWidget {
  @override
  _TermsOfUsesState createState() => _TermsOfUsesState();
}

class _TermsOfUsesState extends State<TermsOfUses> {
  //GPS Location
  Location location = new Location();
  Coordinates coordinates;
  //Authentication
  Auth auth = new Auth();
  UserModel user = new UserModel();
  //Forms
  final _formKey = GlobalKey<FormState>();
  final _formKeyDialog = GlobalKey<FormState>();
  final cpfController = TextEditingController();
  final phoneController = TextEditingController();
  final smsController = TextEditingController();
  String _professional = "";
  List<String> _profession = ["Advogado", "Psicólogo"];
  //Mask
  var maskPhoneNumber = MaskTextInputFormatter(mask: "+55 (##) # ####-####", filter: {"#": RegExp(r'[0-9]')});
  var maskCPF = MaskTextInputFormatter(mask: "###.###.###-##", filter: {"#": RegExp(r'[0-9]')});
  //Phone validation
  String verificationId;
  String smsCode;
  //Toast
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 35, horizontal: 35),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'SUA IDENTIDADE SERÁ MANTIDA EM SIGILO',
                    textAlign: TextAlign.center,
                    style:
                        GoogleFonts.oswald(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Text(
                  'TERMOS DE USO',
                  style: GoogleFonts.oswald(fontSize: 40, color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25, bottom: 60),
                child: Text(
                  'termos de uso',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(fontSize: 20, color: Colors.black38),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Text(
                  'Para concordar, preencha corretamente seu CPF e o número de telefone atual.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Text(
                  'Marque a opção abaixo somente se você exercer a profissão.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                      color: Colors.red,
                      fontSize: 18,
                      fontWeight: FontWeight.w900),
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 45),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          RadioGroup<String>.builder(
                            direction: Axis.horizontal,
                            groupValue: _professional,
                            onChanged: (value) => setState(() {
                              _professional = value;
                            }),
                            items: _profession,
                            itemBuilder: (item) => RadioButtonBuilder(
                              item,
                            ),
                          ),
                          InkWell(
                            child: Icon(
                              Icons.clear,
                              color: Colors.redAccent,
                              size: 35,
                            ),
                            onTap: (){
                              setState(() {
                                _professional = "";
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      margin: const EdgeInsets.only(top: 10),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: cpfController,
                        inputFormatters: [maskCPF],
                        decoration: InputDecoration(
                          //contentPadding: const EdgeInsets.all(kPaddingM),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black.withOpacity(0.12),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black.withOpacity(0.12),
                            ),
                          ),
                          hintText: '123.456.789-00',
                          hintStyle: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                            fontWeight: FontWeight.w500,
                          ),
                          prefixIcon: Icon(
                            Icons.perm_identity,
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                        validator: (value) {
                          if (value.isEmpty)
                            return 'Por favor, preencha seu CPF';
                          if(!CPF.isValid(value))
                            return 'Digite um CPF válido';
                          return null;
                        },
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      margin: const EdgeInsets.only(top: 10),
                      child: TextFormField(
                        inputFormatters: [maskPhoneNumber],
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black.withOpacity(0.12),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black.withOpacity(0.12),
                            ),
                          ),
                          hintText: '+55 (00) 9 9999-9999',
                          hintStyle: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                            fontWeight: FontWeight.w500,
                          ),
                          prefixIcon: Icon(
                            Icons.phone,
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        controller: phoneController,
                        validator: (value) {
                          if (value.isEmpty)
                            return 'Por favor, preencha seu número de telefone';
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: CustomButton(
                        color: Theme.of(context).accentColor,
                        textColor: Colors.white,
                        text: 'CONCORDO',
                        onPressed: () async{
                          if (_formKey.currentState.validate()) {
                            if (_professional.isEmpty){
                              await validatorUser();
                            }else{
                              //TODO: Fazer ação de cadastrar profissional
                              check_professional(context);
                            }
                          }

                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<Widget> validatorUser() async {
    final PhoneCodeAutoRetrievalTimeout autoRetrieve = (String verificationID) {
      this.verificationId = verificationID;
    };

    final PhoneCodeSent smsCodeSent = (String verId, [int forceCodeResend]) {
      this.verificationId = verId;
      smsCodeDialog(context).then((value) => {print('Code SMS send')});
    };

    final PhoneVerificationCompleted verifiedSuccess = (AuthCredential auth) {
      print('Verification was a success: ${auth.providerId}');
      return Auth().loginGoogle(context);
    };

    final PhoneVerificationFailed verifiedFailed = (FirebaseAuthException exception) {
      print('verifiedFailed(${exception.code}): ${exception.message}');
      if(exception.code == 'too-many-requests')
        _showToast('Bloqueamos todas as solicitações deste dispositivo devido a atividade incomum. Tente mais tarde.');
      //return false;
      return Auth().loginGoogle(context);
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: ('+55${maskPhoneNumber.getUnmaskedText()}'),
        verificationCompleted: verifiedSuccess,
        verificationFailed: verifiedFailed,
        codeSent: smsCodeSent,
        timeout: const Duration(seconds: 5),
        codeAutoRetrievalTimeout: autoRetrieve);
  }
  Future<bool> smsCodeDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: Text('Digite o SMS recebido.'),
            content: Form(
              key: _formKeyDialog,
              child: TextFormField(
                controller: smsController,
                validator: (value) {
                  if (value.isEmpty) return 'Digite o código.';
                  return null;
                },
                onChanged: (value) {
                  this.smsCode = value;
                },
              ),
            ),
            contentPadding: EdgeInsets.all(10),
            actions: [
              new FlatButton(
                onPressed: () async{
                  print('BOTAO APERTADO');
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();

                },
                child: Text('Enviar'),
              ),
            ],
          );
        });
  }
  Future<bool> check_professional(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: (_professional == 'Advogado') ? Text('Digite seu número de identificação OAB.') :
            Text('Digite seu número de identificação CRP.'),
            content: Form(
              key: _formKeyDialog,
              child: TextFormField(
                controller: smsController,
                validator: (value) {
                  if (value.isEmpty) return 'Digite sua identificação.';
                  return null;
                },
                onChanged: (value) {
                  this.smsCode = value;
                },
              ),
            ),
            contentPadding: EdgeInsets.all(10),
            actions: [
              new FlatButton(
                onPressed: () {
                  if (FirebaseAuth.instance.currentUser != null) {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return Register(
                            isGoogleAuth: true,
                            user: new UserModel(
                              name:
                              FirebaseAuth.instance.currentUser.displayName,
                              email: FirebaseAuth.instance.currentUser.email,
                              cpf: maskCPF.getUnmaskedText(),
                              phone: maskPhoneNumber.getUnmaskedText(),
                              isProfessional: _professional.isEmpty ? false : true,
                              CRP: null,
                              OAB: null,
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                    //Auth().loginGoogle(context);
                  }
                },
                child: Text('Enviar'),
              ),
            ],
          );
        });
  }
  void _showToast(String text) {
    _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text(text),
          duration: Duration(seconds: 10),
        ));
  }
  static Future getLocation(Location location) async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    try {
      return await location.getLocation();

    } catch (e) {
      if (e.code == 'PERMISSION_DENIED') {}
      return null;
    }
  }
  getUser(value) async{
    coordinates = new Coordinates(value.latitude, value.longitude);
    var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    return new UserModel(
        isProfessional: false,
        name: FirebaseAuth.instance.currentUser.displayName,
        email: FirebaseAuth.instance.currentUser.email,
        cpf: maskCPF.getUnmaskedText(),
        phone: maskPhoneNumber.getUnmaskedText(),
        OAB: null,
        CRP: null,
        CEP: first.postalCode,
        lat: value.latitude,
        long: value.longitude);
  }
}
