import 'package:animal_spirit_app/pages/home/animals_home_page.dart';
import 'package:animal_spirit_app/pages/widgets/logo_text_widget.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpState();
}

class _SignUpState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _loginTextController;
  late TextEditingController _passwordTextController;
  late TextEditingController _passwordTextConfirmController;

  late FocusNode _loginFocusNode;
  late FocusNode _passwordFocusNode;
  late FocusNode _passwordConfirmNode;

  @override
  void initState() {
    super.initState();

    _loginTextController = TextEditingController();
    _passwordTextController = TextEditingController();
    _passwordTextConfirmController = TextEditingController();

    _loginFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    _passwordConfirmNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: const Color.fromARGB(255, 171, 207, 237),
        body: Form(
          key: _formKey,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  const SizedBox(
                    height: 50.0,
                  ),
                  const LogoTextWidget(),
                  const SizedBox(
                    height: 35.0,
                  ),
                  _makeLoginTextField(),
                  _makePasswordTextField(),
                  _makeConfirmPasswordTextField(),
                  const SizedBox(
                    height: 10.0,
                  ),
                  _makeSignUpButton(),
                  _makeBackButton(),
                ],
              ),
            ),
          ),
        ),
      );

  Padding _makeLoginTextField() => Padding(
        padding: const EdgeInsets.only(
          left: 25.0,
          right: 25.0,
          bottom: 20.0,
        ),
        child: TextFormField(
          controller: _loginTextController,
          focusNode: _loginFocusNode,
          maxLength: 50,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            label: Text('Login'),
            hintText: 'richard@email.com',
            border: OutlineInputBorder(),
          ),
          validator: (text) {
            if (text!.isEmpty) {
              return 'Insert your email to proceed!';
            }
            return null;
          },
        ),
      );

  Padding _makePasswordTextField() => Padding(
        padding: const EdgeInsets.only(
          left: 25.0,
          right: 25.0,
          bottom: 20.0,
        ),
        child: TextFormField(
          controller: _passwordTextController,
          focusNode: _passwordFocusNode,
          maxLength: 18,
          keyboardType: TextInputType.visiblePassword,
          obscureText: true,
          decoration: const InputDecoration(
            label: Text('Password'),
            border: OutlineInputBorder(),
          ),
          validator: (text) {
            if (text!.isEmpty) {
              return 'Insert your password to proceed!';
            }
            return null;
          },
        ),
      );

  Padding _makeConfirmPasswordTextField() => Padding(
        padding: const EdgeInsets.only(
          left: 25.0,
          right: 25.0,
          bottom: 20.0,
        ),
        child: TextFormField(
          controller: _passwordTextConfirmController,
          focusNode: _passwordConfirmNode,
          maxLength: 18,
          keyboardType: TextInputType.visiblePassword,
          obscureText: true,
          decoration: const InputDecoration(
            label: Text('Confirm Password'),
            border: OutlineInputBorder(),
          ),
          validator: (text) {
            if (text!.isEmpty) {
              return 'Confirm your password!';
            } else if (text != _passwordTextController.text) {
              return 'Passwords doesnt match!';
            }
            return null;
          },
        ),
      );

  SizedBox _makeSignUpButton() => SizedBox(
        width: 200.0,
        child: MaterialButton(
          color: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: const Text(
            'SIGN UP',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          onPressed: () => _formKey.currentState!.validate()
              ? Navigator.of(context).push(
                  AnimalsHomePage.route(),
                )
              : {},
        ),
      );

  SizedBox _makeBackButton() => SizedBox(
        width: 200.0,
        child: MaterialButton(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: const Text(
            'BACK',
            style: TextStyle(
              color: Colors.blue,
            ),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      );

  @override
  void dispose() {
    _loginTextController.dispose();
    _loginFocusNode.dispose();
    _passwordTextController.dispose();
    _passwordFocusNode.dispose();
    _passwordTextConfirmController.dispose();
    _passwordConfirmNode.dispose();

    super.dispose();
  }
}
