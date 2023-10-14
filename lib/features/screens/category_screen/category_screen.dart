import 'package:flutter/material.dart';

import '../../../core/extension/build_context_extension.dart';
import '../../../core/images/svg_icons.dart';
import '../../../core/ui_kit/animated_list_view.dart';
import '../../../core/ui_kit/cards/category_list_item_widget.dart';
import '../../../core/ui_kit/cards/time_range_selector_widget.dart';
import '../../../core/ui_kit/dialogs/time_select_dialog.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({
    required this.totalNumber,
    required this.name,
    required this.color,
    super.key,
  });

  final int totalNumber;
  final String name;
  final Color color;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  /// We need this costyl' because Hero
  bool _canShowWidgets = false;

  String _time = 'Week';

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _canShowWidgets = true;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: widget.name,
      child: Scaffold(
        body: SafeArea(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: SVGIcon.arrow_left.build(),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Expanded(
                          flex: 3,
                          child: Text(
                            widget.name,
                            style: context.styles.regular36.copyWith(color: context.colors.black),
                          ),
                        ),
                        Flexible(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              decoration: BoxDecoration(
                                color: context.colors.white50,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              width: 50,
                              height: 50,
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: SVGIcon.plane.build(),
                              ),
                            ),
                          ),
                        ),
                      ],
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
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            widget.totalNumber.toString(),
                            style: context.styles.regular72.copyWith(color: context.colors.black),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 53, bottom: 19),
                          child: Text(
                            'tCO₂e',
                            style: context.styles.medium18.copyWith(
                              color: context.colors.black50,
                            ),
                          ),
                        ),
                        const Spacer(),
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
                    const SizedBox(
                      height: 6,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Container(
                color: context.colors.black13,
                width: double.infinity,
                height: 1,
              ),
              _canShowWidgets
                  ? AnimatedListView(
                      items: [
                        CategoryListItemWidget(
                          totalNumber: widget.totalNumber,
                          itemNumber: 178,
                          title: 'CAR',
                        ),
                        CategoryListItemWidget(
                          totalNumber: widget.totalNumber,
                          itemNumber: 67,
                          title: 'PUBLIC TRANSPORT',
                        ),
                        for (int i = 0; i < 10; i++)
                          CategoryListItemWidget(
                            totalNumber: widget.totalNumber,
                            itemNumber: 23,
                            title: 'BICYCLE',
                          ),
                      ],
                      physics: const NeverScrollableScrollPhysics(),
                      // I am too lazy to use slivers
                      shrinkWrap: true,
                    )
                  : const SizedBox(),
            ],
          ),
        ),
        backgroundColor: widget.color,
      ),
    );
  }
}
