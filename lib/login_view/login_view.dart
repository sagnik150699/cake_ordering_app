import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sign_button/sign_button.dart';
import '../components.dart';
import '../view_model.dart';
import 'login_utlis_view.dart';

class LoginView extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModelProvider = ref.watch(viewModel);
    final double deviceHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pinkAccent.shade400,
          title: OpenSans(
            text: "OrderCake",
            size: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: deviceHeight / 6),
              Center(
                child: Image.asset("assets/chocolate-cake.png", width: 310.0),
              ),
              SizedBox(height: 30.0),
              EmailAndPasswordFields(),
              SizedBox(height: 30.0),
              RegisterAndLoginButtons(),
              SizedBox(height: 30.0),
              //Google SignInButton
              SignInButton(
                buttonType: ButtonType.google,
                btnColor: Colors.pinkAccent.shade400,
                btnTextColor: Colors.white,
                buttonSize: ButtonSize.large,
                onPressed: () async {
                  if (kIsWeb) {
                    await viewModelProvider.signInWithGoogleWeb(context);
                  } else {
                    await viewModelProvider.signInWithGoogleMobile(context);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
