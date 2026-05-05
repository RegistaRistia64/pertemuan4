import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _levelController = TextEditingController();
  final TextEditingController _rankController = TextEditingController();
  final TextEditingController _jobController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    bool obscureText = false,
    required String? Function(String?) validator,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.pink),
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: controller,
            obscureText: obscureText,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(color: Colors.grey),
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.pink.shade100),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.pinkAccent, width: 2.0),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.red, width: 2.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.red, width: 2.0),
              ),
            ),
            validator: validator,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Icon(Icons.favorite, size: 64, color: Colors.pinkAccent),
                    const SizedBox(height: 16),
                    const Text(
                      "Pendaftaran Petualang Baru",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.pinkAccent,
                      ),
                    ),
                    const SizedBox(height: 32),
                    _buildTextField(
                      controller: _namaController,
                      label: "Nama Penjelajah",
                      hint: "Masukkan nama panggilanmu...",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Nama tidak boleh kosong";
                        }
                        return null;
                      },
                    ),
                    _buildTextField(
                      controller: _passwordController,
                      label: "Kata Sandi Rahasia",
                      hint: "Minimal 8 karakter...",
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password tidak boleh kosong";
                        }
                        if (value.length < 8) {
                          return "Password minimal terdiri dari 8 karakter";
                        }
                        return null;
                      },
                    ),
                    _buildTextField(
                      controller: _levelController,
                      label: "Level Saat Ini",
                      hint: "Berapa levelmu? (hanya angka)",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Level tidak boleh kosong";
                        }
                        if (int.tryParse(value) == null) {
                          return "Level hanya boleh diisi angka";
                        }
                        return null;
                      },
                    ),
                    _buildTextField(
                      controller: _rankController,
                      label: "Pangkat Petualang",
                      hint: "Rank kamu (hanya huruf, mis: S, A, B)...",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Rank tidak boleh kosong";
                        }
                        if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                          return "Rank hanya boleh diisi huruf (bukan angka)";
                        }
                        return null;
                      },
                    ),
                    _buildTextField(
                      controller: _jobController,
                      label: "Pekerjaan Khusus",
                      hint: "Contoh: Mage, Knight, Archer...",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Job tidak boleh kosong";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pinkAccent,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushReplacementNamed(context, "/", arguments: {
                            "name": _namaController.text,
                            "level": _levelController.text,
                            "rank": _rankController.text,
                            "job": _jobController.text,
                          });
                        }
                      },
                      child: const Text(
                        "Mulai Petualangan",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

