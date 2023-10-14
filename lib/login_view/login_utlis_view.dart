import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/components.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../view_model.dart';

TextEditingController _emailField = TextEditingController();
TextEditingController _passwordField = TextEditingController();

class EmailAndPasswordFields extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModelProvider = ref.watch(viewModel);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3.0),
      child: Column(
        children: [
          //Email
          SizedBox(
            width: 330.0,
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              controller: _emailField,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.pinkAccent.shade400),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.pinkAccent.shade700),
                      borderRadius: BorderRadius.all(Radius.circular(15.0))),
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.pinkAccent.shade400,
                    size: 30.0,
                  ),
                  hintText: "Email",
                  hintStyle: GoogleFonts.openSans()),
            ),
          ),
          SizedBox(height: 20.0),
          //Password
          SizedBox(
            width: 330.0,
            child: TextFormField(
              textAlign: TextAlign.center,
              controller: _passwordField,
              obscureText: viewModelProvider.isObscure,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.pinkAccent.shade400),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.pinkAccent.shade700),
                      borderRadius: BorderRadius.circular(15.0)),
                  prefixIcon: IconButton(
                    onPressed: () {
                      viewModelProvider.toggleObscure();
                    },
                    icon: Icon(
                      viewModelProvider.isObscure
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.pinkAccent.shade400,
                      size: 30.0,
                    ),
                  ),
                  hintText: "Password",
                  hintStyle: GoogleFonts.openSans()),
            ),
          )
        ],
      ),
    );
  }
}

class RegisterAndLoginButtons extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModelProvider = ref.watch(viewModel);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Register button
          SizedBox(
            height: 50.0,
            width: 150.0,
            child: MaterialButton(
              onPressed: () async {
                await viewModelProvider.createUserWithEmailAndPassword(
                    context, _emailField.text, _passwordField.text);
              },
              child: OpenSans(text: "Register", size: 24.0),
              splashColor: Colors.pink,
              color: Colors.pinkAccent.shade400,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          SizedBox(width: 10.0),
          Text(
            "OR",
            style: GoogleFonts.pacifico(fontSize: 15.0),
          ),

          SizedBox(width: 10.0),
          //Login button
          SizedBox(
              height: 50.0,
              width: 150.0,
              child: MaterialButton(
                child: OpenSans(
                  text: "Login",
                  size: 24.0,
                ),
                onPressed: () async {
                  await viewModelProvider.signInWithEmailAndPassword(
                      context, _emailField.text, _passwordField.text);
                },
                splashColor: Colors.pink,
                color: Colors.pinkAccent.shade400,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ))
        ],
      ),
    );
  }
}
