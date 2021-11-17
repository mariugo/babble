// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';

const String userCollection = 'users';
const String chatCollection = 'chats';
const String messagesCollection = 'messages';

class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  DatabaseService();

  Future<void> createUser(
      String _uid, String _email, String _name, String _imageURL) async {
    try {
      await _db.collection(userCollection).doc(_uid).set(
        {
          'email': _email,
          'name': _name,
          'last_active': DateTime.now().toUtc(),
          'image': _imageURL,
        },
      );
    } catch (e) {
      print(e);
    }
  }

  Future<DocumentSnapshot> getUser(String _uid) async {
    return await _db.collection(userCollection).doc(_uid).get();
  }

  Future<QuerySnapshot> getUsers(String? name) {
    Query _query = _db.collection(userCollection);
    if (name != null) {
      _query = _query
          .where('name', isGreaterThanOrEqualTo: name)
          .where('name', isLessThanOrEqualTo: name + 'z');
    }
    return _query.get();
  }

  Stream<QuerySnapshot> getChatsForUser(String _uid) {
    return _db
        .collection(chatCollection)
        .where('members', arrayContains: _uid)
        .snapshots();
  }

  Future<QuerySnapshot> getLastMessageForChat(String _chatID) {
    return _db
        .collection(chatCollection)
        .doc(_chatID)
        .collection(messagesCollection)
        .orderBy('sent_time', descending: true)
        .limit(1)
        .get();
  }

  Stream<QuerySnapshot> streamMessagesForChat(String _chatID) {
    return _db
        .collection(chatCollection)
        .doc(_chatID)
        .collection(messagesCollection)
        .orderBy("sent_time", descending: false)
        .snapshots();
  }

  // Future<void> addMessageToChat(String _chatID, ChatMessage _message) async {
  //   try {
  //     await _db
  //         .collection(chatCollection)
  //         .doc(_chatID)
  //         .collection(messagesCollection)
  //         .add(
  //           _message.toJson(),
  //         );
  //   } catch (e) {
  //     print(e);
  //   }
  // }

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
