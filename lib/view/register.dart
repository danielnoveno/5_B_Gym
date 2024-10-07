import 'package:flutter/material.dart';
import 'package:gd_widget2_b_11663/view/login.dart';
import 'package:gd_widget2_b_11663/component/form_component.dart';

//update register.dart v2
class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController notelpController = TextEditingController();
  TextEditingController tinggiController = TextEditingController();
  TextEditingController beratController = TextEditingController();
  TextEditingController umurController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            inputForm((p0) {
              if (p0 == null || p0.isEmpty) {
                return 'Username Tidak Boleh Kosong';
              }
              if (p0.toLowerCase() == 'anjing') {
                return 'Tidak Boleh Menggunakan kata kasar';
              }
              return null;
            },
                controller: usernameController,
                hintTxt: "Username",
                helperTxt: "Adel Rai",
                iconData: Icons.person),
            inputForm(((p0) {
              if (p0 == null || p0.isEmpty) {
                return 'Email tidak boleh kosong';
              }
              if (!p0.contains('@')) {
                return 'Email harus menggunakan @';
              }
              return null;
            }),
                controller: emailController,
                hintTxt: "Email",
                helperTxt: "adelrai@gmail.com",
                iconData: Icons.email),
            inputForm(
                //*Pola validasi lebih detail bisa menggunakan regex
                ((p0) {
              if (p0 == null || p0.isEmpty) {
                return 'Passowrd tidak boleh kosong';
              }
              if (p0.length < 5) {
                return 'Password minimal 5 digit';
              }
              return null;
            }),
                controller: passwordController,
                hintTxt: "Password",
                helperTxt: "xxxxxxx",
                iconData: Icons.password,
                password: true),
            inputForm(((p0) {
              if (p0 == null || p0.isEmpty) {
                return 'Nomor Telepon tidak boleh kosong';
              }
              return null;
            }),
                controller: notelpController,
                hintTxt: "No Telp",
                helperTxt: "08xxxxxxxxxx",
                iconData: Icons.phone_android),
            inputForm((p0) {
              if (p0 == null || p0.isEmpty) {
                return 'Tinggi Tidak Boleh Kosong';
              }
              return null;
            },
                controller: tinggiController,
                hintTxt: "Tinggi badan dalam cm",
                helperTxt: "xxx",
                iconData: Icons.height),
            inputForm((p0) {
              if (p0 == null || p0.isEmpty) {
                return 'Berat Tidak Boleh Kosong';
              }
              return null;
            },
                controller: beratController,
                hintTxt: "Berat badan dalam kg",
                helperTxt: "xx",
                iconData: Icons.nature_people),
            inputForm((p0) {
              if (p0 == null || p0.isEmpty) {
                return 'Umur Tidak Boleh Kosong';
              }
              return null;
            },
                controller: umurController,
                hintTxt: "Umur",
                helperTxt: "xx",
                iconData: Icons.emoji_people_outlined),
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Map<String, dynamic> formData = {};
                    formData['username'] = usernameController.text;
                    formData['password'] = passwordController.text;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => LoginView(data: formData),
                      ),
                    );
                  }
                },
                child: const Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
