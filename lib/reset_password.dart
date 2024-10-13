import 'package:flutter/material.dart';
import 'package:swift_rides/success.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {

  bool _isNewPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  TextEditingController _newPasswordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // Greyish background close to white
      body: Padding(
        padding: const EdgeInsets.all(15), // Add padding around the whole page
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20), // Space at the top for safe area
            // "< Reset password" Section (acting as app bar)
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                        size: 16,
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Reset password',
                        style: TextStyle(
                          fontSize: 17,
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.w600,
                           ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 40), // Space between the top section and text fields
            // New Password field
            Container(
              width: MediaQuery.of(context).size.width,
              height: 202,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white, // White background for text fields
                borderRadius: BorderRadius.circular(0),
              ),
              child: Column(        
                crossAxisAlignment: CrossAxisAlignment.start,      
                children: [
                  Text("New Password", style: TextStyle(fontFamily: 'Open Sans', fontSize: 14, fontWeight: FontWeight.w400),),
                  SizedBox(height: 10),
                  SizedBox(
                    
                    height: 42,
                    child: TextField(
                      controller: _newPasswordController,
                      obscureText: !_isNewPasswordVisible, // Toggle password visibility
                      decoration: InputDecoration(
                        hintText: "********",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0),
                          
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isNewPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            
                          ),
                          onPressed: () {
                            setState(() {
                              _isNewPasswordVisible = !_isNewPasswordVisible;
                            });
                          },
                        ),
                      ),
                    ),
                  ),


                   
                SizedBox(height: 20),
                Text("Confirm Password", style: TextStyle(fontFamily: 'Open Sans', fontSize: 14, fontWeight: FontWeight.w400),),
                SizedBox(height: 10),
            // Confirm Password field
            SizedBox(
              height: 42,
              child: TextField(
                controller: _confirmPasswordController,
                obscureText: !_isConfirmPasswordVisible,
                decoration: InputDecoration(
                  hintText: "********",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0),
                    ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isConfirmPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      
                    ),
                    onPressed: () {
                      setState(() {
                        _isConfirmPasswordVisible =
                            !_isConfirmPasswordVisible;
                      });
                    },
                  ),
                ),
              ),
            ),
                ],
               
              ),
              

              
            ),
            
            SizedBox(height: 40),
            // Submit button
            SizedBox(
              width: double.infinity,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SuccessPage()));
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.yellow, // Use the yellow theme color
                  
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: Text(
                  'Reset Password', 
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w400,
                    color: Colors.black
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}