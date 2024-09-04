import 'package:chef_app/core/utils/app_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'components/error_info.dart';

class UnderMaintenanceScreen extends StatelessWidget {
  const UnderMaintenanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Spacer(flex: 2),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: handleUnderMaintenanceIllustration(),
                ),
              ),
              const Spacer(flex: 2),
              ErrorInfo(
                title: "Under Maintenance!",
                description:
                    "We are currently performing scheduled maintenance. Please check back later. Thank you for your patience.",
                // button: you can pass your custom button,
                btnText: "Retry",
                press: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Function to handle the SVG
Widget handleUnderMaintenanceIllustration() {
  return SvgPicture.string(
    AppSvg.underMaintenanceIllistration,
    width: 200, // Adjust the width as needed
    height: 200, // Adjust the height as needed
  );
}
