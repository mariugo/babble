import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

import '/services/database_service.dart';
import '/services/navigation_service.dart';
import '/models/chat_user.dart';

class AuthenticationProvider extends ChangeNotifier {
  late final FirebaseAuth _auth;
  late final NavigationService _navigationService;
  late final DatabaseService _databaseService;
  late ChatUser user;

  AuthenticationProvider() {
    _auth = FirebaseAuth.instance;
    _navigationService = GetIt.instance.get<NavigationService>();
    _databaseService = GetIt.instance.get<DatabaseService>();

    _auth.signOut();

    _auth.authStateChanges().listen((_user) {
      if (_user != null) {
        _databaseService.updateUserLastActiveTime(_user.uid);
        _databaseService.getUser(_user.uid).then((_snapshot) {
          Map<String, dynamic> _userData =
              _snapshot.data() as Map<String, dynamic>;
          user = ChatUser.fromJson(
            {
              'uid': _user.uid,
              'name': _userData['name'],
              'email': _userData['email'],
              'last_active': _userData['last_active'],
              'image': _userData['image'],
            },
          );
          _navigationService.removeAndNavigateToRoute('/home');
        });
      } else {
        _navigationService.removeAndNavigateToRoute('/login');
      }
    });
  }

  Future<void> login(String _email, String _password) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: _email, password: _password);
    } on FirebaseAuthException {
    } catch (error) {
      print(error);
    }
  }

  Future<String?> signUp(
      BuildContext context, String _email, String _password) async {
    try {
      UserCredential _userCredential = await _auth
          .createUserWithEmailAndPassword(email: _email, password: _password);
      return _userCredential.user!.uid;
    } on FirebaseAuthException {
      const firebaseAuthSnackBar =
          SnackBar(content: Text('Error registering user'));
      ScaffoldMessenger.of(context).showSnackBar(firebaseAuthSnackBar);
    } catch (error) {
      final authException =
          SnackBar(content: Text('Error: ' + error.toString()));
      ScaffoldMessenger.of(context).showSnackBar(authException);
    }
    return null;
  }

  Future<void> logOut() async {
    try {
      _auth.signOut();
    } catch (error) {
      print(error);
    }
  }
}
