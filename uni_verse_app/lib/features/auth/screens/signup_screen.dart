import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/router/app_router.dart';
import '../../../data/providers/auth_provider.dart';

// Temporary universities list (will be fetched from Supabase)
final _universities = [
  {'id': '11111111-1111-1111-1111-111111111111', 'name': 'Makerere University'},
  {'id': '22222222-2222-2222-2222-222222222222', 'name': 'Kyambogo University'},
  {'id': '33333333-3333-3333-3333-333333333333', 'name': 'Uganda Christian University'},
  {'id': '44444444-4444-4444-4444-444444444444', 'name': 'Makerere University Business School'},
  {'id': '55555555-5555-5555-5555-555555555555', 'name': 'Gulu University'},
  {'id': '66666666-6666-6666-6666-666666666666', 'name': 'Mbarara University of Science & Technology'},
  {'id': '77777777-7777-7777-7777-777777777777', 'name': 'Busitema University'},
  {'id': '88888888-8888-8888-8888-888888888888', 'name': 'Uganda Martyrs University'},
  {'id': '99999999-9999-9999-9999-999999999999', 'name': 'Kabale University'},
  {'id': 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 'name': 'Ndejje University'},
];

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({super.key});

  @override
  ConsumerState<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _courseController = TextEditingController();

  String? _selectedUniversityId;
  int _selectedYear = 1;
  bool _obscurePassword = true;

  @override
  void dispose() {
    _nameController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _courseController.dispose();
    super.dispose();
  }

  Future<void> _handleSignup() async {
    if (!_formKey.currentState!.validate()) return;
    if (_selectedUniversityId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select your university')),
      );
      return;
    }

    await ref.read(signUpProvider.notifier).signUp(
          email: _emailController.text.trim(),
          password: _passwordController.text,
          name: _nameController.text.trim(),
          username: _usernameController.text.trim(),
          universityId: _selectedUniversityId!,
          course: _courseController.text.trim(),
          year: _selectedYear,
        );
  }

  @override
  Widget build(BuildContext context) {
    final signUpState = ref.watch(signUpProvider);
    final isLoading = signUpState.isLoading;

    ref.listen(signUpProvider, (previous, next) {
      next.whenOrNull(
        error: (error, _) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(error.toString()),
              backgroundColor: AppColors.error,
            ),
          );
        },
        data: (_) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Account created! Please check your email to verify.'),
              backgroundColor: AppColors.success,
            ),
          );
        },
      );
    });

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go(AppRoutes.login),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppConstants.spacingXl),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Title
                Text(
                  'Create Account',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: AppConstants.spacingSm),
                Text(
                  'Join the Uni-Verse community',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                      ),
                ),

                const SizedBox(height: AppConstants.spacingXl),

                // Name field
                TextFormField(
                  controller: _nameController,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    labelText: 'Full Name',
                    hintText: 'Enter your full name',
                    prefixIcon: Icon(Icons.person_outlined),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: AppConstants.spacingLg),

                // Username field
                TextFormField(
                  controller: _usernameController,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    hintText: 'Choose a username',
                    prefixIcon: Icon(Icons.alternate_email),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a username';
                    }
                    if (value.length < AppConstants.minUsernameLength) {
                      return 'Username must be at least ${AppConstants.minUsernameLength} characters';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: AppConstants.spacingLg),

                // Email field
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter your email',
                    prefixIcon: Icon(Icons.email_outlined),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!value.contains('@')) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: AppConstants.spacingLg),

                // Password field
                TextFormField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Create a password',
                    prefixIcon: const Icon(Icons.lock_outlined),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password';
                    }
                    if (value.length < AppConstants.minPasswordLength) {
                      return 'Password must be at least ${AppConstants.minPasswordLength} characters';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: AppConstants.spacingLg),

                // University dropdown
                DropdownButtonFormField<String>(
                  value: _selectedUniversityId,
                  decoration: const InputDecoration(
                    labelText: 'University',
                    hintText: 'Select your university',
                    prefixIcon: Icon(Icons.school_outlined),
                  ),
                  items: _universities
                      .map((uni) => DropdownMenuItem(
                            value: uni['id'] as String,
                            child: Text(uni['name'] as String),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedUniversityId = value;
                    });
                  },
                ),

                const SizedBox(height: AppConstants.spacingLg),

                // Course field
                TextFormField(
                  controller: _courseController,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    labelText: 'Course/Program',
                    hintText: 'Enter your course',
                    prefixIcon: Icon(Icons.book_outlined),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your course';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: AppConstants.spacingLg),

                // Year dropdown
                DropdownButtonFormField<int>(
                  value: _selectedYear,
                  decoration: const InputDecoration(
                    labelText: 'Year of Study',
                    prefixIcon: Icon(Icons.calendar_today_outlined),
                  ),
                  items: List.generate(
                    7,
                    (index) => DropdownMenuItem(
                      value: index + 1,
                      child: Text('Year ${index + 1}'),
                    ),
                  ),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        _selectedYear = value;
                      });
                    }
                  },
                ),

                const SizedBox(height: AppConstants.spacingXl),

                // Sign up button
                SizedBox(
                  height: 48,
                  child: ElevatedButton(
                    onPressed: isLoading ? null : _handleSignup,
                    child: isLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Text('Create Account'),
                  ),
                ),

                const SizedBox(height: AppConstants.spacingXl),

                // Sign in link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account? ',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    TextButton(
                      onPressed: () => context.go(AppRoutes.login),
                      child: const Text('Sign In'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
