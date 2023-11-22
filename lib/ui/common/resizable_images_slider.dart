import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:single_app/ui/app_colors.dart';
import 'package:single_app/ui/common/tabs_indicator.dart';
import 'package:single_app/ui/dimen/dimen.dart';
import 'package:single_app/ui/widgets/loading_indicator.dart';

class ResizableImagesSlider extends StatefulWidget {
  final List<String> imgList;
  final PageController? pageController;
  final int initialPage;
  final double initialHeight;
  final double maxScale;
  final bool fillBoxWithoutAspectRatio;

  const ResizableImagesSlider({
    Key? key,
    required this.imgList,
    this.pageController,
    this.initialPage = 0,
    this.maxScale = 1.25,
    required this.initialHeight,
    required this.fillBoxWithoutAspectRatio,
  }) : super(key: key);

  @override
  _ResizableImagesSliderState createState() => _ResizableImagesSliderState();
}

class _ResizableImagesSliderState extends State<ResizableImagesSlider> {
  static const _kDuration = Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;

  late PageController _controller;
  int _current = 0;
  double _scale = 1.0;
  double _previousScale = 1.0;
  late double _height;
  Offset _startLastOffset = Offset.zero;

  @override
  void initState() {
    super.initState();

    _height = widget.initialHeight;

    _controller = PageController(initialPage: widget.initialPage);
    _current = widget.initialPage;
    _controller.addListener(() {
      setState(() {
        _current = _controller.page!.round();
      });
    });

    SchedulerBinding.instance.addPostFrameCallback((_) {
      _controller.animateToPage(
        _controller.initialPage,
        duration: _kDuration,
        curve: _kCurve,
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onScaleStart(ScaleStartDetails details) {
    _previousScale = _scale;
    _startLastOffset = details.focalPoint;
  }

  void _onScaleUpdate(ScaleUpdateDetails details) {
    final offsetFromStart = details.focalPoint.dy - _startLastOffset.dy;
    var newScale = (_previousScale + offsetFromStart / 500).clamp(0.8, 3.0);

    // this check will make sure that when we drag the image upwards, it doesn't shrink below the initial size
    if (newScale < 1) {
      newScale = 1.0;
    } else if (newScale > widget.maxScale) {
      newScale = widget.maxScale;
    }

    setState(() {
      _scale = newScale;
      _height = widget.initialHeight * _scale;
    });
  }

  void _onScaleEnd(ScaleEndDetails details) {
    _previousScale = 1.0;
    _scale = 1.0;
    _height = widget.initialHeight;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print("resizable");
    return Container(
      padding: const EdgeInsets.all(Dimen.spacingSmall),
      height: _height,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.elliptical(8, 8)),
        child: Stack(
          alignment: AlignmentDirectional.topStart,
          children: <Widget>[
            PageView.builder(
              controller: _controller,
              itemCount: widget.imgList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onScaleStart: _onScaleStart,
                  onScaleUpdate: _onScaleUpdate,
                  onScaleEnd: _onScaleEnd,
                  child: Transform(
                      alignment: Alignment.centerLeft,
                      transform: Matrix4.identity()..scale(_scale, _scale),
                      child: CachedNetworkImage(
                        imageUrl: widget.imgList[index],
                        placeholder: (context, imageUrl) => SizedBox(
                          child: const LoadingIndicator(),
                          width: MediaQuery.of(context).size.width,
                        ),
                        errorWidget: (context, url, error) => const Icon(
                          Icons.error,
                          color: AppColors.Red,
                        ),
                        width: MediaQuery.of(context).size.width,
                        fit: widget.fillBoxWithoutAspectRatio
                            ? BoxFit.fill
                            : BoxFit.fitWidth,
                      )),
                );
              },
            ),
            if (widget.imgList.length > 1) _buildIndicators(),
          ],
        ),
      ),
    );
  }

  Widget _buildIndicators() {
    return Positioned(
      top: 4,
      left: 0,
      right: 0,
      child: TabsIndicator(
        controller: _controller,
        inactiveColor: AppColors.LightGrey,
        activeColor: AppColors.Primary,
        horizontalPadding: Dimen.spacingSmall * 4,
        itemCount: widget.imgList.length,
        onPageSelected: (int page) {
          _controller.animateToPage(
            page,
            duration: _kDuration,
            curve: _kCurve,
          );
        },
      ),
    );
  }
}
