import 'dart:io';
import 'package:flutter/material.dart';
import 'package:tubes_pbp_gym/entitiy/Pelanggan.dart';
import 'package:tubes_pbp_gym/client/PelangganClient.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tubes_pbp_gym/components/form_edit.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  File? _image;
  final picker = ImagePicker();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  Pelanggan? _pelanggan;

  @override
  void initState() {
    super.initState();
    _fetchProfile();
  }

  Future<void> _fetchProfile() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      int? userId = prefs.getInt('userId');

      if (userId == null) {
        throw Exception('User not logged in');
      }

      Pelanggan pelanggan = await PelangganClient.find(userId);
      setState(() {
        _pelanggan = pelanggan;
        _nameController.text = pelanggan.nama;
        _emailController.text = pelanggan.email;
        _phoneController.text = pelanggan.noTelepon;
      });
    } catch (e) {
      print('Error fetching profile: $e');
    }
  }

  Future<void> _updateProfile() async {
    if (_pelanggan == null) return;

    try {
      _pelanggan!.nama = _nameController.text;
      _pelanggan!.email = _emailController.text;
      _pelanggan!.noTelepon = _phoneController.text;

      final response = await PelangganClient.update(_pelanggan!);

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Profile updated successfully!')),
        );
        final prefs = await SharedPreferences.getInstance();
      prefs.setString('userName', _nameController.text);
      prefs.setString('userEmail', _emailController.text);
      prefs.setString('userPhone', _phoneController.text);

      // Refresh profile data after update
      _fetchProfile();

        Navigator.pop(context);
      } else {
        throw Exception('Failed to update profile');
      }
    } catch (e) {
      print('Error updating profile: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error updating profile')),
      );
    }
  }

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
          child: _pelanggan == null
              ? const Center(child: CircularProgressIndicator())
              : Column(
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
                              : AssetImage("images/FotoProfil.png")
                                  as ImageProvider,
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
                    const SizedBox(height: 10),
                    Text(
                      "Ubah Profil",
                      style: const TextStyle(
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
                          form_edit('Nama Pengguna', _nameController.text,
                              editable: true, controller: _nameController),
                          form_edit('Email', _emailController.text,
                              editable: true, controller: _emailController),
                          form_edit('Nomor Telp', _phoneController.text,
                              editable: true, controller: _phoneController),
                          const SizedBox(height: 20),
                          // Save button
                          ElevatedButton.icon(
                            onPressed: _updateProfile,
                            icon: const Icon(Icons.save_outlined,
                                color: Colors.white),
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
