import 'package:cloud_firestore/cloud_firestore.dart';

const String userCollection = 'users';
const String chatCollection = 'chats';
const String messagesCollection = 'messages';

class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  DatabaseService();
}
