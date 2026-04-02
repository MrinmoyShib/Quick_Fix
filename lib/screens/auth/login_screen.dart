import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quick_fix/screens/admin/admin_dashboard.dart';
import 'package:quick_fix/screens/auth/forgot_pass_screen.dart';
import 'package:quick_fix/screens/auth/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isHovering = false;

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  Future<void> signIn() async {
    if (email.text == 'admin' && password.text == 'admin') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AdminDashboard()),
      );
    } else {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const Spacer(flex: 2),
              Image.asset(
                'assets/images/logo.png',
                width: 100,
              ),
              const SizedBox(height: 30),
              TextFormField(
                controller: email,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  hintText: "Email/Username",
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.email, color: Colors.blue),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: password,
                obscureText: true,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  hintText: "Password",
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.lock, color: Colors.blue),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 40,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    side: const BorderSide(
                      color: Colors.blueAccent,
                      width: 2,
                    ),
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: signIn,
                  child: const Text(
                    "Log in",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ForgotPassScreen()),
                  );
                },
                onHover: (value) {
                  setState(() {
                    _isHovering = value;
                  });
                },
                child: Text(
                  "Forgot Password",
                  style: TextStyle(
                    color: _isHovering ? Colors.blue : Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Spacer(flex: 3),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          height: 40,
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              side: const BorderSide(
                color: Colors.grey,
                width: 2,
              ),
              backgroundColor: Colors.white,
              foregroundColor: Colors.blue,
            ),
            child: const Text(
              "Sign Up",
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SignupScreen()),
              );
            },
          ),
        ),
      ),
    );
  }
}
