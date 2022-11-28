import 'dart:io';
import 'package:bloc_example/bloc/register_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    final bloc=Provider.of<RegisterBloc>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Text('Sign Up',style: TextStyle(fontSize: 27,color: Colors.blue),)),
            SizedBox(height: 20),
        StreamBuilder<String>(
          stream: bloc.name,
          builder: (context, snapshot) {
            return TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: 'Name',
                //errorText: snapshot.error,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)
                ),
              ),
              onChanged: (value) => bloc.changename,
            );
          }
        ),
            SizedBox(height: 14),
        StreamBuilder<String>(
          stream: bloc.email,
          builder: (context, snapshot) {
            return TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: "Email",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)
                ),
              ),
              onChanged: (value) => bloc.changeemail,
            );
          }
        ),
            SizedBox(height: 14),
            StreamBuilder<String>(
              stream: null,
              builder: (context, snapshot) {
                return TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: "Phone",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),
                  ),
                  onChanged: (value) => bloc.phone,
                );
              }
            ),
            SizedBox(height: 14),
            StreamBuilder<String>(
              stream: bloc.password,
              builder: (context, snapshot) {
                return TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: "Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),
                  ),
                  onChanged: (value) => bloc.changepassword,
                );
              }
            ),
            SizedBox(height: 14),
            StreamBuilder<String>(
              stream: bloc.confirmpassword,
              builder: (context, snapshot) {
                return TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: "Confirm Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),
                  ),
                  onChanged: (value) => bloc.changeconfirmpassword,
                );
              }
            ),
            StreamBuilder<Object>(
              stream: bloc.isValid,
              builder: (context, snapshot) {
                return CupertinoButton(child: Text('Sign Up'),color: snapshot.hasError || snapshot.hasData ? Colors.grey : Colors.blue, onPressed: snapshot.hasError || !snapshot.hasData ? null :  (){
                  bloc.submit();
                });
              }
            )
          ],
        ),
      ),
    );
  }

}
