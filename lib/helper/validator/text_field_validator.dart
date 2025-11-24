import 'package:flutter/material.dart';

class TextFieldValidator {

  static String? Function(String?) required({required String errorText}) {
    return (value) {
      final trimmed = value?.trim() ?? '';
      if (trimmed.isEmpty) return errorText;
      return null;
    };
  }

  static String? Function(String?) email() {
    return (value) {
      final trimmed = value?.trim() ?? '';
      if (trimmed.isEmpty) return "Email is required";
      final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
      if (!emailRegex.hasMatch(trimmed)) return "Enter a valid email address";
      return null;
    };
  }

  static String? Function(String?) password() {
    return (value) {
      final trimmed = value?.trim() ?? '';
      if (trimmed.isEmpty) return "Password is required";
      if (trimmed.length < 6) return "Password must be at least 6 characters";
      if (!RegExp(r'[A-Z]').hasMatch(trimmed)) return "Password must contain at least one uppercase letter";
      if (!RegExp(r'[0-9]').hasMatch(trimmed)) return "Password must contain at least one number";
      return null;
    };
  }

  static String? Function(String?) confirmPassword(TextEditingController originalController) {
    return (value) {
      final trimmed = value?.trim() ?? '';
      if (trimmed.isEmpty) return "Confirm password is required";
      if (trimmed != originalController.text.trim()) return "Passwords do not match";
      return null;
    };
  }

  static String? Function(String?) otp() {
    return (value) {
      final trimmed = value?.trim() ?? '';
      if (trimmed.isEmpty) return "OTP is required";
      if (trimmed.length != 6) return "OTP must be 6 digits";
      if (!RegExp(r'^[0-9]{6}$').hasMatch(trimmed)) return "OTP must contain only numbers";
      return null;
    };
  }

  static String? Function(String?) requiredField({String label = "This field"}) {
    return (value) {
      final trimmed = value?.trim() ?? '';
      if (trimmed.isEmpty) return "$label is required";
      return null;
    };
  }

  static String? Function(String?) website() {
    return (value) {
      final trimmed = value?.trim() ?? '';
      if (trimmed.isEmpty) return "Website URL is required";

      final urlPattern = RegExp(
        r'^(https?:\/\/)?([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,}(\/[^\s]*)?$',
        caseSensitive: false,
      );

      if (!urlPattern.hasMatch(trimmed)) return "Enter a valid website URL";
      if (!trimmed.startsWith('http://') && !trimmed.startsWith('https://')) {
        return "URL must start with http:// or https://";
      }

      return null;
    };
  }

  static String? Function(String?) name() {
    return (value) {
      final trimmed = value?.trim() ?? '';
      if (trimmed.isEmpty) return "Name is required";
      final nameRegex = RegExp(r"^[a-zA-Z\s]{2,}$");
      if (!nameRegex.hasMatch(trimmed)) return "Enter a valid full name";
      return null;
    };
  }

  static String? Function(String?) phone() {
    return (value) {
      final trimmed = value?.trim() ?? '';
      if (trimmed.isEmpty) return "Phone number is required";
      final phoneRegex = RegExp(r'^\+?[0-9]{10,15}$');
      if (!phoneRegex.hasMatch(trimmed)) return "Enter a valid phone number";
      return null;
    };
  }

  static String? Function(String?) username() {
    return (value) {
      final trimmed = value?.trim() ?? '';
      if (trimmed.isEmpty) return "Username is required";
      final usernameRegex = RegExp(r'^[a-zA-Z0-9_]{3,20}$');
      if (!usernameRegex.hasMatch(trimmed)) {
        return "Username must be 3–20 characters and can only include letters, numbers, or underscores";
      }
      return null;
    };
  }

  static String? Function(String?) number({String label = "Value"}) {
    return (value) {
      final trimmed = value?.trim() ?? '';
      if (trimmed.isEmpty) return "$label is required";
      final numberRegex = RegExp(r'^\d+(\.\d+)?$');
      if (!numberRegex.hasMatch(trimmed)) return "Enter a valid number";
      return null;
    };
  }

  static String? Function(String?) address() {
    return (value) {
      final trimmed = value?.trim() ?? '';
      if (trimmed.isEmpty) return "Address is required";
      if (trimmed.length < 5) return "Enter a valid address";
      return null;
    };
  }

  static String? Function(String?) description({int minLength = 10}) {
    return (value) {
      final trimmed = value?.trim() ?? '';
      if (trimmed.isEmpty) return "Description is required";
      if (trimmed.length < minLength) return "Description must be at least $minLength characters";
      return null;
    };
  }

  static String? Function(String?) postalCode() {
    return (value) {
      final trimmed = value?.trim() ?? '';
      if (trimmed.isEmpty) return "Postal code is required";
      final zipRegex = RegExp(r'^[0-9]{4,10}$');
      if (!zipRegex.hasMatch(trimmed)) return "Enter a valid postal code";
      return null;
    };
  }
}
