import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:single_app/pages/user_page/user_options.dart';
import 'package:single_app/ui/app_colors.dart';
import 'package:single_app/ui/common/resizable_images_slider.dart';
import 'package:single_app/ui/dimen/dimen.dart';

final imageInfoTextStyle = GoogleFonts.teko(
  fontSize: Dimen.extraLargeText * 1.3,
  fontWeight: FontWeight.w500,
  color: AppColors.White,
  letterSpacing: 1.6,
  shadows: [
    const Shadow(
      blurRadius: 2.0,
      color: Colors.black,
      offset: Offset(1.0, 1.0),
    ),
  ],
);

class UserView extends StatefulWidget {

  const UserView({
    Key? key,
  }) : super(key: key);

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        slivers: [

          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.width * 1.2,
            stretch: true,
            stretchTriggerOffset: 1.0,
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: [StretchMode.zoomBackground],
              background: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                    child: ResizableImagesSlider(
                      key: UniqueKey(),
                      imgList: _sortPhotosAndGetUrls(),
                      pageController: PageController(initialPage: 0),
                      maxScale: 1.35,
                      initialHeight: MediaQuery.of(context).size.width * 1.2,
                      fillBoxWithoutAspectRatio: true,
                    ),
                  ),
                  Positioned(
                    child: Container(
                       height: 30,
                      // height: 30,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(50),
                        ),
                      ),
                    ),
                    bottom: 0,
                    left: 0,
                    right: 0,
                  ),
                  Positioned(child: UserOptions(),
                    bottom: 0,
                    left: 0,
                    right: 0,),

                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Stack(
                  children: [
                    Container(
                        padding: const EdgeInsets.only(
                            left: Dimen.spacingMedium,
                            right: Dimen.spacingMedium,
                            top: Dimen.spacingMedium,
                            bottom: Dimen.spacingExtraLarge),
                        decoration: BoxDecoration(
                          borderRadius:
                                BorderRadius.vertical(top: Radius.elliptical(30, 30)),
                          color: Colors.white,
                        ),
                        child: Column(children: [
                          Table(
                              children: List<TableRow>.generate(
                                faker.randomGenerator.integer(30, min: 20),
                                    (index) =>
                                    TableRow(children: [Text('$index ${faker.animal.name()}')]),
                              ))
                        ])),
                  ],
                )
              ]
            ),
          ),
        ],
      ),
    );
  }

  List<String> _sortPhotosAndGetUrls() {
    final start = 200;

    return List.generate(faker.randomGenerator.integer(12, min: 3), (index) {
      final now = start + index;
      return 'https://picsum.photos/$now';
    });
  }
}
