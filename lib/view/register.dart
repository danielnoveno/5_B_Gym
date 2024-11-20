import 'package:flutter/material.dart';
import 'package:tubes_pbp_gym/view/login.dart';
import 'package:tubes_pbp_gym/components/form_component2.dart';
import 'package:tubes_pbp_gym/service/directToLink.dart';


class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController namaController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController notelpController = TextEditingController();
  TextEditingController tglLahirController = TextEditingController();

  String? selectedValue;
  List<String> dropdownItems = ['Pengguna', 'Trainer'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Kembali',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
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
                    height: 120,
                    width: 120,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    'SYMSALA GYM',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(174, 194, 73, 255)),
                  ),
                ),
                inputForm(
                  (p0) {
                    if (p0 == null || p0.isEmpty) {
                      return 'Nama Tidak Boleh Kosong';
                    }
                    if (p0.toLowerCase() == 'anjing') {
                      return 'Tidak Boleh Menggunakan kata kasar';
                    }
                    return null;
                  },
                  controller: namaController,
                  hintTxt: "Nama Lengkap",
                  helperTxt: "Masukkan Nama Lengkap Anda",
                  iconData: Icons.person_add_alt_1,
                ),
                inputForm(
                  (p0) {
                    if (p0 == null || p0.isEmpty) {
                      return 'Email tidak boleh kosong';
                    }
                    if (!p0.contains('@')) {
                      return 'Email harus menggunakan @';
                    }
                    return null;
                  },
                  controller: emailController,
                  hintTxt: "Email",
                  helperTxt: "Masukkan Email Anda",
                  iconData: Icons.email,
                ),
                inputForm(
                  (p0) {
                    if (p0 == null || p0.isEmpty) {
                      return 'Password tidak boleh kosong';
                    }
                    if (p0.length < 5) {
                      return 'Password minimal 5 digit';
                    }
                    return null;
                  },
                  controller: passwordController,
                  hintTxt: "Password",
                  helperTxt: "Masukkan Password Yang Diinginkan",
                  iconData: Icons.password,
                  password: true,
                ),
                inputForm(
                  (p0) {
                    if (p0 == null || p0.isEmpty) {
                      return 'Nomor Telepon tidak boleh kosong';
                    }
                    return null;
                  },
                  controller: notelpController,
                  hintTxt: "No Telp",
                  helperTxt: "Masukkan Nomor Telepon Anda",
                  iconData: Icons.phone_android,
                ),
                inputForm(
                  (p0) {
                    if (p0 == null || p0.isEmpty) {
                      return 'Tanggal Lahir Tidak Boleh Kosong';
                    }
                    return null;
                  },
                  controller: tglLahirController,
                  hintTxt: "DD/MM/YYYY",
                  helperTxt: "Masukkan Tanggal Lahir Anda",
                  iconData: Icons.date_range,
                ),
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
                            value == null ? 'Please select an option' : null,
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Map<String, dynamic> formData = {};
                      formData['nama'] = namaController.text;
                      formData['email'] = emailController.text;
                      formData['password'] = passwordController.text;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => LoginView(data: formData),
                        ),
                      );
                    }
                  },
                  child: const Text('Daftar',
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
                    '━━━━━━━━━ OR ━━━━━━━━━',
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
                        Direct.launchURL('https://g.co/kgs/R9fTeVW');
                      },
                    ),
                    SizedBox(width: 10),
                    ElevatedButton.icon(
                      icon: Icon(Icons.apple, size: 24),
                      label: Text(''),
                      onPressed: () {
                        Direct.launchURL('https://www.apple.com/id/');
                      },
                    ),
                    SizedBox(width: 10),
                    ElevatedButton.icon(
                      icon: Icon(Icons.facebook, size: 24),
                      label: Text(''),
                      onPressed: () {
                        Direct.launchURL(
                            'https://www.facebook.com/?locale=id_ID');
                      },
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () => pushLogin(context),
                  child: const Text('Sudah Punya Akun? Masuk'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void pushLogin(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => LoginView(data: {}),
        ));
  }
}
