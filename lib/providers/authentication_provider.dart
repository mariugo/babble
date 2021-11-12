// ignore_for_file: avoid_print

import 'package:babble/models/chat_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '/services/database_service.dart';
import '/services/navigation_service.dart';

class AuthenticationProvider extends ChangeNotifier {
  late final FirebaseAuth _auth;
  late final NavigationService _navigationService;
  late final DatabaseService _databaseService;
  late ChatUser user;

  AuthenticationProvider() {
    _auth = FirebaseAuth.instance;
    _navigationService = GetIt.instance.get<NavigationService>();
    _databaseService = GetIt.instance.get<DatabaseService>();

    _auth.authStateChanges().listen((_user) {
      if (_user != null) {
        _databaseService.updateUserLastActiveTime(_user.uid);
        _databaseService.getUser(_user.uid).then((_snapshot) {
          Map<String, dynamic> _userData =
              _snapshot.data()! as Map<String, dynamic>;
          user = ChatUser.fromJson(
            {
              'uid': _user.uid,
              'name': _userData['name'],
              'email': _userData['email'],
              'last_active': _userData['last_active'],
              'image': _userData['image'],
            },
          );
          print(user.toMap());
        });
      } else {
        print('Not logged in');
      }
    });
  }

  Future<void> login(
      BuildContext context, String _email, String _password) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: _email, password: _password);
    } on FirebaseAuthException {
      const firebaseAuthSnackBar =
          SnackBar(content: Text('Authentication error'));
      ScaffoldMessenger.of(context).showSnackBar(firebaseAuthSnackBar);
    } catch (error) {
      final authException =
          SnackBar(content: Text('Error: ' + error.toString()));
      ScaffoldMessenger.of(context).showSnackBar(authException);
    }
  }
}
