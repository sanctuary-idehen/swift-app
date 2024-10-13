import 'package:flutter/material.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({super.key});

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
      backgroundColor: Colors.grey[100], // Greyish background close to white
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Center( // Center the content vertically and horizontally
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Image Asset
              Image.asset(
                'assets/success.png', // Replace with your image path
                width: 100, // Set desired width
                height: 100, // Set desired height
              ),
              SizedBox(height: 20), // Space between image and title

              // Success Text
              Text(
                'Success',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Open Sans',
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10), // Space between title and message

              // Confirmation Message
              Text(
                'Your password has been reset',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Open Sans',
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40), // Space before the button

              // Back to Login Button
              SizedBox(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate back to login or home page
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.yellow, // Use the yellow theme color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: Text(
                    'Back to Login',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Open Sans',
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


      
  