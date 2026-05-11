import 'package:flutter/material.dart';

class LoginPages extends StatefulWidget {
  const LoginPages({super.key});

  @override
  State<LoginPages> createState() => _LoginPagesState();
}

class _LoginPagesState extends State<LoginPages> {
  final formkey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController levelController = TextEditingController();
  final TextEditingController rankController = TextEditingController();
  final TextEditingController jobController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formkey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              const SizedBox(height: 40),
              const Center(
                child: Text(
                  "Register",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),

              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: "Nama",
                  hintText: "Input Nama",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Nama tidak boleh kosong";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),

              TextFormField(
                controller: levelController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Level",
                  hintText: "Input Level",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Level tidak boleh kosong";
                  }
                  if (int.tryParse(value.trim()) == null) {
                    return "Level hanya boleh diisi angka";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),

              TextFormField(
                controller: rankController,
                decoration: const InputDecoration(
                  labelText: "Rank",
                  hintText: "Input Rank (Contoh: S, A, B)",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Rank tidak boleh kosong";
                  }
                  if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value.trim())) {
                    return "Rank hanya boleh diisi huruf bukan angka";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),

              TextFormField(
                controller: jobController,
                decoration: const InputDecoration(
                  labelText: "Job",
                  hintText: "Input Job",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Job tidak boleh kosong";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),

              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Password",
                  hintText: "Input Password (minimal 8 karakter)",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Password tidak boleh kosong";
                  }
                  if (value.trim().length < 8) {
                    return "Password minimal harus 8 karakter";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),

              ElevatedButton(
                onPressed: () {
                  if (formkey.currentState!.validate()) {
                    Navigator.pushReplacementNamed(
                      context,
                      "/",
                      arguments: {
                        "name": nameController.text.trim(),
                        "level": int.parse(levelController.text.trim()),
                        "rank": rankController.text.trim().toUpperCase(),
                        "job": jobController.text.trim(),
                        "password": passwordController.text.trim(),
                      },
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: const Text("Register", style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
