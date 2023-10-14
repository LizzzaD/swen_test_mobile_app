// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum SVGIcon {
  account,
  add,
  arrow_left,
  book,
  cart,
  filter,
  food,
  group,
  home,
  leaf,
  main_page_icon,
  plane;

  static const _rootPath = 'assets/icons';

  Widget build({Color? color}) {
    return SvgPicture.asset(
      '$_rootPath/$name.svg',
      colorFilter: color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
    );
  }
}
