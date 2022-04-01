import 'package:animal_spirit_app/pages/sing_up/sign_up_page.dart';
import 'package:animal_spirit_app/pages/home/animals_home_page.dart';
import 'package:animal_spirit_app/pages/widgets/logo_text_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _loginTextController;
  late TextEditingController _passwordTextController;

  late FocusNode _loginFocusNode;
  late FocusNode _passwordFocusNode;

  @override
  void initState() {
    super.initState();

    _loginTextController = TextEditingController();
    _passwordTextController = TextEditingController();

    _loginFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
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
                  _makeCuteCatAvatar(),
                  const SizedBox(
                    height: 25.0,
                  ),
                  const LogoTextWidget(),
                  _makeAppDescription(),
                  const SizedBox(
                    height: 35.0,
                  ),
                  _makeLoginTextField(),
                  _makePasswordTextField(),
                  _makeLoginButton(),
                  const SizedBox(
                    height: 10.0,
                  ),
                  _makeSignUpLabel(),
                ],
              ),
            ),
          ),
        ),
      );

  CircleAvatar _makeCuteCatAvatar() => const CircleAvatar(
        radius: 80.0,
        backgroundImage: AssetImage('assets/kitten_avatar.jpeg'),
      );

  Text _makeAppDescription() => const Text(
        'Come and see cool facts about animals !',
        textAlign: TextAlign.center,
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
            if (text == '' || text == null) {
              return 'Insert your password!';
            }
            return null;
          },
        ),
      );

  SizedBox _makeLoginButton() => SizedBox(
        width: 200.0,
        child: MaterialButton(
          color: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: const Text(
            'LOGIN',
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

  GestureDetector _makeSignUpLabel() => GestureDetector(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const SignUpPage(),
          ),
        ),
        child: const Text('Sign Up for free !'),
      );

  @override
  void dispose() {
    _loginTextController.dispose();
    _loginFocusNode.dispose();
    _passwordTextController.dispose();
    _passwordFocusNode.dispose();

    super.dispose();
  }
}
