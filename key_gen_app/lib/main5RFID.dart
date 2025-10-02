import 'package:flutter/material.dart';
import 'package:nfc_manager/ndef_record.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:nfc_manager_ndef/nfc_manager_ndef.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NfcScreen(),
    );
  }
}

class NfcScreen extends StatefulWidget {
  @override
  _NfcScreenState createState() => _NfcScreenState();
}

class _NfcScreenState extends State<NfcScreen> {
  String _nfcData = 'No data';
  final TextEditingController _textController = TextEditingController();

  get message => null;

  @override
  void initState() {
    super.initState();
    NfcManager.instance.isAvailable().then((isAvailable) {
      if (!isAvailable) {
        setState(() => _nfcData = 'NFC non disponibile su questo dispositivo');
      }
    });
  }

  /// Scrive testo su un tag NFC
  void _writeNfcTag() {
    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      final ndef = Ndef.from(tag);
      if (ndef == null) {
        setState(() => _nfcData = 'Il tag non supporta NDEF');
        NfcManager.instance.stopSession(errorMessageIos: 'NDEF non supportato');
        return;
      }

      if (!ndef.isWritable) {
        setState(() => _nfcData = 'Il tag non è scrivibile');
        NfcManager.instance.stopSession(errorMessageIos: 'Tag non scrivibile');
        return;
      }


      try {
        await ndef.write(message);
        setState(() => _nfcData = 'Scrittura completata!');
        NfcManager.instance.stopSession();
      } catch (e) {
        setState(() => _nfcData = 'Errore scrittura: $e');
        NfcManager.instance.stopSession(errorMessage: e.toString());
      }
    }, pollingOptions: {});
  }

  /// Legge un tag NFC
  void _readNfcTag() {
    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      final ndef = Ndef.from(tag);
      if (ndef == null) {
        setState(() => _nfcData = 'Il tag non è formattato NDEF');
        NfcManager.instance.stopSession(errorMessage: 'NDEF non supportato');
        return;
      }

      try {
        final message = await ndef.read();
        final record = message?.records.first;

        // La payload contiene [status byte + language code + testo]
        final payload = record?.payload;

        setState(() => _nfcData = 'Letto: $text');
        NfcManager.instance.stopSession();
      } catch (e) {
        setState(() => _nfcData = 'Errore lettura: $e');
        NfcManager.instance.stopSession(errorMessageIos: e.toString());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('NFC Screen')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _textController,
              decoration: const InputDecoration(labelText: 'Inserisci testo da scrivere'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _writeNfcTag,
              child: const Text('Scrivi su NFC'),
            ),
            ElevatedButton(
              onPressed: _readNfcTag,
              child: const Text('Leggi da NFC'),
            ),
            const SizedBox(height: 20),
            Text(_nfcData),
          ],
        ),
      ),
    );
  }
}
