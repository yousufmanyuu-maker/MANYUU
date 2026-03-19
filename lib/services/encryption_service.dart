import 'dart:convert';
import 'dart:typed_data';
import 'package:encrypt/encrypt.dart';
import 'package:pointycastle/api.dart';

class EncryptionService {
  /// Generates a pair of RSA keys.
  AsymmetricKeyPair<PublicKey, PrivateKey> generateKeyPair({int bitLength = 2048}) {
    final keyGen = KeyGenerator();
    // Add the key generation method here.
    final keyPair = keyGen.generateKeyPair();
    return keyPair;
  }

  /// Encrypts a message using the RSA public key.
  String encrypt(String plainText, PublicKey publicKey) {
    final encrypter = Encrypter(RSA(publicKey: publicKey));
    final encrypted = encrypter.encrypt(plainText);
    return encrypted.base64;
  }

  /// Decrypts a message using the RSA private key.
  String decrypt(String encryptedText, PrivateKey privateKey) {
    final encrypter = Encrypter(RSA(privateKey: privateKey));
    final decrypted = encrypter.decrypt64(encryptedText);
    return decrypted;
  }

  /// Example usage of the service.
  void example() {
    final keyPair = generateKeyPair();
    final publicKey = keyPair.publicKey;
    final privateKey = keyPair.privateKey;

    String originalMessage = 'Hello, Peer!';
    String encryptedMessage = encrypt(originalMessage, publicKey);
    String decryptedMessage = decrypt(encryptedMessage, privateKey);

    print('Original: \$originalMessage');
    print('Encrypted: \$encryptedMessage');
    print('Decrypted: \$decryptedMessage');
  }
}