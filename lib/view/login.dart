import 'package:flutter/material.dart';
import 'package:gd_widget2_b_11663/view/1home.dart';
import 'package:gd_widget2_b_11663/view/register.dart';
import 'package:gd_widget2_b_11663/component/form_component.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginView extends StatefulWidget {
  final Map? data; // meminta data ? artinya bisa null
  const LoginView({super.key, this.data});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // fungsi untuk mendapatkan data dari inputan form field username dan password
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    // digunakan untuk memindahkan data, untuk passing
    Map? dataForm = widget.data;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 0, right: 20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'SymsalaGym',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                inputForm(
                  (p0) {
                    if (p0 == null || p0.isEmpty) {
                      return "Username tidak boleh kosong";
                    }
                    return null;
                  },
                  controller: usernameController,
                  hintTxt: "Username",
                  helperTxt: "Inputkan User yang telah didaftar",
                  iconData: Icons.person,
                ),
                inputForm(
                  (p0) {
                    if (p0 == null || p0.isEmpty) {
                      return "Password kosong";
                    }
                    return null;
                  },
                  password: true,
                  controller: passwordController,
                  hintTxt: "Password",
                  helperTxt: "Inputkan Password",
                  iconData: Icons.password,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          if (dataForm!['username'] ==
                                  usernameController.text &&
                              dataForm['password'] == passwordController.text) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (c) => const HomeView()));
                          } else {
                            showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                      title: const Text('Password Salah'),
                                      content: TextButton(
                                        onPressed: () => pushRegister(context),
                                        child: const Text('Daftar Disini !!'),
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context, 'Cancel'),
                                          child: const Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context, 'OK'),
                                          child: const Text('OK'),
                                        ),
                                      ],
                                    ));
                          }
                        }
                      },
                      child: const Text('Login'),
                    ),
                    TextButton(
                      onPressed: () => pushRegister(context),
                      child: const Text('Belum punya akun ?'),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  icon: const Icon(Icons.g_translate),
                  label: const Text('Login dengan Google'),
                  onPressed: () =>
                      _launchURL('https://accounts.google.com/signin'),
                ),
                const SizedBox(height: 10),
                ElevatedButton.icon(
                  icon: const Icon(Icons.facebook),
                  label: const Text('Login dengan Facebook'),
                  onPressed: () => _launchURL('https://www.facebook.com/login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void pushRegister(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const RegisterView()),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
