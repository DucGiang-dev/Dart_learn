import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 7 Signup Form',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
      home: const SignupScreen(),
    );
  }
}

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _confirmPasswordFocusNode = FocusNode();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  String _name = '';
  String _emailAddress = '';
  bool _isCheckingEmail = false;

  @override
  void dispose() {
    _nameFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Signup'), centerTitle: true),
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              const SizedBox(height: 8),
              const Text(
                'Create your account',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'Fill in the form.',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 16),
              Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    _buildNameField(),
                    const SizedBox(height: 12),
                    _buildEmailField(),
                    const SizedBox(height: 12),
                    _buildPasswordField(),
                    _buildPasswordStrengthIndicator(),
                    const SizedBox(height: 12),
                    _buildConfirmPasswordField(),
                    const SizedBox(height: 12),
                    _buildSubmitButton(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNameField() {
    return _buildTextField(
      labelText: 'Full name',
      hintText: 'Nguyen Duc Giang',
      focusNode: _nameFocusNode,
      textInputAction: TextInputAction.next,
      onFieldSubmitted: () {
        FocusScope.of(context).requestFocus(_emailFocusNode);
      },
      validator: SignupFormValidators.validateName,
      onSaved: (value) => _name = value ?? '',
    );
  }

  Widget _buildEmailField() {
    return _buildTextField(
      labelText: 'Email',
      hintText: '[EMAIL]',
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      focusNode: _emailFocusNode,
      textInputAction: TextInputAction.next,
      onFieldSubmitted: () {
        FocusScope.of(context).requestFocus(_passwordFocusNode);
      },
      validator: SignupFormValidators.validateEmail,
      onSaved: (value) => _emailAddress = value ?? '',
    );
  }

  Widget _buildPasswordField() {
    return _buildTextField(
      labelText: 'Password',
      hintText: 'At least 8 characters with 1 digit',
      controller: _passwordController,
      obscureText: true,
      focusNode: _passwordFocusNode,
      textInputAction: TextInputAction.next,
      onFieldSubmitted: () {
        FocusScope.of(context).requestFocus(_confirmPasswordFocusNode);
      },
      onChanged: (_) => setState(() {}),
      validator: SignupFormValidators.validatePassword,
    );
  }

  Widget _buildConfirmPasswordField() {
    return _buildTextField(
      labelText: 'Confirm password',
      hintText: 'Repeat your password',
      controller: _confirmPasswordController,
      obscureText: true,
      focusNode: _confirmPasswordFocusNode,
      textInputAction: TextInputAction.done,
      onFieldSubmitted: _submit,
      onChanged: (_) => setState(() {}),
      validator: (value) => SignupFormValidators.validateConfirmPassword(
        value,
        _passwordController.text,
      ),
    );
  }

  Widget _buildTextField({
    required String labelText,
    required String hintText,
    TextEditingController? controller,
    TextInputType? keyboardType,
    required FocusNode focusNode,
    required TextInputAction textInputAction,
    required String? Function(String?) validator,
    bool obscureText = false,
    VoidCallback? onFieldSubmitted,
    ValueChanged<String>? onChanged,
    ValueChanged<String?>? onSaved,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      focusNode: focusNode,
      textInputAction: textInputAction,
      onFieldSubmitted: (_) => onFieldSubmitted?.call(),
      onChanged: onChanged,
      onSaved: onSaved,
      validator: validator,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        border: const OutlineInputBorder(),
      ),
    );
  }

  Widget _buildPasswordStrengthIndicator() {
    final strength = SignupFormValidators.passwordStrength(
      _passwordController.text,
    );
    if (strength == null) {
      return const SizedBox.shrink();
    }

    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Text(
          'Password strength: ${strength.label}',
          style: TextStyle(color: strength.color, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _isCheckingEmail ? null : _submit,
        child: _isCheckingEmail
            ? const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                  SizedBox(width: 8),
                  Text('Checking email...'),
                ],
              )
            : const Text('Sign Up'),
      ),
    );
  }

  Future<void> _submit() async {
    if (_isCheckingEmail) {
      return;
    }

    if (_formKey.currentState == null || !_formKey.currentState!.validate()) {
      return;
    }

    _formKey.currentState!.save();

    setState(() {
      _isCheckingEmail = true;
    });

    await Future<void>.delayed(const Duration(seconds: 2));

    if (!mounted) {
      return;
    }

    setState(() {
      _isCheckingEmail = false;
    });

    final email = _emailAddress.isEmpty
        ? _emailController.text.trim().toLowerCase()
        : _emailAddress.trim().toLowerCase();
    if (email.startsWith('taken')) {
      _showMessage('This email is already taken');
      return;
    }

    _showMessage('Account created successfully, $_name!');
  }

  void _showMessage(String message) {
    if (!mounted) {
      return;
    }

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }
}

class SignupFormValidators {
  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Name is required';
    }

    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }

    final email = value.trim();
    if (!email.contains('@') || !email.contains('.')) {
      return 'Enter a valid email';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }

    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Password must contain at least one digit';
    }

    return null;
  }

  static String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Confirm password is required';
    }

    if (value != password) {
      return 'Passwords do not match';
    }

    return null;
  }

  static PasswordStrength? passwordStrength(String value) {
    if (value.isEmpty) {
      return null;
    }

    var score = 0;
    if (value.length >= 8) {
      score++;
    }
    if (value.length >= 12) {
      score++;
    }
    if (RegExp(r'[0-9]').hasMatch(value)) {
      score++;
    }
    if (RegExp(r'[A-Z]').hasMatch(value)) {
      score++;
    }
    if (RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      score++;
    }

    if (score <= 2) {
      return const PasswordStrength('Weak', Colors.red);
    }

    if (score <= 4) {
      return const PasswordStrength('Medium', Colors.orange);
    }

    return const PasswordStrength('Strong', Colors.green);
  }
}

class PasswordStrength {
  const PasswordStrength(this.label, this.color);

  final String label;
  final Color color;
}
