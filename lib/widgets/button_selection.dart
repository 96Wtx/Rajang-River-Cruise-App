import 'package:flutter/material.dart';

class ButtonSelection extends StatelessWidget {
  const ButtonSelection({super.key});

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [

        // CALL Button
        _buildActionButton(
          context,
          icon: Icons.call,
          label: 'CALL',
          onPressed: () {
            _showMessage(context, 'Call feature selected');
          },
        ),

        // ROUTE Button
        _buildActionButton(
          context,
          icon: Icons.directions,
          label: 'ROUTE',
          onPressed: () {
            _showMessage(context, 'Route feature selected');
          },
        ),

        // SHARE Button
        _buildActionButton(
          context,
          icon: Icons.share,
          label: 'SHARE',
          onPressed: () {
            _showMessage(context, 'Share feature selected');
          },
        ),
      ],
    );
  }

  Widget _buildActionButton(
      BuildContext context, {
        required IconData icon,
        required String label,
        required VoidCallback onPressed,
      }) {
    return TextButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 28,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(height: 5),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
