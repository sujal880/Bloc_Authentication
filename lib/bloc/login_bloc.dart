import 'dart:async';
import 'dart:developer';
import 'package:bloc_example/bloc/validators.dart';
import 'package:rxdart/rxdart.dart';
class LoginBloc with Validators{
  final _loginEmail=BehaviorSubject<String>();
  final _loginPassword=BehaviorSubject<String>();

  Stream<String>get loginEmail=>_loginEmail.stream.transform(emailValidator);
  Stream<String>get loginpassword=>_loginPassword.stream.transform(loginPasswordValidator);

  Stream<bool> get isValid=>Rx.combineLatest2(loginEmail, loginpassword, (a, b) => true);

  Function(String)get changeLoginEmail=>_loginEmail.sink.add;
  Function(String)get changeloginPassword=>_loginPassword.sink.add;

  void submit(){
    log(_loginEmail.value);
    log(_loginPassword.value);

  }


  void dispose(){
    _loginEmail.close();
    _loginPassword.close();
  }

}