import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  // TODO 1 : Deklarasikan Variabel
  final TextEditingController _userNameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  String _errorText = "";

  bool _textSignedIn = false;

  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO 2 : Pasang Appbar
      appBar: AppBar(
        title: Text("Sign In"),
      ),
      // TODO 3 : Pasang Body
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
                child: Column(
              // TODO 4 : Atur mainAxisAlignment dan crossAxisAlignment
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // TODO 5 : Pasang TextFormField Nama Pengguna
                TextFormField(
                  controller: _userNameController,
                  decoration: const InputDecoration(
                    labelText: "Nama Pengguna",
                    border: OutlineInputBorder(),
                  ),
                ),
                // TODO 6 : Pasang TextFormField Kata Sandi
              const  SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                      labelText: "Password",
                      errorText: _errorText.isNotEmpty ? _errorText : null,
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                        icon: Icon(_obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility),
                      )),
                  obscureText: _obscurePassword,
                ),
               const SizedBox(
                  height: 20,
                ),
                // TODO 7 : Pasang ElevatedButton Sign In
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Sign In"),
                ),
              const   SizedBox(
                  height: 20,
                ),
                // TODO 8 : Pasang TextButton Sign Up

                // TextButton(
                //   onPressed: (){},
                //   child: Text("Belum Punya Akun?, Daftar Disini!!")
                //   )

                RichText(
                    text: TextSpan(
                        text: "Belum Punya Akun? ",
                        style:
                            TextStyle(fontSize: 16, color: Colors.deepPurple),
                        children: <TextSpan>[
                      TextSpan(
                        text: "Daftar Disini",
                        style: const TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                            fontSize: 16),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      )
                    ]))
              ],
            )),
          ),
        ),
      ),
    );
  }
}
