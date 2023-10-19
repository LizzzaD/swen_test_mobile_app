import 'package:flutter/material.dart';

import '../../../../core/extension/build_context_extension.dart';
import '../../../../core/images/svg_icons.dart';
import '../../../../core/ui_kit/cards/carbon_footprint_category_widget.dart';
import '../../../../core/ui_kit/cards/carbon_footprint_summary_widget.dart';
import '../../../../core/ui_kit/cards/time_range_selector_widget.dart';
import '../../../../core/ui_kit/dialogs/time_select_dialog.dart';
import '../../category_screen/category_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  final _topKey = GlobalKey<State<StatefulWidget>>();

  late final AnimationController _controller;
  late final Animation<double> _offsetAnimation;
  late final Animation<double> _buttonAnimation;
  late final Animation<double> _titleAnimation;

  String _time = 'Week';

  double? _topHeight;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _offsetAnimation = Tween<double>(begin: -200, end: 0).animate(_controller);
    _buttonAnimation = Tween<double>(begin: 200, end: 0).animate(_controller);
    _titleAnimation = Tween<double>(begin: -200, end: 0).animate(_controller);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final renderBox = _topKey.currentContext!.findRenderObject()! as RenderBox?;
      _topHeight = renderBox!.size.height;
      setState(() {});
      _startAnimation();
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double oneThirdHeight;
        if (_topHeight != null) {
          final availableHeight = constraints.maxHeight - _topHeight! - 4 - 16;
          oneThirdHeight = availableHeight / 3 - 4;
        } else {
          oneThirdHeight = -1;
        }

        return ListView(
          children: [
            Column(
              key: _topKey,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AnimatedBuilder(
                      animation: _titleAnimation,
                      builder: (context, child) {
                        return Transform.translate(
                          offset: Offset(_titleAnimation.value, 0),
                          child: Text(
                            'Overview',
                            style: context.styles.regular36.copyWith(
                              color: context.colors.black,
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TimeRangeSelectorWidget(
                      onPressed: () async {
                        final result =
                            await TimeSelectDialog.show(context: context, selected: _time);
                        if (result != null) {
                          _time = result;
                          if (mounted) setState(() {});
                        }
                      },
                      time: _time,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    CarbonFootprintSummaryWidget(
                      buttonAnimation: _buttonAnimation,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: context.colors.black13,
                        borderRadius: BorderRadius.circular(2),
                      ),
                      width: 20,
                      height: 2,
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: context.colors.purple,
                        borderRadius: BorderRadius.circular(2),
                      ),
                      width: 20,
                      height: 2,
                    ),
                  ],
                ),
              ],
            ),
            _topHeight != null
                ? AnimatedBuilder(
                    animation: _offsetAnimation,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(0, _offsetAnimation.value),
                        child: child,
                      );
                    },
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 16,
                        ),
                        SizedBox(
                          height: oneThirdHeight * 2,
                          child: Row(
                            children: [
                              CarbonFootprintCategoryWidget(
                                flex: 1,
                                icon: SVGIcon.plane.build(),
                                color: context.colors.lightPurple,
                                title: 'Travel',
                                number: 234,
                                onPressed: () async {
                                  await Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder: (context, animation, secondaryAnimation) =>
                                          CategoryScreen(
                                        totalNumber: 234,
                                        name: 'Travel',
                                        color: context.colors.lightPurple,
                                      ),
                                      transitionDuration: const Duration(milliseconds: 600),
                                    ),
                                  );
                                  _startAnimation();
                                },
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              CarbonFootprintCategoryWidget(
                                flex: 2,
                                icon: SVGIcon.food.build(),
                                color: context.colors.green,
                                title: 'Food',
                                number: 727,
                                onPressed: () async {
                                  await Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder: (context, animation, secondaryAnimation) =>
                                          CategoryScreen(
                                        totalNumber: 727,
                                        name: 'Food',
                                        color: context.colors.green,
                                      ),
                                      transitionDuration: const Duration(milliseconds: 600),
                                    ),
                                  );
                                  _startAnimation();
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        SizedBox(
                          height: oneThirdHeight,
                          child: Row(
                            children: [
                              CarbonFootprintCategoryWidget(
                                flex: 1,
                                icon: SVGIcon.cart.build(),
                                color: context.colors.red,
                                title: 'Shopping',
                                number: 155,
                                onPressed: () async {
                                  await Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder: (context, animation, secondaryAnimation) =>
                                          CategoryScreen(
                                        totalNumber: 155,
                                        name: 'Shopping',
                                        color: context.colors.red,
                                      ),
                                      transitionDuration: const Duration(milliseconds: 600),
                                    ),
                                  );
                                  _startAnimation();
                                },
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              CarbonFootprintCategoryWidget(
                                flex: 1,
                                icon: SVGIcon.home.build(),
                                color: context.colors.blue,
                                title: 'Home',
                                number: 39,
                                onPressed: () async {
                                  await Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder: (context, animation, secondaryAnimation) =>
                                          CategoryScreen(
                                        totalNumber: 39,
                                        name: 'Home',
                                        color: context.colors.blue,
                                      ),
                                      transitionDuration: const Duration(milliseconds: 600),
                                    ),
                                  );
                                  _startAnimation();
                                },
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              CarbonFootprintCategoryWidget(
                                flex: 1,
                                icon: SVGIcon.home.build(color: context.colors.grey),
                                color: context.colors.lightGrey,
                                title: 'Other',
                                number: 39,
                                onPressed: () async {
                                  await Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder: (context, animation, secondaryAnimation) =>
                                          CategoryScreen(
                                        totalNumber: 39,
                                        name: 'Other',
                                        color: context.colors.lightGrey,
                                      ),
                                      transitionDuration: const Duration(milliseconds: 600),
                                    ),
                                  );
                                  _startAnimation();
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                : const SizedBox(),
            const SizedBox(height: 16),
            _topHeight != null ? const Placeholder() : const SizedBox(),
          ],
        );
      },
    );
  }

  void _startAnimation() {
    _controller.reset();
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
