import 'package:flutter/material.dart';

class XButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
  final ButtonVariant variant;
  final ButtonStyle? extraStyle;

  const XButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.variant = ButtonVariant.primary,
    this.extraStyle,
  });

  @override
  Widget build(BuildContext context) {
    final ButtonStyle buttonStyle = _getButtonStyle(context)
        .merge(ButtonStyle(
            minimumSize:
                WidgetStateProperty.all(const Size(double.infinity, 50))))
        .merge(extraStyle); // Merge with extra styles

    switch (variant) {
      case ButtonVariant.outline:
        return OutlinedButton(
          style: buttonStyle,
          onPressed: isLoading ? null : onPressed,
          child: isLoading
              ? SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: buttonStyle.foregroundColor
                            ?.resolve({WidgetState.disabled}) ??
                        Theme.of(context).colorScheme.onPrimary,
                  ))
              : Text(label),
        );
      case ButtonVariant.secondary:
        return ElevatedButton(
          style: buttonStyle,
          onPressed: isLoading ? null : onPressed,
          child: isLoading
              ? SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: buttonStyle.foregroundColor
                            ?.resolve({WidgetState.disabled}) ??
                        Theme.of(context).colorScheme.onPrimary,
                  ))
              : Text(label),
        );
      case ButtonVariant.primary:
      default:
        return ElevatedButton(
          style: buttonStyle,
          onPressed: isLoading ? null : onPressed,
          child: isLoading
              ? SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: buttonStyle.foregroundColor
                            ?.resolve({WidgetState.disabled}) ??
                        Theme.of(context).colorScheme.onPrimary,
                  ),
                )
              : Text(label),
        );
    }
  }

  ButtonStyle _getButtonStyle(BuildContext context) {
    switch (variant) {
      case ButtonVariant.outline:
        return OutlinedButton.styleFrom(
          foregroundColor: Theme.of(context).colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100.0),
          ),
        );
      case ButtonVariant.secondary:
        return ElevatedButton.styleFrom(
          backgroundColor: Colors.grey,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100.0),
          ),
        );
      case ButtonVariant.primary:
      default:
        return ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100.0),
          ),
        );
    }
  }
}

// Enum for Button Variants
enum ButtonVariant {
  primary,
  secondary,
  outline,
}
