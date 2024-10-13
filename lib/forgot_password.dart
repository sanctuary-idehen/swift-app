import 'package:flutter/material.dart';
import 'package:swift_rides/reset_password.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // The top exclamation mark icon with a circle
            Container(
              width: 50, 
              height: 50,
              child: Image.asset('take_note.png')),
            SizedBox(height: 10),
            // Title text
            Text(
              'Forget Password',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                fontFamily: 'Open Sans'
              ),
            ),
            SizedBox(height: 10),
            // Description text
            Text(
              "Enter your email and we’ll send you a link to reset your password",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
               fontFamily: 'Open Sans',
               fontWeight: FontWeight.w400
              ),
            ),
            SizedBox(height: 20),
            // Email input field
            Container(
              height: 45,
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                   prefixIcon: Container(
                    width: 5,
                    height: 5,
                    padding: EdgeInsets.all(8),                  
                    child: Image.asset('email_icon.png',)),
                  
                  hintText: "john@gmail.com",
                 enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: Colors.black87, // Set the border color to black
           // Set the border width to be thicker
        ),
      ),
      
                ),
              ),
            ),


            SizedBox(height: 35),
            // Submit button
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              height: 43,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ResetPasswordPage()));
                },
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    color: Colors.black54,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Submit', 
                  style: TextStyle(color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Inria Sans',
                    fontWeight: FontWeight.w400
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            // Back to Login clickable text
            GestureDetector(
              onTap: () => Navigator.pop(context),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.arrow_back_ios, size: 10),
                  Text(
                    'Back to Login',
                    style: TextStyle(
                      fontFamily: 'Inria Sans',
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
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
void showForgotPasswordDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return ForgotPassword(); // Showing the ForgotPassword dialog
    },
  );
}

