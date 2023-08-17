import 'package:ahs_website/constants/const.dart';
import 'package:ahs_website/responsive.dart';
import 'package:ahs_website/screens/main/components/drop_drown.dart';
import 'package:ahs_website/screens/main/components/form.dart';
import 'package:ahs_website/screens/main/components/home_page_image.dart';
import 'package:ahs_website/screens/main/components/select_language.dart';
import 'package:ahs_website/utils/utils.dart';
import 'package:ahs_website/widget/widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final PageController _controller = PageController(initialPage: 0);
  final GlobalKey _backgroundImageKey = GlobalKey();
  int selectedDot = 0;
  PointerScrollEvent? previousPointerSignal;
  DateTime previousMouseScroll = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) {
        return OrientationBuilder(
          builder: ((context, orientation) {
            AppSizeConfig.init(orientation, context);
            return _displayContent(context);
          }),
        );
      }),
    );
  }

  Widget _displayContent(context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(
                dragDevices: {
                  PointerDeviceKind.touch,
                  PointerDeviceKind.mouse,
                },
              ),
              child: Listener(
                onPointerSignal: (pointerSignal) {
                  DateTime currentScrollTime = DateTime.now();
                  if (currentScrollTime
                          .difference(previousMouseScroll)
                          .inMilliseconds >
                      500) {
                    if (pointerSignal is PointerScrollEvent) {
                      if (_controller.page?.toInt() != 2 &&
                          pointerSignal.scrollDelta.dy > 0) {
                        _controller.animateToPage(
                            (_controller.page?.toInt() ?? 0) + 1,
                            duration: const Duration(microseconds: 0),
                            curve: Curves.easeIn);
                      } else if (_controller.page?.toInt() != 0 &&
                          pointerSignal.scrollDelta.dy < 0 &&
                          pointerSignal.scrollDelta.dy.abs() > 1) {
                        _controller.animateToPage(
                            ((_controller.page?.toInt() ?? 1) - 1),
                            duration: const Duration(microseconds: 0),
                            curve: Curves.easeIn);
                      }
                    }
                  }

                  previousMouseScroll = currentScrollTime;
                },
                child: PageView(
                  onPageChanged: ((value) {
                    _controller.jumpToPage(value);
                  }),
                  scrollDirection: Axis.vertical,
                  controller: _controller,
                  physics: const PageScrollPhysics(),
                  children: [
                    _displayFirstPanel(context),
                    _displaySecondPanel(context),
                    _displayThirdPanel(context),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: AppSizeConfig.responsiveMobile ?? false,
              child: Positioned(
                left: 10.0,
                top: 20.0,
                child: PopupMenuButton(
                  color: Colors.white,
                  icon: const Icon(
                    Icons.menu,
                    size: 40.0,
                    color: greenColor,
                  ),
                  onSelected: (result) {
                    if (result! == "language") {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            const SelectLanguageDailog(),
                      );
                    }
                  },
                  itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                    const PopupMenuItem(
                        value: 'language', child: Text('Change Language'))
                  ],
                ),
              ),
            ),
            Positioned(
              right: 20.0,
              top: AppSizeConfig.safeBlockVertical! * 10,
              child: Opacity(
                opacity: 0.7,
                child: DotsIndicatorWidget(
                  controller: _controller,
                  selectedDot: selectedDot,
                  itemCount: 3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _displayFirstPanel(context) {
    return SizedBox(
      width: AppSizeConfig.safeBlockHorizontal! * 100,
      height: AppSizeConfig.safeBlockVertical! *
          (Responsive.isDesktop(context) ? 60 : 100),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          if (!Responsive.isMobile(context)) ...[
            ..._largeFirstPanel(context)
          ] else ...[
            ..._mobileFirstPanel(context)
          ],
        ],
      ),
    );
  }

  Widget _displayThirdPanel(context) {
    return Responsive.isMobile(context)
        ? Container(
            color: Colors.white,
            width: AppSizeConfig.safeBlockHorizontal! * 100,
            height: AppSizeConfig.safeBlockVertical! * 100,
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: _displayCompanyDetail(context),
                ),
                const Expanded(
                  flex: 3,
                  child: MyCustomForm(),
                )
              ],
            ),
          )
        : Container(
            color: Colors.white,
            width: AppSizeConfig.safeBlockHorizontal! * 100,
            height: AppSizeConfig.safeBlockVertical! * 60,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: _displayCompanyDetail(context),
                ),
                const Expanded(
                  child: MyCustomForm(),
                ),
              ],
            ),
          );
  }

  Widget _displayCompanyDetail(context) {
    return Center(
      child: Container(
        color: Colors.white,
        margin:
            EdgeInsets.symmetric(horizontal: getCompanyDetailMargin(context)),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Image.asset(AppConstants.stackedLogo,
                    fit: BoxFit.fitWidth, height: 200),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text(AppLocalizations.of(context)?.company_about ?? "",
                    style: Responsive.isDesktop(context)
                        ? Theme.of(context).textTheme.headline4
                        : Responsive.isTablet(context)
                            ? Theme.of(context).textTheme.headline5
                            : Theme.of(context).textTheme.headline6,
                    textAlign: TextAlign.center),
              ),
            ),
            Flexible(
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0),
                child: Text(
                    "Hummingbird Real Estate, 4th Floor Sunclare Building, Claremont, Cape Town, 7708",
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontSize: Responsive.isMobile(context) ? 17 : 20),
                    textAlign: TextAlign.center),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _displaySecondPanel(context) {
    return Container(
      color: Colors.white,
      width: AppSizeConfig.safeBlockHorizontal! * 100,
      height: AppSizeConfig.safeBlockVertical! *
          (Responsive.isDesktop(context) ? 60 : 100),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: getMargin(context)),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                AppLocalizations.of(context)?.about_us_title.toUpperCase() ??
                    "",
                style: Theme.of(context).textTheme.headline5!,
                textAlign: TextAlign.center,
              ),
            ),
            Flexible(
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 20, left: 20.0, right: 20.0),
                child: Text(
                  AppLocalizations.of(context)?.about_us_desc ?? "",
                  style: Responsive.isDesktop(context)
                      ? Theme.of(context).textTheme.headline4
                      : Responsive.isTablet(context)
                          ? Theme.of(context).textTheme.headline5
                          : Theme.of(context).textTheme.headline6,
                  textAlign: TextAlign.center,
                  softWrap: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _mobileFirstPanel(context) {
    return [
      Expanded(
        flex: 2,
        child: Container(
          child: _displayAppbar(context),
        ),
      ),
      Expanded(
        flex: 9,
        child: SizedBox(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: <Widget>[
              Image.asset(
                AppConstants.mobileHome,
                width: double.maxFinite,
                height: double.maxFinite,
                fit: BoxFit.fitWidth,
              ),
              _showStackedText(context),
            ],
          ),
        ),
      ),
      _contactUsButton(context)
    ];
  }

  Widget _displayAppbar(context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: AppSizeConfig.safeBlockHorizontal! * 66,
          child: Image.asset(
            AppConstants.logoBanner,
          ),
        ),
      ],
    );
  }

  List<Widget> _largeFirstPanel(context) {
    return [
      SizedBox(
        width: AppSizeConfig.safeBlockHorizontal! * 100,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(AppConstants.logoBanner,
                  fit: BoxFit.fill, width: 300),
              const Spacer(),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: DropDownWidget(),
              ),
              _contactUsButton(context),
            ],
          ),
        ),
      ),
      _displayHomeImage(context),
    ];
  }

  Widget _contactUsButton(context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ElevatedButton(
          onPressed: _contactUsPressed,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              AppLocalizations.of(context)?.contact_us ?? "",
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(fontWeight: FontWeight.normal),
            ),
          ),
        ),
      ),
    );
  }

  Widget _showStackedText(context) {
    return Align(
      alignment: const Alignment(0, -0.65),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
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
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    AppLocalizations.of(context)?.find_your_happy_space ?? "",
                    style: Theme.of(context).textTheme.headline1!.copyWith(
                        color: greenColor,
                        fontSize: Responsive.isMobile(context) ? 25 : 35),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _displayHomeImage(context) {
    return Expanded(
      child: HomePageImage(
        imageUrl: AppConstants.desktopTabHome,
        key: _backgroundImageKey,
      ),
    );
  }

  void _contactUsPressed() {
    if (_controller.hasClients) {
      _controller.jumpToPage(2);
    }
  }
}


  // if (pointerSignal is PointerScrollEvent) {
                  //   bool mobileResponsive = Responsive.isMobile(context);
                  //   bool tabletResponsive = Responsive.isTablet(context);

                  //   /// Scroll down
                  //   if (_controller.page?.toInt() != 2 &&
                  //       pointerSignal.scrollDelta.dy > 0) {
                  //     if (_controller.hasClients) {
                  //       if (_controller.offset >=
                  //               AppSizeConfig.safeBlockVertical! * 0 &&
                  //           _controller.offset <
                  //               AppSizeConfig.safeBlockVertical! *
                  //                   (mobileResponsive ? 117 : 61)) {
                  //         _controller.jumpToPage(1);
                  //       } else if (_controller.offset >
                  //               AppSizeConfig.safeBlockVertical! *
                  //                   (mobileResponsive ? 117 : 63) &&
                  //           _controller.offset <=
                  //               AppSizeConfig.safeBlockVertical! *
                  //                   (mobileResponsive ? 300 : 180)) {
                  //         _controller.jumpToPage(2);
                  //       }
                  //     }
                  //   }

                  //   /// Scroll up
                  //   if (_controller.page?.toInt() != 0 &&
                  //       pointerSignal.scrollDelta.dy < 0) {
                  //     if (_controller.offset >= 0 &&
                  //         _controller.offset <=
                  //             AppSizeConfig.safeBlockVertical! *
                  //                 (mobileResponsive ? 90 : 58)) {
                  //       _controller.jumpToPage(0);
                  //     } else if (_controller.offset >
                  //             AppSizeConfig.safeBlockVertical! *
                  //                 (mobileResponsive ? 110 : 58) &&
                  //         _controller.offset <
                  //             AppSizeConfig.safeBlockVertical! *
                  //                 (mobileResponsive ? 300 : 180)) {
                  //       _controller.jumpToPage(1);
                  //     }
                  //   }
                  // }