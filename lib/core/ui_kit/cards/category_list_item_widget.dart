import 'package:flutter/material.dart';

import '../../extension/build_context_extension.dart';

class CategoryListItemWidget extends StatelessWidget {
  const CategoryListItemWidget({
    required this.totalNumber,
    required this.itemNumber,
    required this.title,
    super.key,
  });

  final int totalNumber;
  final int itemNumber;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: context.colors.black13),
            ),
          ),
          width: double.infinity,
          height: 66,
          child: FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: itemNumber / totalNumber,
            heightFactor: 1,
            child: Container(
              color: context.colors.white50,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Row(
            children: [
              Text(
                itemNumber.toString(),
                style: context.styles.regular36.copyWith(color: context.colors.black),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(
                  'KG',
                  style: context.styles.medium12.copyWith(color: context.colors.black50),
                ),
              ),
              const Spacer(),
              Column(
                children: [
                  Text(
                    'Car',
                    style: context.styles.medium12.copyWith(color: context.colors.black50),
                  ),
                  Text(
                    '${(itemNumber / totalNumber * 100).toInt()} %',
                    style: context.styles.medium12.copyWith(color: context.colors.black50),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
