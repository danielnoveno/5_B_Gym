import 'package:flutter/material.dart';
import 'package:tubes_pbp_gym/view/datadiri/jeniskelamin.dart';
import 'package:tubes_pbp_gym/entitiy/Pelanggan.dart';
import 'package:tubes_pbp_gym/client/PelangganClient.dart';

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
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController notelpController = TextEditingController();
  TextEditingController umurController = TextEditingController(); // Age field
  TextEditingController alamatController = TextEditingController();

  String? selectedValue;
  List<String> dropdownItems = ['Pengguna', 'Trainer'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kembali', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
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
                      return 'Alamat Tidak Boleh Kosong';
                    }
                    return null;
                  },
                  controller: alamatController,
                  hintTxt: "Alamat",
                  helperTxt: "Masukkan Alamat Anda",
                  iconData: Icons.location_on,
                ),
                inputForm(
                  (p0) {
                    if (p0 == null || p0.isEmpty) {
                      return 'Umur tidak boleh kosong';
                    }
                    if (int.tryParse(p0) == null) {
                      return 'Umur harus berupa angka';
                    }
                    return null;
                  },
                  controller: umurController,
                  hintTxt: "Umur",
                  helperTxt: "Masukkan Umur Anda",
                  iconData: Icons.cake,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: SizedBox(
                    width: 390,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButtonFormField<String>(
                        value: selectedValue,
                        dropdownColor: const Color(0xFF636363),
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
                          fillColor: const Color(0xFF636363),
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
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      try {
                        // Directly using the umurController value for age
                        int age = int.parse(umurController.text);

                        // Use default value for alamat if empty
                        String alamat = alamatController.text.isEmpty
                            ? "Alamat tidak tersedia"
                            : alamatController.text;

                        // Corrected DateTime assignment for tanggalDaftar
                        DateTime tanggalDaftar = DateTime.now();

                        // Include password in the Pelanggan object
                        Pelanggan pelanggan = Pelanggan(
                          idPelanggan: 0, // Assuming ID is auto-generated
                          nama: namaController.text,
                          umur: age, // Age taken from input
                          alamat: alamat, // Using the alamat value
                          noTelepon: notelpController.text,
                          email: emailController.text,
                          password:
                              passwordController.text, // Add password here
                          tanggalDaftar: tanggalDaftar, // Now using DateTime
                        );

                        // Send data to the API
                        var response = await PelangganClient.create(pelanggan);
                        if (response.statusCode == 201) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => JenisKelamin(data: {}),
                            ),
                          );
                        } else {
                          // Log the error response to inspect the details
                          print('Error: ${response.statusCode}');
                          print('Response Body: ${response.body}');

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Error: ${response.body}')),
                          );
                        }
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Error: $e')),
                        );
                      }
                    }
                  },
                  child: const Text('Lanjut',
                      style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(175, 194, 73, 255),
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 170),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding inputForm(
    String? Function(String?)? validator, {
    required TextEditingController controller,
    required String hintTxt,
    required String helperTxt,
    required IconData iconData,
    bool password = false,
  }) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        controller: controller,
        obscureText: password,
        validator: validator,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          prefixIcon: Icon(iconData, color: Colors.white),
          filled: true,
          fillColor: const Color(0xFF636363),
          hintText: hintTxt,
          hintStyle: const TextStyle(color: Colors.white),
          helperText: helperTxt,
          helperStyle: const TextStyle(color: Colors.white),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
