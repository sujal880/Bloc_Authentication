import 'dart:async';

mixin Validators{
  var emailValidator=StreamTransformer<String,String>.fromHandlers(handleData: (email,sink){
    if(email.isEmpty){
      return sink.addError("This Field Cant be Empty");
    }
    if(email.length>32){
      return sink.addError("Email cannot be more than 32 char");
    }
    if(email.length<6){
      return sink.addError("Email cannot be less than 6 char");
    }
    else{
      sink.add(email);
    }
  });

  var loginPasswordValidator=StreamTransformer<String,String>.fromHandlers(handleData: (password,sink){
    if(password.isEmpty){
      return sink.addError("This Field Cant be Empty");
    }
    if(password.length>32){
      return sink.addError("Email cannot be more than 32 char");
    }
    if(password.length<8){
      return sink.addError("Email cannot be less than 8 char");
    }
    else{
      sink.add(password);
    }
  });

  var nameValidator=StreamTransformer<String,String>.fromHandlers(handleData: (name,sink){
    if(name.isEmpty){
      return sink.addError("This Field Cant be Empty");
    }
    if(name.length>32){
      return sink.addError("Email cannot be more than 32 char");
    }
    if(name.length<3){
      return sink.addError("Email cannot be less than 3 char");
    }
    else{
      sink.add(name);
    }
  });

  var phoneValidator=StreamTransformer<String,String>.fromHandlers(handleData: (phone,sink){
    if(phone.isEmpty){
      return sink.addError("This Field Cant be Empty");
    }
    if(phone.length>10){
      return sink.addError("Phone cannot be more than 10 digit");
    }
    if(phone.length<10){
      return sink.addError("Phone Length cannot be less than 10 digit");
    }
    else{
      sink.add(phone);
    }
  });

  var passwordValidator=StreamTransformer<String,String>.fromHandlers(handleData: (pass,sink){
    if(pass.isEmpty){
      return sink.addError("This Field Cant be Empty");
    }
    if(pass.length>32){
      return sink.addError("Password cannot be more than 32 char");
    }
    if(pass.length<8){
      return sink.addError("Password cannot be less than 6 char");
    }
    else{
      sink.add(pass);
    }
  });
}