import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // TODO 1 : Deklarasikan Variabel
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _namaLengkapController = TextEditingController();

  String _errorText = "";

  bool _textSignedIn = false;

  bool _obscurePassword = true;

// Membuat Method _signUp
  void _signUp() {
    String name = _namaLengkapController.text.trim();
    String userName = _userNameController.text.trim();
    String password = _passwordController.text.trim();

    if (password.length < 8 || !password.contains(RegExp(r'[A-Z]'))) {
      setState(() {
        _errorText = "Kriteria Password Tidak Terpenuhi";
      });
    } else {
      setState(() {
        _errorText = "";
        print('Sign Up Berhasil');
        print('Nama $name');
        print('Nama Pengguna : $userName');
        print('Password : $password');
      });
    }
  }

  // Membuat Method Dispose
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO 2 : Pasang Appbar
      appBar: AppBar(
        title: Text("Sign Up"),
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
                // TODO 5 : Pasang TextFormField Nama Lengkap Pengguna
                TextFormField(
                  controller: _namaLengkapController,
                  decoration: const InputDecoration(
                    labelText: "Nama Lengkap",
                    border: OutlineInputBorder(),
                  ),
                ),
                // TODO 6 : Pasang TextFormField Kata Sandi
                const SizedBox(
                  height: 20,
                ),
                // TODO 6 : Pasang TextFormField Nama Pengguna
                TextFormField(
                  controller: _userNameController,
                  decoration: const InputDecoration(
                    labelText: "Nama Pengguna",
                    border: OutlineInputBorder(),
                  ),
                ),
                // TODO 7 : Pasang TextFormField Kata Sandi
                const SizedBox(
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
                // TODO 8 : Pasang ElevatedButton Sign In
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Sign Up"),
                ),
                const SizedBox(
                  height: 20,
                ),
                // TODO 9 : Pasang TextButton Sign Up

                // TextButton(
                //   onPressed: (){},
                //   child: Text("Belum Punya Akun?, Daftar Disini!!")
                //   )

                RichText(
                    text: TextSpan(
                        text: "Sudah Punya Akun? ",
                        style:
                            TextStyle(fontSize: 16, color: Colors.deepPurple),
                        children: <TextSpan>[
                      TextSpan(
                        text: "Sign In Disini",
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
