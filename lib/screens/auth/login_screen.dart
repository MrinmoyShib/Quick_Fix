import 'package:flutter/material.dart';
import 'package:quick_fix/screens/admin/admin_dashboard.dart';
import 'package:quick_fix/screens/auth/forgot_pass_screen.dart';
import 'package:quick_fix/screens/auth/signup_screen.dart';
import 'package:quick_fix/screens/user/user_home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isHovering = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Form(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Spacer(flex: 2),
              Image.asset(
                'assets/images/logo.png',
                width: 100,
              ),
              const SizedBox(height: 30),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(

                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  hintText: "Email or Username",
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.email, color: Colors.blue),
                ),
              ),
              const SizedBox(height: 20),

              TextFormField(
                controller: _passwordController,
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

                  onPressed: () {
                    String email = _emailController.text;
                    String password = _passwordController.text;

                    if(email == 'user@gmail.com' && password == 'user'){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const UserHome()),
                      );
                    }
                    else if(email == 'user' && password == 'user'){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const UserHome()),
                      );
                    }
                    else if(email == 'admin' && password == 'admin'){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const AdminDashboard()),
                      );
                    }
                    else if(email == 'admin@gmail.com' && password == 'admin'){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const AdminDashboard()),
                      );
                    }
                    else{
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Invalid credentials'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }


                  },
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
