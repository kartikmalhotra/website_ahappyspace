import 'package:ahs_website/constants/const.dart';
import 'package:ahs_website/responsive.dart';
import 'package:ahs_website/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePageImage extends StatelessWidget {
  HomePageImage({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  final String imageUrl;
  final GlobalKey _backgroundImageKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildParallaxBackground(context),
        _buildGradient(),
        _showStackedText(context)
      ],
    );
  }

  Widget _buildParallaxBackground(BuildContext context) {
    return Flow(
      delegate: ParallaxFlowDelegate(
        scrollable: Scrollable.of(context)!,
        listItemContext: context,
        backgroundImageKey: _backgroundImageKey,
      ),
      children: [
        Image.asset(
          imageUrl,
          key: _backgroundImageKey,
          fit: BoxFit.fitWidth,
        ),
      ],
    );
  }

  Widget _buildGradient() {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.1),
        ),
      ),
    );
  }

  Widget _showStackedText(context) {
    return Align(
      alignment: Alignment(0, Responsive.isDesktop(context) ? -0.6 : -0.48),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFdefff0),
                border: Border.all(color: const Color(0xFFdefff0)),
                borderRadius: const BorderRadius.all(Radius.circular(30.0)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  AppLocalizations.of(context)?.find_your_happy_space ?? "",
                  style: Theme.of(context).textTheme.headline1!.copyWith(
                      color: greenColor,
                      fontSize: Responsive.isMobile(context)
                          ? 40
                          : Responsive.isTablet(context)
                              ? 50
                              : 60),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
