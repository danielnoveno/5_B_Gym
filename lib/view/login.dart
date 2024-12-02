import 'package:flutter/material.dart';
import 'package:tubes_pbp_gym/view/home.dart';
import 'package:tubes_pbp_gym/view/register.dart';
import 'package:tubes_pbp_gym/components/form_component.dart';
import 'package:tubes_pbp_gym/service/directToLink.dart';
import 'package:tubes_pbp_gym/api/auth_service.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

List<String> dropdownItems = ['Pengguna', 'Trainer'];

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Image.asset(
                    'images/gym.png',
                    height: 160,
                    width: 160,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    'SYMSALA GYM',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(174, 194, 73, 255)),
                  ),
                ),
                inputForm((p0) {
                  if (p0 == null || p0.isEmpty) {
                    return "Email tidak boleh kosong";
                  }
                  return null;
                },
                    controller: emailController,
                    hintTxt: "Email",
                    helperTxt: "Inputkan Email yang telah didaftarkan",
                    iconData: Icons.email),
                inputForm((p0) {
                  if (p0 == null || p0.isEmpty) {
                    return "Sandi kosong";
                  }
                  return null;
                },
                    password: true,
                    controller: passwordController,
                    hintTxt: "Password",
                    helperTxt: "Inputkan Password yang telah didaftarkan",
                    iconData: Icons.password),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: SizedBox(
                    width: 350,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButtonFormField<String>(
                        value: selectedValue,
                        dropdownColor: Color(0xFF636363),
                        items: dropdownItems.map((item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text(
                              item,
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value;
                          });
                        },
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'Peran',
                          hintStyle: const TextStyle(color: Colors.white),
                          helperText: 'Masukkan Peran Anda',
                          helperStyle: const TextStyle(color: Colors.white),
                          filled: true,
                          fillColor: Color(0xFF636363),
                          prefixIcon: Icon(Icons.person, color: Colors.white),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        validator: (value) =>
                            value == null ? 'Peran harus dipilih' : null,
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final response = await AuthService.login(
                        email: emailController.text,
                        password: passwordController.text,
                        role: selectedValue,
                      );

                      if (response['status'] == 'success') {
                        // Save token (optional: use a secure storage package)
                        // Navigate to the home page
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => const HomeView()),
                        );
                      } else {
                        // Show error message
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(response['message'])),
                        );
                      }
                    }
                  },
                  child: const Text('Masuk',
                      style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(175, 194, 73, 255),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 135),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20, top: 20, left: 15),
                  child: Text(
                    '━━━━━━━ OR ━━━━━━━',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      icon: Icon(Icons.g_mobiledata, size: 24),
                      label: Text(''),
                      onPressed: () {
                        Direct.launchURL(
                            'https://g.co/kgs/R9fTeVW'); // Google login link
                      },
                    ),
                    SizedBox(width: 10),
                    ElevatedButton.icon(
                      icon: Icon(Icons.apple, size: 24),
                      label: Text(''),
                      onPressed: () {
                        Direct.launchURL(
                            'https://www.apple.com/id/'); // Apple login link
                      },
                    ),
                    SizedBox(width: 10),
                    ElevatedButton.icon(
                      icon: Icon(Icons.facebook, size: 24),
                      label: Text(''),
                      onPressed: () {
                        Direct.launchURL(
                            'https://www.facebook.com/?locale=id_ID'); // Facebook login link
                      },
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () => pushRegister(context),
                  child: const Text('Belum punya akun? Daftar disini'),
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
      MaterialPageRoute(
        builder: (_) => const RegisterView(),
      ),
    );
  }
}
