import 'package:flutter/material.dart';

class AsperioProfil extends StatefulWidget {
  const AsperioProfil({super.key});
  
  @override
  State<AsperioProfil> createState() => _AsperioProfilState();
}

class _AsperioProfilState extends State<AsperioProfil> {
  var nama = 'Ahmadhani Fajar Aditama';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tugas $nama'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        width: double.infinity,
        child: Column(
          children: [
            Text('Introduce My Self', 
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.blue[700],
              ),
            ),
            const SizedBox(height: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child:const Image(image: AssetImage('assets/images/wolf.jpg')),
            ),
          ],
        ),
      ),
    );
  }
}