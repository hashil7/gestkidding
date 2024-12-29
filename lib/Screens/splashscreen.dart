import 'package:flutter/material.dart';
import 'package:gestacare/Screens/loginscreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String _selectedOption = 'Pregnant Woman';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.green[300], // Background color
        width: double.infinity, // Make the container take full width
        height: double.infinity, // Make the container take full height
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 2),
            const Text(
              '"Healthy Moms, Happy Babies."',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Icon(
              Icons.baby_changing_station, // Baby icon
              size: 36,
              color: Colors.blue,
            ),
            const SizedBox(height: 20),
            DropdownButton<String>(
              value: _selectedOption,
              items: <String>['Pregnant Woman', 'Child']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedOption = newValue!;
                });
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                );
              },
            ),
            const Spacer(),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.green[200],
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                Image.asset(
                  'assets/images/pregnant_silhouette.png', // Add the silhouette image to assets
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            const Spacer(),
            const Text(
              "Gest KIDding",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
