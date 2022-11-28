import 'dart:developer';

import 'package:bloc_example/bloc/validators.dart';
import 'package:rxdart/rxdart.dart';

class RegisterBloc with Validators{
  final _name=BehaviorSubject<String>();
  final _email=BehaviorSubject<String>();
  final _phone=BehaviorSubject<String>();
  final _password=BehaviorSubject<String>();
  final _confirmpassword=BehaviorSubject<String>();

  Stream<String>get name=>_name.stream.transform(nameValidator);
  Stream<String>get email=>_email.stream.transform(emailValidator);
  Stream<String>get phone=>_phone.stream.transform(phoneValidator);
  Stream<String>get password=>_password.stream.transform(passwordValidator);
  Stream<String>get confirmpassword=>_confirmpassword.stream.transform(passwordValidator);

  Stream<bool>get isValid=>Rx.combineLatest5(email, name, phone, password, confirmpassword, (a, b, c, d, e) => true);
  Stream<bool>get ispasswordMatch=>Rx.combineLatest2(password, confirmpassword, (a, b){
    if(a!=b){
      return false;
    }
    else{
      return true;
    }
  });

  Function(String)get changename=>_name.sink.add;
  Function(String)get changeemail=>_email.sink.add;
  Function(String)get changepassword=>_password.sink.add;
  Function(String)get changephone=>_phone.sink.add;
  Function(String)get changeconfirmpassword=>_confirmpassword.sink.add;

  void submit(){
    if(password!=confirmpassword){
      _confirmpassword.sink.addError("Password Doesnt Match");
    }
    else{
      log('Register');
    }
  }

  void dispose(){
    _name.close();
    _email.close();
    _phone.close();
    _password.close();
    _confirmpassword.close();
  }
}