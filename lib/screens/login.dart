import 'dart:developer';

import 'package:bloc_example/bloc/login_bloc.dart';
import 'package:bloc_example/screens/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Login extends StatefulWidget {

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  @override
  Widget build(BuildContext context) {
    final bloc=Provider.of<LoginBloc>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Login',style: TextStyle(fontSize: 26,color: Colors.blue)),
            SizedBox(height: 20),
            StreamBuilder<String>(
              stream: bloc.loginEmail,
              builder: (context, snapshot) {
                return TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    // errorText: snapshot.hasError? true : false,
                      border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)
                    )
                  ),
                  onChanged: (value) => bloc.changeLoginEmail,
                );
              }
            ),
            SizedBox(height: 14),
            StreamBuilder<String>(
              stream: bloc.loginpassword,
              builder: (context, snapshot) {
                return TextField(
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: 'Password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)
                      )
                  ),
                  onChanged: (value) => bloc.changeloginPassword,
                );
              }
            ),
            SizedBox(height: 14),
            _buildButton('Login'),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Need an Account?',style: TextStyle(fontSize: 20,color: Colors.blue),),
                SizedBox(width: 10),
                TextButton(onPressed: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>Register()));
                }, child: Text('Sign Up',style: TextStyle(fontSize: 20,color: Colors.black),),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
  Widget _buildButton(String text){
    final bloc=Provider.of<LoginBloc>(context,listen: false);
    return StreamBuilder<Object>(
      stream: bloc.isValid,
      builder: (context, snapshot) {
        return GestureDetector(
          onTap: snapshot.hasError || !snapshot.hasData ? null :(){
            bloc.submit();
          },
          child: Container(
            height: 40,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: snapshot.hasError || !snapshot.hasData
                ? Colors.grey : Colors.blue
            ),
            child: Center(child: Text(text,style: TextStyle(fontSize: 14,color: Colors.white),)),
          ),
        );
      }
    );
  }
}
