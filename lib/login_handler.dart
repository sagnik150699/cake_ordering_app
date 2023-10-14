import 'package:flutter/material.dart';

import '/view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'login_view/login_view.dart';
import 'menu_view/menu_view.dart';

class LoginHandler extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _authState = ref.watch(authStateProvider);
    return _authState.when(
      data: (data) {
        if (data != null) {
          return MenuView();
        } else
          return LoginView();
      },
      error: (error, stackTrace) {
        return LoginView();
      },
      loading: (() => CircularProgressIndicator()),
    );
  }
}
