import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:file_picker/file_picker.dart';

const String userCollection = 'users';

class CloudStorageService {
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  CloudStorageService();
}
