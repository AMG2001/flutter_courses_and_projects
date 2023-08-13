import 'package:flutter/material.dart';
import 'package:learn_work_manager/services/bio_metric/bioetric.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Biometric.instance.initBiometricAuth();
  runApp(FingerPrintApp());
}

class FingerPrintApp extends StatelessWidget {
  const FingerPrintApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () async {
              await Biometric.instance.authinticateWithFingerprint(
                  messageToUser:
                      'Please pass Security test to start Transaction');
            },
            child: Text("Check Biometric")),
      ),
    );
  }
}
