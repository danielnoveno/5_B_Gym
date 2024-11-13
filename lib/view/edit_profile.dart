import 'package:flutter/material.dart';
import 'package:gd_widget2_b_11663/components/form_edit.dart';
import 'package:gd_widget2_b_11663/view/profile.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  File? _image;
  final picker = ImagePicker();

  Future<void> _pickImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _pickImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Widget _buildImageSourceSelector() {
    return Container(
      height: 100,
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.camera),
            title: Text("Ambil foto dari kamera"),
            onTap: () {
              Navigator.pop(context);
              _pickImageFromCamera();
            },
          ),
          ListTile(
            leading: Icon(Icons.photo_library),
            title: Text("Pilih dari galeri"),
            onTap: () {
              Navigator.pop(context);
              _pickImageFromGallery();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              // Title
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Text(
                  'My Profile',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // Profile picture with edit icon overlay
              Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: _image != null
                        ? FileImage(_image!)
                        : AssetImage("images/FotoProfil.png") as ImageProvider,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: IconButton(
                      icon: Icon(Icons.edit, color: Colors.white, size: 30),
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (_) => _buildImageSourceSelector(),
                        );
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                "Ubah Profil",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
              // Profile information fields
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    form_edit('Nama Pengguna', 'Mariwow', editable: true),
                    form_edit('Email', 'marimar@gmail.com', editable: false),
                    form_edit('Nomor Telp', '08123123123', editable: false),
                    form_edit('Berat Badan (Kg)', '75', editable: true),
                    form_edit('Tinggi Badan (Cm)', '180', editable: true),
                    const SizedBox(height: 20),
                    // Save button
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pop(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProfileView()),
                        );
                      },
                      icon:
                          const Icon(Icons.save_outlined, color: Colors.white),
                      label: const Text('Simpan',
                          style: TextStyle(color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(175, 194, 73, 255),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 135),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
