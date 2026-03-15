import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'kategori_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLoading = false;
  bool isLoginMode = true; 

  void showSnackBar(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: const Color(0xFFEC4899),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }



  Future<void> handleAuth() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      showSnackBar("Email dan Password wajib diisi!");
      return;
    }

    setState(() => isLoading = true);

    try {
      if (isLoginMode) {
        final res = await Supabase.instance.client.auth.signInWithPassword(
          email: email,
          password: password,
        );

        if (res.user != null) {
          showSnackBar("Login Berhasil!");
          _goToHome();
        }
      } else {

        final res = await Supabase.instance.client.auth.signUp(
          email: email,
          password: password,
        );

        if (res.user != null) {
          showSnackBar("Registrasi berhasil! Silakan login.");

          emailController.clear();
          passwordController.clear();

          setState(() {
            isLoginMode = true;
          });
        }
      }
    } on AuthException catch (e) {
      showSnackBar(e.message);
    } catch (e) {
      showSnackBar("Terjadi kesalahan tidak terduga.");
    } finally {
      if (mounted) setState(() => isLoading = false);
    }
  }

  void _goToHome() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const KategoriPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFD6EC), Color(0xFFF9A8D4)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                const Text(
                  "HealthTracker",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFEC4899),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  isLoginMode ? "Selamat Datang Kembali!" : "Ayo Bergabung!",
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
                const SizedBox(height: 40),

                // Form Container
                Container(
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          labelText: "Email",
                          prefixIcon: Icon(Icons.email_outlined),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: "Password",
                          prefixIcon: Icon(Icons.lock_outline),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),

                      // Tombol Utama (Teks berubah sesuai mode)
                      ElevatedButton(
                        onPressed: isLoading ? null : handleAuth,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFEC4899),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 2,
                        ),
                        child: isLoading
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              )
                            : Text(
                                isLoginMode ? "MASUK" : "DAFTAR SEKARANG",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                      ),
                      const SizedBox(height: 20),

                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            isLoginMode
                                ? "Belum punya akun? "
                                : "Sudah punya akun? ",
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() => isLoginMode = !isLoginMode);
                            },
                            child: Text(
                              isLoginMode ? "Daftar" : "Login",
                              style: const TextStyle(
                                color: Color(0xFFEC4899),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
