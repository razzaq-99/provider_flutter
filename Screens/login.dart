import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_flutter/Providerrr/auth_provider.dart';

class LoginApp extends StatefulWidget {
  const LoginApp({Key? key}) : super(key: key);

  @override
  State<LoginApp> createState() => _LoginAppState();
}

class _LoginAppState extends State<LoginApp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authprovider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Login Here")),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(hintText: "Email"),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(hintText: "Password"),
            ),
            const SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: () {
                authprovider.login(emailController.text.toString(),
                    passwordController.text.toString());

              },
              child: Container(
                height: 50,
                // width: 70,
                decoration: const BoxDecoration(color: Colors.deepOrange),
                child:  Center(
                    child: authprovider.loading ? const CircularProgressIndicator(color: Colors.white,) : const Text(
                  "login",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
