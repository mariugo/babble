import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

const String userCollection = 'users';

class CloudStorageService {
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  CloudStorageService();

  Future<String?> saveUserImageToStorage(String _uid, File _file) async {
    try {
      final imageExtension = path.extension(_file.path);
      Reference _ref = _firebaseStorage
          .ref()
          .child('images/users/$_uid/profile.$imageExtension');
      UploadTask _task = _ref.putFile(_file);

      return await _task.then(
        (_result) => _result.ref.getDownloadURL(),
      );
    } catch (error) {
      print("Error saving image" + error.toString());
    }
  }

  Future<String?> saveChatImageToStorage(
      String _chatID, String uid, File _file) async {
    final imageExtension = path.extension(_file.path);
    try {
      Reference _ref = _firebaseStorage.ref().child(
          'images/chat/$_chatID/${uid}_${Timestamp.now().microsecondsSinceEpoch}.$imageExtension');
      UploadTask _task = _ref.putFile(_file);
      return await _task.then((_result) => _result.ref.getDownloadURL());
    } catch (e) {
      print("Error saving chat image" + e.toString());
    }
  }
}
