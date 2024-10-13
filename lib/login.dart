import 'package:flutter/material.dart';
import 'package:swift_rides/forgot_password.dart';
import 'package:swift_rides/home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          padding: EdgeInsets.zero,
          onPressed: (){
          Navigator.pop(context);
        },
         icon: Container(
          margin: EdgeInsets.all(4),
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            shape: BoxShape.circle,
          ),
          child:  Center(child: Icon(Icons.arrow_back_ios, color: Colors.black, size: 10, )),


         )),),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Login to your Account',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                fontFamily: 'OpenSans',
                color: Colors.black,
              ),
            ),
            SizedBox(height: 30),
            Text("Email", style: TextStyle(fontFamily: 'OpenSans', fontSize: 16, fontWeight: FontWeight.w400),),
            Container(
              height: 40,
              child: TextField(
                decoration: InputDecoration(                 
                  prefixIcon: Container(
                    width: 5,
                    height: 5,
                    padding: EdgeInsets.all(8),                  
                    child: Image.asset('email_icon.png',)),
                  border: OutlineInputBorder(),
                  
                ),
              ),
            ),
            SizedBox(height: 20),
            Text("Password", style: TextStyle(fontFamily: 'OpenSans', fontSize: 16, fontWeight: FontWeight.w400),),
            Container(
              height: 40,
              child: TextField(
                decoration: InputDecoration(                 
                  prefixIcon: Container(
                    width: 5,
                    height: 5,
                    padding: EdgeInsets.all(8),                  
                    child: Image.asset('password_icon.png',)),
                  border: OutlineInputBorder(),
                  
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: _rememberMe,
                      onChanged: (bool? value) {
                        setState(() {
                          _rememberMe = value ?? false;
                        });
                      },
                      activeColor: Colors.blue,
                      checkColor: Colors.black,
                    ),
                    SizedBox(width: 8),
                    Text('Remember me'),
                  ],
                ),
                GestureDetector(
                  onTap: ()=> showForgotPasswordDialog(context),
                  child: Text(
                    'Forget password?',
                    style: TextStyle(
                      fontFamily: 'Inria Sans',
                      fontWeight: FontWeight.w400,
                      color: Colors.grey[700],
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 40,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.yellow[700],
                  onPrimary: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                },
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account? ", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),),
                  GestureDetector(
                    onTap: (){},
                    child: Text(
                      'Signup',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.blue,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
      
  