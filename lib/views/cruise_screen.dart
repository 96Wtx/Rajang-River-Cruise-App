import 'package:flutter/material.dart' hide TextSelection;
import 'package:provider/provider.dart';

import '../viewmodels/cruise_viewmodels.dart';

import '../widgets/image_selection.dart';
import '../widgets/title_selection.dart';
import '../widgets/button_selection.dart';
import '../widgets/text_selection.dart';
import '../widgets/preference_selection.dart';

class CruiseScreen extends StatelessWidget {
  const CruiseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rajang River Cruise'),
        centerTitle: true,
      ),

      body: Consumer<CruiseViewModel>(
        builder: (context, viewModel, child) {

          return OrientationBuilder(
            builder: (context, orientation) {

              // PORTRAIT LAYOUT
              if (orientation == Orientation.portrait) {
                return ListView(
                  children: [
                    ImageSelection(
                      imageUrl: viewModel.cruise.imageUrl,
                    ),

                    const TitleSelection(),

                    const ButtonSelection(),

                    const Divider(),

                    const TextSelection(),

                    const Divider(),

                    const PreferenceSelection(),
                  ],
                );
              }

              // LANDSCAPE LAYOUT
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // LEFT PANE: Image
                  Expanded(
                    flex: 5,
                    child: Center(
                      child: ImageSelection(
                        imageUrl: viewModel.cruise.imageUrl,
                      ),
                    ),
                  ),

                  // RIGHT PANE: Cruise Details
                  Expanded(
                    flex: 6,
                    child: ListView(
                      children: const [
                        TitleSelection(),

                        ButtonSelection(),

                        Divider(),

                        TextSelection(),

                        Divider(),

                        PreferenceSelection(),
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
