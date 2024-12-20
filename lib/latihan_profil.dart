import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutterday3/future_builder_page.dart';
import 'package:flutterday3/latihan.dart';
import 'package:flutterday3/my_homepage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _url = Uri.parse('https://www.instagram.com/adf_aditama/');


class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  /// Function to display text below the 'Nama' field
  Widget _showPersonalData(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }

  int _selectedIndex =0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Tugas Ahmadhani Fajar Aditama', 
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(icon: const Icon(Icons.calendar_month), onPressed: () {}, color: Colors.white,),
          ],
          backgroundColor: Colors.blueGrey,
      ),
      body: Card(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:<Widget>[
              const Center( 
                child: Text(
                  'Introduce My Self', 
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30, 
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey
                  ), // Optional: Style the text
                ),
              ),
              const SizedBox(height: 10.0),
              Container(
                width: 360.0,
                height: 212.0,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/wolf.jpg'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                ),
              ),
              const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
                ),
            _showPersonalData('Nama', ': Ahmadhani Fajar Aditama'),
            _showPersonalData('Alamat', ': Sukoharjo, Jawa Tengah'),
            _showPersonalData('Umur', ': 20 Tahun'),
            _showPersonalData('Divisi', ': Capability Center Division'),
            _showPersonalData('Harapan Tentang Training', ': Saya bisa tanpa chatgpt'),
            
            Card(
              clipBehavior: Clip.antiAlias,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: [
                    const ListTile(
                      title: Text(
                        'File Program Saya',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                    ),
                    
                    Row(
                      children: [
                        const SizedBox(width: 10.0),
                        TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.blueGrey,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                              
                            ),
                          ),
                          child: const Text('Snackbar'), 
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const Latihan(title: 'Latihan',)));
                          } 
                        ),
                        const SizedBox(width: 10.0),
                        TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.blueGrey,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                              
                            ),
                          ),
                          child: const Text('Counter'), 
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const MyHomePage(title: 'Counter',)));
                          } 
                        ),
                        const SizedBox(width: 10.0),
                        TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.blueGrey,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                              
                            ),
                          ),
                          child: const Text('Day 5'), 
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const FutureBuilderPage(title: 'Future Builder',)));
                          } 
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            Card(
              clipBehavior: Clip.antiAlias,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: [
                    const ListTile(
                      title: Text(
                        'Social Media',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon : const Icon(Icons.facebook), 
                          onPressed: () {
                            const snackBar = SnackBar(
                              /// need to set following properties for best effect of awesome_snackbar_content
                              elevation: 0,
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.transparent,
                              content: AwesomeSnackbarContent(
                                title: 'Yaahhh, kepo lu!',
                                message:
                                    'Langsung ngomong aja kalo pengen lihat',

                                /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                                contentType: ContentType.help,
                              ),
                            );
                            ScaffoldMessenger.of(context)
                              ..hideCurrentSnackBar()
                              ..showSnackBar(snackBar);
                            _launchUrl('https://www.facebook.com/ahmadhani.fajaraditama');
                          },
                        ),
                        IconButton(
                          onPressed: () {
                            _launchUrl('https://www.instagram.com/adf_aditama/');
                          }, 
                          icon: const FaIcon(FontAwesomeIcons.instagram)
                        ),
                        IconButton(
                          onPressed: () {
                            _launchUrl('https://wa.me/6283836958086');
                          }, 
                          icon: const FaIcon(FontAwesomeIcons.whatsapp)
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          const BottomNavigationBarItem(icon: Icon(Icons.car_crash), label: 'Car Crash'),
          const BottomNavigationBarItem(icon: Icon(Icons.badge), label: 'Product'),
          const BottomNavigationBarItem(icon: Icon(Icons.people), label: 'profile'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueGrey,
        unselectedItemColor: Colors.grey[200],
        onTap:(value) {
          setState(() {
            _selectedIndex = value;
          });
        },
      ),
    );
  }
}

Future<void> _launchUrl(String url) async {
  if (!await launchUrl(Uri.parse(url))) {
    throw Exception('Could not lunch $_url');
  }
}
