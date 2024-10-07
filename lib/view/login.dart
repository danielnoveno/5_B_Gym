import 'package:flutter/material.dart';
import 'package:gd_widget2_b_11663/view/home.dart';
import 'package:gd_widget2_b_11663/view/register.dart';
import 'package:gd_widget2_b_11663/component/form_component.dart';

//update login
class LoginView extends StatefulWidget {
  final Map? data;
  const LoginView({super.key, this.data});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    Map? dataForm = widget.data;
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Header 'SymsalaGym'
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                  'SymsalaGym',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              // Username Input
              inputForm((p0) {
                if (p0 == null || p0.isEmpty) {
                  return "Username tidak boleh kosong";
                }
                return null;
              },
                  controller: usernameController,
                  hintTxt: "Username",
                  helperTxt: "Inputkan User yang telah didaftar",
                  iconData: Icons.person),
              // Password Input
              inputForm((p0) {
                if (p0 == null || p0.isEmpty) {
                  return "Password kosong";
                }
                return null;
              },
                  password: true,
                  controller: passwordController,
                  hintTxt: "Password",
                  helperTxt: "Inputkan Password",
                  iconData: Icons.password),
              // Buttons Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        if (dataForm!['username'] == usernameController.text &&
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
              // Login with Google Button
              ElevatedButton.icon(
                icon: Icon(Icons.g_translate),
                label: Text('Login dengan Google'),
                onPressed: () {
                  // Handle Google login here
                },
              ),
              // Login with Facebook Button // tambah ini
              ElevatedButton.icon(
                icon: Icon(Icons.facebook),
                label: Text('Login dengan Facebook'),
                onPressed: () {
                  // Handle Facebook login here
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void pushRegister(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const RegisterView(),
        ));
  }
}
