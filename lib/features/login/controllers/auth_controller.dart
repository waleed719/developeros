import 'package:flutter/material.dart';
import '../models/auth_model.dart';

class AuthController extends ChangeNotifier {
  AuthState _state = Unauthenticated();
  AuthState get state => _state;

  void login() {
    _state = Authenticated('waleedqamar');
    notifyListeners();
  }

  void logout() {
    _state = Unauthenticated();
    notifyListeners();
  }
}
