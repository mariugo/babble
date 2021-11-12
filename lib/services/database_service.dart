import 'package:cloud_firestore/cloud_firestore.dart';

const String userCollection = 'users';
const String chatCollection = 'chats';
const String messagesCollection = 'messages';

class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  DatabaseService();

  Future<DocumentSnapshot> getUser(String _uid) async {
    return await _db.collection(userCollection).doc(_uid).get();
  }

  Future<void> updateUserLastActiveTime(String _uid) async {
    try {
      await _db.collection(userCollection).doc(_uid).update({
        "last_active": DateTime.now().toUtc(),
      });
    } catch (e) {
      print(e);
    }
  }
}
