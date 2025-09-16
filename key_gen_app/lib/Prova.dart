import 'dart:convert';
import 'package:cryptography/cryptography.dart';

/// Esempio di utilizzo dell'algoritmo RSA-OAEP per la crittografia asimmetrica.
///
/// RSA-OAEP (Optimal Asymmetric Encryption Padding) è uno schema di padding utilizzato
/// insieme all'algoritmo RSA per la crittografia. Lo scopo principale di OAEP è quello
/// di rendere la crittografia RSA più sicura contro certi tipi di attacchi, in particolare
/// gli attacchi basati sulla malleabilità del cifrario.
///
/// Come funziona in breve:
/// 1. **Generazione delle chiavi**: Il destinatario genera una coppia di chiavi: una pubblica e una privata.
/// 2. **Crittografia**: Il mittente usa la chiave pubblica del destinatario per crittografare il messaggio.
/// 3. **Decrittografia**: Il destinatario usa la propria chiave privata per decifrare il messaggio.
///
void main() async {
  // 1. Generazione della coppia di chiavi asimmetriche (pubblica/privata)
  // Questo rappresenta il destinatario che crea le sue chiavi.
  final algorithm = RsaOaep.sha256(); // Utilizziamo RSA-OAEP per la crittografia
  final keyPair = await algorithm.newKeyPair();

  // Estrai la chiave pubblica
  final publicKey = await keyPair.extractPublicKey();
  print('--- Generazione delle Chiavi ---');
  print('Chiave Pubblica del Destinatario: ${publicKey.bytes.sublist(0, 30)}...');
  // Nota: la chiave privata non viene solitamente stampata o esposta direttamente.
  print('\n');

  // 2. Crittografia del messaggio (lato mittente)
  // Il mittente usa la chiave pubblica del destinatario per crittografare il messaggio.
  final message = utf8.encode('Ciao, questo è un messaggio segreto!');

  print('--- Crittografia del Messaggio ---');
  print('Messaggio Originale: ${utf8.decode(message)}');

  final encryptedMessage = await algorithm.encryptBytes( // Utilizziamo encryptBytes
    message,
    publicKey: publicKey,
  );

  print('Messaggio Crittografato: ${base64.encode(encryptedMessage.cipherText)}');
  print('\n');

  // 3. Decrittografia del messaggio (lato destinatario)
  // Il destinatario usa la sua chiave privata per decifrare il messaggio.
  // Per RSA-OAEP con il package `cryptography`, il `SecretBox` ricevuto da `encryptBytes`
  // contiene direttamente il testo cifrato. Non è necessario ricostruirlo o specificare
  // nonceLength o macLength in modo particolare per la decrittografia, poiché RSA-OAEP
  // gestisce il padding internamente.
  print('--- Decrittografia del Messaggio ---');
  final decryptedMessage = await algorithm.decryptBytes(encryptedMessage, keyPair: keyPair);

  print('Messaggio Decifrato: ${utf8.decode(decryptedMessage)}');

  if (utf8.decode(decryptedMessage) == utf8.decode(message)) {
    print('✅ Decrittografia riuscita! Il messaggio è corretto.');
  } else {
    print('❌ Errore nella decrittografia. Il messaggio non corrisponde.');
  }
}