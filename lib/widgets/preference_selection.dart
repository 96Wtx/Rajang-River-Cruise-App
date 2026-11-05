import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/cruise_viewmodels.dart';

class PreferenceSelection extends StatelessWidget {
  const PreferenceSelection({super.key});

  // Format Date
  String _formatDate(DateTime? date) {
    if (date == null) {
      return 'Select Visit Date';
    }

    return '${date.day}/${date.month}/${date.year}';
  }

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
                'Booking Preferences',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 16),

              // 1. Visit Date Picker
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(Icons.calendar_month),
                title: const Text('Visit Date'),
                subtitle: Text(
                  _formatDate(viewModel.selectedDate),
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () async {
                  final DateTime? pickedDate =
                  await showDatePicker(
                    context: context,
                    initialDate:
                    viewModel.selectedDate ?? DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(
                      const Duration(days: 365),
                    ),
                  );

                  if (pickedDate != null) {
                    viewModel.selectDate(pickedDate);
                  }
                },
              ),

              const Divider(),

              // 2. Cruise Package Dropdown
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(Icons.directions_boat),
                title: const Text('Cruise Package'),
                subtitle: DropdownButton<String>(
                  isExpanded: true,
                  value: viewModel.selectedPackage,
                  items: viewModel.cruisePackages.map(
                        (String package) {
                      return DropdownMenuItem<String>(
                        value: package,
                        child: Text(package),
                      );
                    },
                  ).toList(),
                  onChanged: (String? newPackage) {
                    viewModel.changePackage(newPackage);
                  },
                ),
              ),

              const Divider(),

              // 3. Dark Mode Switch
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                secondary: const Icon(Icons.dark_mode),
                title: const Text('Dark Mode'),
                subtitle: const Text(
                  'Switch between Light and Dark Theme',
                ),
                value: viewModel.isDarkMode,
                onChanged: (bool value) {
                  viewModel.toggleTheme(value);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
