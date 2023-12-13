import 'package:flutter/material.dart';
import 'package:my_portfolio/utils/responsive_layout.dart';
import 'package:my_portfolio/utils/strings.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ReactCards extends StatefulWidget {
  const ReactCards({super.key});

  @override
  ReactCardsState createState() => ReactCardsState();
}

class ReactCardsState extends State<ReactCards> {
  final ScrollController scrollController = ScrollController();

  Map<String, bool?> cardHoverMap = {};

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout.isSmallScreen(context)
        ? SizedBox(
            height: 190,
            child: RawScrollbar(
              controller: scrollController,
              thumbVisibility: true,
              radius: const Radius.circular(50),
              thickness: 5,
              thumbColor: Theme.of(context).colorScheme.tertiary,
              trackVisibility: true,
              trackRadius: const Radius.circular(50),
              trackColor: Theme.of(context).colorScheme.secondary,
              child: SingleChildScrollView(
                controller: scrollController,
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    buildReactCard(
                        context,
                        'PWA',
                        rPWA,
                        'assets/images/projects/react/react_pwa.png',
                        'https://github.com/ndenicolais/pwa-app'),
                    buildReactCard(
                        context,
                        'QR Code Generator',
                        rQR,
                        'assets/images/projects/react/react_qr_code_generator.png',
                        'https://github.com/ndenicolais/qr-code-generator'),
                    buildReactCard(
                        context,
                        'Password Generator',
                        rPassword,
                        'assets/images/projects/react/react_password_generator.png',
                        'https://github.com/ndenicolais/react-password-generator'),
                    buildReactCard(
                        context,
                        'React Digital Clock',
                        rClock,
                        'assets/images/projects/react/react_digital_clock.png',
                        'https://github.com/ndenicolais/react-digital-clock'),
                  ],
                ),
              ),
            ),
          )
        : SizedBox(
            height: 280,
            child: RawScrollbar(
              controller: scrollController,
              thumbVisibility: true,
              radius: const Radius.circular(50),
              thickness: 5,
              thumbColor: Theme.of(context).colorScheme.tertiary,
              trackVisibility: true,
              trackRadius: const Radius.circular(50),
              trackColor: Theme.of(context).colorScheme.secondary,
              child: SingleChildScrollView(
                controller: scrollController,
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    buildReactCard(
                        context,
                        'PWA',
                        rPWA,
                        'assets/images/projects/react/react_pwa.png',
                        'https://github.com/ndenicolais/pwa-app'),
                    buildReactCard(
                        context,
                        'QR Code Generator',
                        rQR,
                        'assets/images/projects/react/react_qr_code_generator.png',
                        'https://github.com/ndenicolais/qr-code-generator'),
                    buildReactCard(
                        context,
                        'Password Generator',
                        rPassword,
                        'assets/images/projects/react/react_password_generator.png',
                        'https://github.com/ndenicolais/react-password-generator'),
                    buildReactCard(
                        context,
                        'React Digital Clock',
                        rClock,
                        'assets/images/projects/react/react_digital_clock.png',
                        'https://github.com/ndenicolais/react-digital-clock'),
                  ],
                ),
              ),
            ),
          );
  }

  Widget buildReactCard(BuildContext context, String title, String content,
      String imagePath, String link) {
    return ResponsiveLayout.isSmallScreen(context)
        ? Padding(
            padding: const EdgeInsets.all(2),
            child: InkWell(
              onTap: () {
                launchUrlString(link);
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
                color: cardHoverMap[imagePath] ?? false
                    ? Theme.of(context).colorScheme.tertiary
                    : Theme.of(context).colorScheme.secondary,
                elevation: 5.0,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  width: 120,
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 100),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.asset(imagePath),
                    ),
                  ),
                ),
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.all(8),
            child: MouseRegion(
              onEnter: (_) => setState(() => cardHoverMap[imagePath] = true),
              onExit: (_) => setState(() => cardHoverMap[imagePath] = false),
              child: InkWell(
                onTap: () {
                  launchUrlString(link);
                },
                child: Card(
                  color: cardHoverMap[imagePath] ?? false
                      ? Theme.of(context).colorScheme.tertiary
                      : Theme.of(context).colorScheme.secondary,
                  elevation: 5.0,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    width: 200,
                    height: 260,
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 250),
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                        return FadeTransition(
                          opacity: animation,
                          child: child,
                        );
                      },
                      child: cardHoverMap[imagePath] ?? false
                          ? Padding(
                              padding: const EdgeInsets.all(12),
                              child: Text(
                                content,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context).colorScheme.primary,
                                  fontFamily: 'CustomFont',
                                ),
                              ),
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image.asset(imagePath),
                            ),
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
