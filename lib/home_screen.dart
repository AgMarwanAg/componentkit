import 'package:componentkit/lec2.dart';
import 'package:componentkit/lec3.dart';
import 'package:componentkit/lec4.dart';
import 'package:componentkit/lec5.dart';
import 'package:componentkit/lec5part2.dart';
import 'package:componentkit/lec6.dart';
import 'package:componentkit/lec7.dart';
import 'package:componentkit/lec8.dart';
import 'package:componentkit/lec8part2.dart';
import 'package:componentkit/lec9.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      // Use SingleChildScrollView for a scrollable layout with Wrap
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Wrap(
          spacing: 12.0, // Horizontal space between buttons
          runSpacing: 12.0, // Vertical space between button rows
          children: [
            _ComponentButton(
              icon: Icons.layers_outlined,
              label: 'basic Widgets',
              onPressed: () {
                Navigator.pushNamed(context, Lec2.path);
              },
            ),
            _ComponentButton(
              icon: Icons.view_column_outlined,
              label: 'Scaffold',
              onPressed: () {
                Navigator.pushNamed(context, Lec3.path);
              },
            ),
            _ComponentButton(
              icon: Icons.image,
              label: 'Images and buttons',
              onPressed: () {
                Navigator.pushNamed(context, Lec4.path);
              },
            ),
            _ComponentButton(
              icon: Icons.refresh,
              label: 'StateFul Widgets',
              onPressed: () {
                Navigator.pushNamed(context, Lec5.path);
              },
            ),
            _ComponentButton(
              icon: Icons.refresh,
              label: 'state Management',
              onPressed: () {
                Navigator.pushNamed(context, Lec5part2.path);
              },
            ),
            _ComponentButton(
              icon: Icons.add_comment,
              label: 'Whatsapp Clone',
              onPressed: () {
                Navigator.pushNamed(context, Lec6.path);
              },
            ),
            _ComponentButton(
              icon: Icons.storage_rounded,
              label: 'Database',
              onPressed: () {
                Navigator.pushNamed(context, Lec7.path);
              },
            ),
             _ComponentButton(
              icon: Icons.storage_rounded,
              label: 'Caching',
              onPressed: () {
                Navigator.pushNamed(context, Lec8.path);
              },
            ),
             _ComponentButton(
              icon: Icons.refresh,
              label: '(APIs)',
              onPressed: () {
                Navigator.pushNamed(context, Lec8part2.path);
              },
            ),
             _ComponentButton(
              icon: Icons.refresh,
              label: '(APIs 2)',
              onPressed: () {
                Navigator.pushNamed(context, Lec9.path);
              },
            ),
          ],
        ),
      ),
    );
  }
}

/// A reusable button widget for displaying a component with an icon and a label.
/// This widget remains unchanged as it is a well-encapsulated component.
class _ComponentButton extends StatelessWidget {
  const _ComponentButton({
    required this.icon,
    required this.label,
    this.onPressed,
  });

  final IconData icon;
  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    // Use LayoutBuilder to make the button width responsive.
    // It will take up half of the available width minus the spacing.
    return LayoutBuilder(
      builder: (context, constraints) {
        // Calculate width for a two-column layout.
        // Subtract half the Wrap spacing (12.0 / 2 = 6.0) to ensure perfect alignment.
        final buttonWidth = (constraints.maxWidth / 2) - 6.0;

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
                const SizedBox(width: 10.0),
                Expanded(
                  child: Text(
                    label,
                    maxLines: 2,
                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
