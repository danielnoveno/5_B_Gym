import 'package:flutter/material.dart';

import 'package:guidedlayout2_1664/View/home.dart';
import 'package:guidedlayout2_1664/View/register.dart';
import 'package:guidedlayout2_1664/component/form_component.dart';

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
              inputForm((p0){
                if (p0 == null || p0.isEmpty){
                  return "username tidak boleh kosong";
                } 
                return null;            
              },
                  controller: usernameController,
                  hintTxt:"Username",
                  helperTxt: "Inputkan User yang telah didaftar",
                  iconData: Icons.person),

                inputForm((p0){
                  if(p0 == null || p0.isEmpty){
                    return "password kosong";
                  }
                    return null;
                },
                    password:true,
                    controller: passwordController,
                    hintTxt: "Password",
                    helperTxt: "Inputkan Password",
                    iconData: Icons.password),
                  //*Baris yang berisi tombol ingin dan tombol mengarah ke halaman register
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //*tombol login
                  ElevatedButton(
                    //* Fungsi yang dijalamlam saat tombol ditekan
                    onPressed: (){
                      //*cek statenya sudah valid atau belum valid
                      if(_formKey.currentState!.validate()){
                        //* jika sudah valid, cek username dan password yang di inputkan pada form telah sesuai dengan data yang dibawah
                        //* dari halaman register atau belum
                        if(dataForm!['username'] == usernameController.text && dataForm['password'] == passwordController.text){
                          //* Jika sesuai navigasi ke halaman home
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>const HomeView()));
                        }else{
                          //* Jika belum tampilkan Alert dialog
                          showDialog(context: context, builder:(_)=>AlertDialog(
                            title: const Text('Password Salah'),
                            //* isi Alert dialog
                            content: TextButton(
                              //8 pushRegister(context) fungsi pada baris 118-124 untuk meminimalkan nested code
                              onPressed: () =>pushRegister(context),
                              child: const Text('Daftar Disini !!')),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: ()=> Navigator.pop(context, 'Cancel'),
                                  child: const Text('cancel'),
                                ),
                                TextButton(
                                  onPressed: () => Navigator.pop(context, "OK"),
                                  child: const Text('OK'),
                                ),
                              ],
                            ),);
                        }
                      }
                    },
                    child: const Text('Login')),
                    TextButton(
                      onPressed: (){
                        Map<String, dynamic> formData = {};
                        formData['username'] = usernameController.text;
                        formData['password'] = passwordController.text;
                        pushRegister(context);
                      },
                      child: const Text('Belum punya akun?')),
                ],
              )
            ],
          ),
        ),
      ),
    );
    }
    void pushRegister(BuildContext context){
      Navigator.push(context, MaterialPageRoute(builder: (_)=> const RegisterView(),),);
  }
}