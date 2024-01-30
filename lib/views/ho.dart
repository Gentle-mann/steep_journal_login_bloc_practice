import 'package:flutter/material.dart';
import 'package:steep_journal_login_bloc_practice/dialogs/generic_dialog.dart';
import 'package:steep_journal_login_bloc_practice/enums/auth_enum.dart';
import 'package:steep_journal_login_bloc_practice/views/custom_button.dart';
import 'package:steep_journal_login_bloc_practice/views/email_field.dart';
import 'package:steep_journal_login_bloc_practice/views/password_field.dart';
import 'package:steep_journal_login_bloc_practice/views/username_field.dart';

typedef OnPressed = void Function(String email, String password);

class LoginView extends StatelessWidget {
  const LoginView({super.key, required this.onPressed});
  final OnPressed onPressed;
  @override
  Widget build(BuildContext context) {
    late final TextEditingController emailController = TextEditingController();
    late final TextEditingController passwordController =
        TextEditingController();
    late final TextEditingController usernameController =
        TextEditingController();
    AuthState authState = AuthState.login;
    return Column(
      children: [
        RadioListTile(
          title: const Text('Register'),
          value: AuthState.register,
          groupValue: authState,
          onChanged: ((value) {
            // setState(() {
            //   authState = AuthState.register;
            // });
          }),
        ),
        if (authState == AuthState.register)
          Column(
            children: [
              UsernameField(
                usernameController: usernameController,
              ),
              const SizedBox(
                height: 10,
              ),
              EmailField(
                emailController: emailController,
              ),
              const SizedBox(
                height: 10,
              ),
              PasswordField(
                passwordController: passwordController,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomButton(
                text: 'Register',
                onPressed: () {},
              ),
            ],
          ),
        RadioListTile.adaptive(
          title: const Text('Login'),
          value: AuthState.login,
          groupValue: authState,
          onChanged: (value) {
            // setState(() {
            //   authState = AuthState.login;
            // });
          },
        ),
        const SizedBox(
          height: 10,
        ),
        if (authState == AuthState.login)
          Column(
            children: [
              EmailField(
                emailController: emailController,
              ),
              const SizedBox(
                height: 10,
              ),
              PasswordField(
                passwordController: passwordController,
              ),
              CustomButton(
                text: 'Login',
                onPressed: () {
                  if (emailController.text.isEmpty ||
                      passwordController.text.isEmpty) {
                    showCustomDialog(
                      context: context,
                      title: 'Empty email or password',
                      content: 'You need to fill in your email and password',
                      optionsLoader: () => {
                        "OK": true,
                      },
                    );
                  } else {
                    onPressed(emailController.text, passwordController.text);
                    print('yo');
                  }
                },
              ),
            ],
          ),
      ],
    );
  }
}
