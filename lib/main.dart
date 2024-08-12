import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RM. Sedap Rasa',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'RM. Sedap Rasa'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title, style: GoogleFonts.poppins()),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Image(
                image: AssetImage('assets/gambar_1.jpg'),
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.inverseSurface,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: IconButton(
                      onPressed: () {
                        _sendEmail();
                      },
                      icon: Icon(
                        Icons.email,
                        color: Theme.of(context).colorScheme.onInverseSurface,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.inverseSurface,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: IconButton(
                      onPressed: () {
                        _openPhone();
                      },
                      icon: Icon(
                        Icons.phone,
                        color: Theme.of(context).colorScheme.onInverseSurface,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.inverseSurface,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: IconButton(
                      onPressed: () {
                        _openMap();
                      },
                      icon: Icon(
                        Icons.map,
                        color: Theme.of(context).colorScheme.onInverseSurface,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Deskripsi",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "RM. Sedap Rasa adalah tempat makan yang menyediakan berbagai macam makanan khas Indonesia. Dengan harga yang terjangkau, RM. Sedap Rasa menjadi tempat makan favorit bagi masyarakat sekitar.",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "List Menu",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  """
• Nasi Sayur
• Nasi Sayur + Tempe
• Nasi Sayur + Ayam Goreng
• Nasi Sayur + Telur
• Nasi Sayur + Ikan
• Nasi Sayur + Lele
• Nasi Sayur + Rendang
• Es / Panas Teh Manis
• Es / Panas Teh Tawar
• Es / Panas Jeruk""",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Alamat",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Jl. Imam Bonjol No.207, Pendrikan Kidul, Kec. Semarang Tengah, Kota Semarang, Jawa Tengah 50131",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Jam Buka",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Senin - Jumat: 08.00 - 21.00\nSabtu - Minggu: 08.00 - 22.00",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _sendEmail() async {
    String email = Uri.encodeComponent("sekretariat@dinus.ac.id");
    String subject = Uri.encodeComponent("Tanya Seputar Resto");
    String body = Uri.encodeComponent(
        "Halo, saya ingin bertanya seputar menu yang ada di RM. Sedap Rasa.");

    if (kDebugMode) {
      print("mailto:$email?subject=$subject&body=$body");
    }

    var url = Uri.parse("mailto:$email?subject=$subject&body=$body");

    try {
      await launchUrl(url);
    } catch (e) {
      throw 'Could not launch $url, error: $e';
    }
  }

  void _openPhone() async {
    String phone = Uri.encodeComponent("(024) 3517261");

    if (kDebugMode) {
      print("tel:$phone");
    }

    var url = Uri.parse("tel:$phone");

    try {
      await launchUrl(url);
    } catch (e) {
      throw 'Could not launch $url, error: $e';
    }
  }

  void _openMap() async {
    String lat = "-6.982859";
    String long = "110.409089";

    if (kDebugMode) {
      print("https://www.google.com/maps/search/?api=1&query=$lat,$long");
    }

    var url =
        Uri.parse("https://www.google.com/maps/search/?api=1&query=$lat,$long");

    try {
      await launchUrl(url);
    } catch (e) {
      throw 'Could not launch $url, error: $e';
    }
  }
}
