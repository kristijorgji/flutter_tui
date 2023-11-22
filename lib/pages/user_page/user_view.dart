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

  UserView({
    Key? key,
  }) : super(key: key);

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {

  @override
  Widget build(BuildContext context) {
    final _scrollController = ScrollController();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(0,
          duration: const Duration(milliseconds: 250), curve: Curves.ease);
    });

    return ListView(
      shrinkWrap: true,
      controller: _scrollController,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Stack(
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 32),
                  child: ResizableImagesSlider(
                    key: UniqueKey(),
                    // force to re-render and reset indicator
                    imgList: _sortPhotosAndGetUrls(),
                    pageController: PageController(initialPage: 0),
                    maxScale: 1.35,
                    initialHeight: MediaQuery.of(context).size.width * 1.2,
                    fillBoxWithoutAspectRatio:
                        true, // it is fine because we have square images height=width
                  ),
                ),

              ],
            ),
            Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.width*1.05,),
                Stack(
                  alignment: Alignment.topCenter,
                  children: [

                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: GestureDetector(
                        onVerticalDragUpdate: (details){
                          _scrollController.jumpTo(_scrollController.offset - details.primaryDelta!);
                        },
                        child: Container(
                            padding: const EdgeInsets.only(
                                left: Dimen.spacingMedium,
                                right: Dimen.spacingMedium,
                                top: Dimen.spacingMedium,
                                bottom: Dimen.spacingExtraLarge),
                            decoration: ShapeDecoration(
                              shadows: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(.5), // Shadow color
                                  spreadRadius: 1, // Spread radius
                                  blurRadius: 5, // Blur radius
                                ),
                              ],
                              color: AppColors.White,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.vertical(top: Radius.elliptical(30, 30)),
                                  side: BorderSide(color: AppColors.LightGrey)),
                            ),
                            child: Column(children: [
                              Table(
                                  children: List<TableRow>.generate(
                                    faker.randomGenerator.integer(30, min: 20),
                                        (index) =>
                                        TableRow(children: [Text('$index ${faker.animal.name()}')]),
                                  ))
                            ])),
                      ),
                    ),
                    Positioned(
                      top: -20,
                      child: UserOptions(),
                    ),

                  ],
                ),
              ],
            )

          ],
        ),
      ],
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
