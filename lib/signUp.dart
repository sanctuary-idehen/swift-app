import 'package:flutter/material.dart';
import 'package:swift_rides/login.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String selectedLocation = 'Edo-Ekpoma';
  String selectedVehicle = '';

  void selectVehicle(String vehicle){
    setState(() {
      selectedVehicle = vehicle;
    });
  }


  @override
  Widget build(BuildContext context) {
      return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20), // Add some top padding
            Container(
              margin: EdgeInsets.all(8.0),
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                shape: BoxShape.circle,
              ),
              child: Center(
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(Icons.arrow_back, color: Colors.white, size: 16),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Register Account',
              style: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 1),
            Text(
              'register your account with your details below.',
              style: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 14,
                fontWeight: FontWeight.w400
              ),
            ),
            SizedBox(height: 50),
            Text('First Name', 
            style: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 16,
              fontWeight: FontWeight.w400
            ),),
            Container(
              height: 40,
              child: TextField(
                decoration: InputDecoration(
                  
                  
                  prefixIcon: Container(
                    width: 5,
                    height: 5,
                    padding: EdgeInsets.all(8),                  
                    child: Image.asset('person_icon.png',  )),
                  border: OutlineInputBorder(),
                  
                ),
              ),
            ),
            SizedBox(height: 20),

             Text('Last Name', 
            style: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 16,
              fontWeight: FontWeight.w400
            ),),
            Container(
              height: 40,
              child: TextField(
                decoration: InputDecoration(                 
                  prefixIcon: Container(
                    width: 5,
                    height: 5,
                    padding: EdgeInsets.all(8),                  
                    child: Image.asset('person_icon.png',)),
                  border: OutlineInputBorder(),
                  
                ),
              ),
            ),
            SizedBox(height: 20),
            Text('Email',
            style: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 16,
              fontWeight: FontWeight.w400
            ),),
            Container(
              height: 40,
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Container(
                    width: 5, 
                    height: 5,
                    padding: EdgeInsets.all(8),
                    child: Image.asset('email_icon.png')),
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            
            SizedBox(height: 20),
            Text('Phone Number',
            style: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 16,
              fontWeight: FontWeight.w400
            ),),
            Container(
              height: 40,
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Container(
                    height: 5,
                    width: 5,
                    padding: EdgeInsets.all(8),
                    child: Image.asset('phone_icon.png')),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text('Password',
            style: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 16,
              fontWeight: FontWeight.w400
            ),),
            Container(
              height: 40,
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Container(
                    height: 5,
                    width: 5,
                    padding: EdgeInsets.all(8),
                    child: Image.asset('password_icon.png')),
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
            ),
            SizedBox(height: 20),

            Text('Delivery Area',
            style: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 16,
              fontWeight: FontWeight.w400
            ),),
            Container(
              height: 40,
              child: TextField(
                readOnly: true,
                decoration: InputDecoration(
                  hintText: selectedLocation,
                  prefixIcon: Container(
                    width: 5,
                    height: 5,
                    padding: EdgeInsets.all(8),
                    child: Image.asset('password_icon.png')),
                  suffixIcon: GestureDetector(
                    onTap: () async {
                      final RenderBox textFieldBox = context.findRenderObject() as RenderBox;
                      final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
                      final RelativeRect position = RelativeRect.fromRect(
                        Rect.fromPoints(
                          textFieldBox.localToGlobal(Offset(0, textFieldBox.size.height), ancestor: overlay),
                          textFieldBox.localToGlobal(textFieldBox.size.bottomRight(Offset.zero), ancestor: overlay),
                        ),
                        Offset.zero & overlay.size,
                      );
                      
                      final result = await showMenu(
                        context: context, 
                        position: position, 
                        items: <PopupMenuEntry<String>>[
                          PopupMenuItem<String>(
                            value: 'Edo-Ekpoma',
                            child: Text('Edo-Ekpoma'),),

                            PopupMenuItem<String>(
                              value: 'Abuja-Garki',
                              child: Text('Abuja-Garki'),),

                              PopupMenuItem<String>(
                                value: 'Lagos-Ikeja',
                                child: Text('Lagos-Ikeja')),

                                PopupMenuItem<String>(
                                value: 'Edo-Benin City',
                                child: Text('Edo-Benin City')),
                        ]);

                        if (result != null) {
                          setState(() {
                            selectedLocation = result;
                          });
                        }
                    },
                    child: Container(
                      height: 5,
                      width: 5,
                      padding: EdgeInsets.all(8),
                      child: Image.asset('arrowdown_icon.png')),
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Vehicle',
              style: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(child: _buildVehicleOption('Bike', 'assets/bike.png', )),
                Flexible(child: _buildVehicleOption('Bicycle', 'assets/bicycle.png')),
                Flexible(child: _buildVehicleOption('Foot', 'assets/shoe.png',)),
              ],
            ),

            SizedBox(height: 40),
            Center(
              child: Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: (){},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    primary: Colors.yellow,
                    onPrimary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      side: BorderSide(color: Colors.yellow),
                    ),
                  ),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have an account?', style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),),
                
                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                }, child: Text('Login', style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),))
              ],
            )
          ],
        ),
      ),
    );
  }


  Widget _buildVehicleOption(String vehicle, String imagePath) {
    bool isSelected = selectedVehicle == vehicle;

    return GestureDetector(
      onTap: () => selectVehicle(vehicle),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                imagePath,
                width: 80,
                height: 80,
                color: isSelected ? Colors.black.withOpacity(0.3) : null,
                colorBlendMode: isSelected ? BlendMode.dstATop : null,
              ),
              if (isSelected)
                Icon(Icons.check, color: Colors.black, size: 40),
            ],
          ),
          Text(vehicle, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}


