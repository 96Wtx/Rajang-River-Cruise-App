import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/cruise_viewmodels.dart';

class TitleSelection extends StatelessWidget {
  const TitleSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CruiseViewModel>(
      builder: (context, viewModel, child) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Cruise Name
              Text(
                viewModel.cruise.name,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              // Location
              Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    color: Colors.red,
                    size: 20,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    viewModel.cruise.location,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium,
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // Dynamic Star Rating
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 24,
                  ),

                  const SizedBox(width: 5),

                  Text(
                    '${viewModel.ratingCount}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(width: 12),

                  ElevatedButton.icon(
                    onPressed: () {
                      viewModel.increaseRating();
                    },
                    icon: const Icon(Icons.star),
                    label: const Text('Rate'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
