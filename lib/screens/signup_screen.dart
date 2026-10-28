
import 'package:flutter/material.dart';
import 'success_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();

  static const _tips = [
    'Try a passphrase made from several unrelated words. It is easier to remember and harder to guess.',
    'Use a password you have not used on another account.',
    'A longer password is usually easier to remember when it is a short phrase.',
  ];

  DateTime? _birthDate;
  bool _showPassword = false;
  bool _showConfirmPassword = false;
  bool _isSubmitting = false;
  bool _showTip = false;
  int _tipIndex = -1;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  Future<void> _pickBirthDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: _birthDate ?? DateTime(now.year - 18, now.month, now.day),
      firstDate: DateTime(1900),
      lastDate: now,
      helpText: 'Select your birth date',
    );

    if (!mounted || picked == null) return;

    setState(() => _birthDate = picked);
  }

  Future<void> _submit() async {
    if (_isSubmitting) return;

    final form = _formKey.currentState;
    if (form == null || !form.validate()) return;

    if (_birthDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select your birth date.')),
      );
      return;
    }

    setState(() => _isSubmitting = true);

    // Simulate signup processing; no account is created or stored.
    await Future<void>.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    final name = _nameController.text.trim();

    setState(() => _isSubmitting = false);

    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => SuccessScreen(name: name),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PawPal • Join the pack')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 560),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Icon(
                      Icons.pets,
                      size: 58,
                      color: Color(0xFF6B4EFF),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Create your PawPal account',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 22),

                    TextFormField(
                      controller: _nameController,
                      textCapitalization: TextCapitalization.words,
                      decoration: const InputDecoration(
                        labelText: 'Full name',
                        prefixIcon: Icon(Icons.person_outline),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) =>
                          value == null || value.trim().isEmpty
                              ? 'Please enter your name.'
                              : null,
                    ),
                    const SizedBox(height: 14),

                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.email_outlined),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        final email = value?.trim() ?? '';
                        if (email.isEmpty ||
                            !RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$')
                                .hasMatch(email)) {
                          return 'Please enter a valid email address.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 14),

                    TextFormField(
                      controller: _passwordController,
                      obscureText: !_showPassword,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: const Icon(Icons.lock_outline),
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                          tooltip: _showPassword
                              ? 'Hide password'
                              : 'Show password',
                          icon: Icon(
                            _showPassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () => setState(
                            () => _showPassword = !_showPassword,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.length < 6) {
                          return 'Password must be at least 6 characters.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 14),

                    TextFormField(
                      controller: _confirmController,
                      obscureText: !_showConfirmPassword,
                      decoration: InputDecoration(
                        labelText: 'Confirm password',
                        prefixIcon: const Icon(Icons.lock_reset),
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                          tooltip: _showConfirmPassword
                              ? 'Hide password'
                              : 'Show password',
                          icon: Icon(
                            _showConfirmPassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () => setState(
                            () => _showConfirmPassword =
                                !_showConfirmPassword,
                          ),
                        ),
                      ),
                      validator: (value) =>
                          value != _passwordController.text
                              ? 'Passwords do not match.'
                              : null,
                    ),
                    const SizedBox(height: 14),

                    OutlinedButton.icon(
                      onPressed: _isSubmitting ? null : _pickBirthDate,
                      icon: const Icon(Icons.calendar_month),
                      label: Text(
                        _birthDate == null
                            ? 'Choose birth date'
                            : 'Birth date: ${_birthDate!.month.toString().padLeft(2, '0')}/${_birthDate!.day.toString().padLeft(2, '0')}/${_birthDate!.year}',
                      ),
                    ),
                    const SizedBox(height: 18),

                    OutlinedButton.icon(
                      onPressed: _isSubmitting
                          ? null
                          : () => setState(() {
                                _tipIndex = (_tipIndex + 1) % _tips.length;
                                _showTip = true;
                              }),
                      icon: const Icon(Icons.lightbulb_outline),
                      label: const Text('Get a password tip'),
                    ),
                    if (_showTip) ...[
                      const SizedBox(height: 8),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(14),
                          child: Text(_tips[_tipIndex]),
                        ),
                      ),
                    ],
                    const SizedBox(height: 22),

                    FilledButton.icon(
                      onPressed: _isSubmitting ? null : _submit,
                      icon: _isSubmitting
                          ? const SizedBox(
                              width: 18,
                              height: 18,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                              ),
                            )
                          : const Icon(Icons.pets),
                      label: Text(
                        _isSubmitting ? 'Joining the pack…' : 'Sign Up',
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'This demo validates your form on this device. '
                      'No account is created or stored.',
                      textAlign: TextAlign.center,
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
