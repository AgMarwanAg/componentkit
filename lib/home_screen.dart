import 'package:componentkit/lec2.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Data for the component buttons
    List<Map<String, dynamic>> _layoutComponents = [
      {'icon': Icons.layers_outlined, 'label': 'Lec2'},
      {'icon': Icons.view_column_outlined, 'label': 'Lec3'},
      {'icon': Icons.view_stream_outlined, 'label': 'Row'},
      {'icon': Icons.picture_in_picture_alt_outlined, 'label': 'Positioned'},
      {'icon': Icons.align_vertical_bottom_outlined, 'label': 'Align'},
      {'icon': Icons.space_bar_outlined, 'label': 'Spacer'},
      {'icon': Icons.unfold_more_double_outlined, 'label': 'Expanded'},
      {'icon': Icons.open_in_full_outlined, 'label': 'Flexible'},
      {'icon': Icons.center_focus_strong_outlined, 'label': 'Center'},
      {'icon': Icons.padding_outlined, 'label': 'Padding'},
      {'icon': Icons.crop_square_outlined, 'label': 'SizedBox'},
      {'icon': Icons.check_box_outline_blank, 'label': 'Container'},
      {'icon': Icons.dashboard_outlined, 'label': 'Card'},
      {'icon': Icons.wrap_text_outlined, 'label': 'Wrap'},
      {'icon': Icons.horizontal_rule_outlined, 'label': ''}, // Icon-only button
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA), // Light grey background
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: const Color(0xFFF8F9FA),
        title: const Text(
          'Flutter Component Kit',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        children: [
          const _SectionHeader(title: 'Layout Components'),
          _buildComponentGrid(_layoutComponents, context),
        ],
      ),
    );
  }

  Widget _buildComponentGrid(List<Map<String, dynamic>> components, BuildContext context) {
    return Wrap(
      spacing: 12.0,
      runSpacing: 12.0,
      children: components.map((component) {
        return _ComponentButton(
          icon: component['icon'] as IconData,
          label: component['label'] as String,
          onPressed: () {
            if (component['label'] == "Lec2") {
              Navigator.pushNamed(context, Lec2.path);
            }
            if (component['label'] == "Lec3") {
              Navigator.pushNamed(context, '/lec3');
            }
          },
        );
      }).toList(),
    );
  }
}

/// A reusable button widget for displaying a component with an icon and a label.
class _ComponentButton extends StatelessWidget {
  const _ComponentButton({required this.icon, required this.label, this.onPressed});

  final IconData icon;
  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    // Use LayoutBuilder to make the button width responsive.
    // It will take up half of the available width minus the spacing.
    return LayoutBuilder(
      builder: (context, constraints) {
        final buttonWidth = (constraints.maxWidth / 2) - 6; // Subtract half the Wrap spacing

        return SizedBox(
          width: buttonWidth,
          child: OutlinedButton(
            onPressed: onPressed,
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
              side: BorderSide(color: Colors.grey.shade300, width: 1.5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(icon, color: Colors.black54, size: 22),
                // Only show text if the label is not empty.
                if (label.isNotEmpty) ...[
                  const SizedBox(width: 10.0),
                  Text(
                    label,
                    style: const TextStyle(color: Colors.black87, fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}

/// A reusable header widget for different sections of the UI.
class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0, bottom: 16.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
      ),
    );
  }
}
