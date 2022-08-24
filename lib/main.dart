import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Open Whatsapp',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final phoneNumberController = TextEditingController();

  @override
  void dispose() {
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Open Whatsapp'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 100),
        child: Column(
          children: [
            const Text(
              "Please Enter phone number with country code. \n\ni.e 923226930784",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(height: 40),
            TextField(
              controller: phoneNumberController,
              keyboardType: TextInputType.phone,
              autofocus: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: '92322xxxxxx',
              ),
            ),
            const SizedBox(height: 40),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(40),
              ),
              height: 60,
              width: MediaQuery.of(context).size.width,
              child: TextButton(
                onPressed: () => _openWhatsapp(),
                child: const Text(
                  "Open Whatsapp",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _openWhatsapp() async {
    if (phoneNumberController.text.length > 10) {
      final Uri url = Uri.parse(
          'https://api.whatsapp.com/send?phone=${phoneNumberController.text}');
      if (!await launchUrl(url)) {
        throw 'Could not launch $url';
      }
    }
  }
}
