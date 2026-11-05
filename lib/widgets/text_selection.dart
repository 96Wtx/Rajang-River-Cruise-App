import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/cruise_viewmodels.dart';

class TextSelection extends StatelessWidget {
  const TextSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CruiseViewModel>(
      builder: (context, viewModel, child) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Section Title
              Text(
                'About This Cruise',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              // Cruise Description
              Text(
                viewModel.cruise.description,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(
                  height: 1.6,
                ),
                textAlign: TextAlign.justify,
              ),

              const SizedBox(height: 12),

              // Additional Information
              const Text(
                'Enjoy a relaxing journey along the Rajang River '
                    'and discover the beautiful scenery and local '
                    'heritage of Sarawak.',
                style: TextStyle(
                  fontSize: 14,
                  height: 1.6,
                ),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        );
      },
    );
  }
}
