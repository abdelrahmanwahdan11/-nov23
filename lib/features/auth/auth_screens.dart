import 'package:flutter/material.dart';
import '../../core/controllers/auth_controller.dart';
import '../../core/widgets/buttons.dart';
import '../../core/localization/app_localizations.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.controller, required this.onSuccess, required this.onGuest});
  final AuthController controller;
  final VoidCallback onSuccess;
  final VoidCallback onGuest;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool error = false;

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(t.translate('login'))),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) => value != null && value.contains('@') ? null : 'Invalid email',
              ).slideY(begin: 0.1, duration: 300.ms),
              const SizedBox(height: 12),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Password'),
                validator: (value) => value != null && value.length >= 6 ? null : 'Min 6 chars',
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Checkbox(value: true, onChanged: (_) {}),
                  const Text('Remember me'),
                  const Spacer(),
                  TextButton(onPressed: () {}, child: const Text('Forgot password?')),
                ],
              ),
              const SizedBox(height: 12),
              if (error)
                const Text('Wrong credentials', style: TextStyle(color: Colors.red))
                    .animate()
                    .shake(duration: 400.ms),
              const SizedBox(height: 12),
              PrimaryButton(
                label: t.translate('login'),
                onPressed: () async {
                  if (_formKey.currentState?.validate() ?? false) {
                    final ok = await widget.controller.login(emailController.text, passwordController.text);
                    setState(() => error = !ok);
                    if (ok) widget.onSuccess();
                  }
                },
              ),
              const SizedBox(height: 8),
              SecondaryButton(label: t.translate('guest'), onPressed: widget.onGuest),
              TextButton(onPressed: () {}, child: Text(t.translate('signup')))
            ],
          ),
        ),
      ),
    );
  }
}

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create account')),
      body: const Center(child: Text('Sign up form placeholder')),
    );
  }
}
