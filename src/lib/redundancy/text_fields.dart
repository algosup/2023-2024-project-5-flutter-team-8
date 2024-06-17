import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../constants.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? errorText;
  final bool obscureText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final double heightFactor;
  final int? errorMaxLines;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.errorText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.suffixIcon,
    this.prefixIcon,
    this.heightFactor = 0.1,
    this.errorMaxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: size.height * heightFactor,
          child: TextFormField(
            controller: controller,
            obscureText: obscureText,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              hintText: hintText,
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(color: purpleColor),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(color: Colors.red),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(color: Colors.red),
              ),
              errorText: errorText,
              errorMaxLines: errorMaxLines,
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,
            ),
            validator: validator,
          ),
        ),
      ],
    );
  }
}

class FullName extends CustomTextField {
  FullName({Key? key, required TextEditingController controller, String? errorText})
      : super(
          key: key,
          controller: controller,
          hintText: 'Full Name',
          errorText: errorText,
          keyboardType: TextInputType.text,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your full name';
            }
            return null;
          },
        );
}

class EmailField extends CustomTextField {
  EmailField({Key? key, required TextEditingController controller, String? errorText})
      : super(
          key: key,
          controller: controller,
          hintText: 'name@example.com',
          errorText: errorText,
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter an email';
            }
            return null;
          },
        );
}

class PasswordField extends StatefulWidget {
  final TextEditingController controller;
  final String? errorText;

  const PasswordField({
    Key? key,
    required this.controller,
    this.errorText,
  }) : super(key: key);

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: widget.controller,
      hintText: 'Password',
      errorText: widget.errorText,
      obscureText: _obscureText,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a password';
        }
        return null;
      },
      suffixIcon: GestureDetector(
        onTap: () {
          setState(() {
            _obscureText = !_obscureText;
          });
        },
        child: Icon(
          _obscureText ? Icons.visibility : Icons.visibility_off,
          color: Colors.grey,
        ),
      ),
    );
  }
}

class PasswordFieldProfile extends StatefulWidget {
  final TextEditingController controller;
  final String? errorText;
  final BuildContext context;

  const PasswordFieldProfile({
    Key? key,
    required this.controller,
    this.errorText,
    required this.context,
  }) : super(key: key);

  @override
  _PasswordFieldProfileState createState() => _PasswordFieldProfileState();
}

class _PasswordFieldProfileState extends State<PasswordFieldProfile> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: widget.controller,
      hintText: 'Password',
      errorText: widget.errorText,
      obscureText: _obscureText,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a password';
        }
        return null;
      },
      suffixIcon: GestureDetector(
        onTap: () => GoRouter.of(widget.context).push('/updatePasswordPage'),
        child: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}

class PasswordFieldSignup extends CustomTextField {
  PasswordFieldSignup({
    Key? key,
    required TextEditingController controller,
    String? errorText,
  }) : super(
          key: key,
          controller: controller,
          hintText: 'Password',
          errorText: errorText,
          obscureText: true,
          keyboardType: TextInputType.text,
          heightFactor: 0.15,
          errorMaxLines: 3, // Set the max lines for error text here
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a password';
            } else if (value.length < 6) {
              return 'Password must be at least 6 characters long';
            } else if (!value.contains(RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$'))) {
              return 'Password must contain at least one number, one lowercase letter, one uppercase letter, and one special character';
            }
            return null;
          },
        );
}

class Location extends CustomTextField {
  Location({Key? key, required TextEditingController controller, String? errorText})
      : super(
          key: key,
          controller: controller,
          hintText: 'City, Country',
          errorText: errorText,
          keyboardType: TextInputType.text,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your location';
            }
            return null;
          },
        );
}
