import 'package:flutter/material.dart';
main(){
  runApp(signup());
}
class signup extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: signupabcd(),
    );
  }

}
class signupabcd extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=>Sign_Page();
}
class Sign_Page extends State<signupabcd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SIGN UP'),
        actions: [
          IconButton(onPressed: () {},
              icon: Icon(Icons.notification_add_outlined, color: Colors.white))
        ],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  hintText: 'Email',
                  suffixIcon: Icon(Icons.mail),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                  )
              ),
            ), SizedBox(height: 20),
            TextField(
              obscureText: true,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  hintText: 'Password',
                  suffixIcon: Icon(Icons.key),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                  )
              ),
            ),
            SizedBox(height: 20),
            TextField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  hintText: 'Phone',
                  suffixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                  )
              ),
            ),
            ElevatedButton(onPressed: () {}, child: Text('Sign Up'))
          ],
        ),
      ),
    );
  }
}