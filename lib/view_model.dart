import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '/models.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'components.dart';

final viewModel =
    ChangeNotifierProvider.autoDispose<ViewModel>((ref) => ViewModel());
final authStateProvider = StreamProvider<User?>(
  (ref) {
    return ref.read(viewModel).authStateChange;
  },
);

class ViewModel extends ChangeNotifier {
  final _auth = FirebaseAuth.instance;
  CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  Logger logger = Logger();
  bool isObscure = true;
  int filterViewNumber = 1;
  int cakeSize = 1;
  Stream<User?> get authStateChange => _auth.authStateChanges();
  toggleObscure() {
    isObscure = !isObscure;
    notifyListeners();
  }

  toggleCakeSize(int _cakeSize) {
    cakeSize = _cakeSize;
    notifyListeners();
  }

  String calculatePrice(price) {
    final priceCake = price * cakeSize;
    return priceCake.toString();
  }

  void changeFilterView(int filterNumber) {
    filterViewNumber = filterNumber;
    notifyListeners();
    logger.d("Change filter view number = $filterViewNumber");
  }

//Logout
  Future<void> logout() async {
    await _auth.signOut();
  }

// Get current user email or name
  Future<String> currentUserDetail() async {
    if (await _auth.currentUser!.displayName != null) {
      return await _auth.currentUser!.displayName.toString();
    } else
      return await _auth.currentUser!.email.toString();
  }

//Register
  Future<void> createUserWithEmailAndPassword(
      BuildContext context, String email, String password) async {
    await _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) => logger.d("Login successful for Registration"))
        .onError((error, stackTrace) {
      logger.d(error.toString());
      DialogBox(context, error.toString().replaceAll(RegExp('\\[.*?\\]'), ''));
    });
  }

  //Login
  Future<void> signInWithEmailAndPassword(
      BuildContext context, String email, String password) async {
    await _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) =>
            logger.d("Login successful for login with email and password"))
        .onError((error, stackTrace) {
      logger.d("Error from Login $error");
      DialogBox(context, error.toString().replaceAll(RegExp('\\[.*?\\]'), ''));
    });
  }

  //Google SignIn Web
  Future<void> signInWithGoogleWeb(BuildContext context) async {
    GoogleAuthProvider googleAuthProvider = GoogleAuthProvider();
    await _auth
        .signInWithPopup(googleAuthProvider)
        .onError((error, stackTrace) {
      logger.d("Error from Google Sign in Web ${error}");
      return DialogBox(
        context,
        error.toString().replaceAll(RegExp('\\[.*?\\]'), ''),
      );
    });
  }

  //Google SignIn Mobile
  Future<void> signInWithGoogleMobile(BuildContext context) async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn()
        .signIn()
        .onError((error, stackTrace) => DialogBox(
            context, error.toString().replaceAll(RegExp('\\[.*?\\]'), '')));

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

    await _auth
        .signInWithCredential(credential)
        .then((value) =>
            logger.d("Google Signin Mobile with crediatial successful"))
        .onError((error, stackTrace) =>
            logger.d("Google Signin Mobile Error $error"));
  }

  //Order Cake
  Future<void> orderCake(String name, int size, String price) async {
    String documentID = "";
    await userCollection.add(
      {
        "userID": _auth.currentUser!.uid,
        "name": name,
        "size": size,
        "price": price,
        "status": 1,
      },
    ).then((value) async {
      documentID = value.id;
      await userCollection.doc(documentID).set({
        "userID": _auth.currentUser!.uid,
        "name": name,
        "size": size,
        "price": price,
        "status": 1,
        "documentID": documentID
      });
      logger.d(value.id);
    });
  }

  List<OrderStatusModel> orders = [];
}
