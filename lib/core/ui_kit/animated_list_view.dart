import 'package:flutter/material.dart';

class AnimatedListView extends StatefulWidget {
  const AnimatedListView({
    required this.items,
    this.physics,
    this.shrinkWrap = false,
    super.key,
  });

  final List<Widget> items;
  final bool shrinkWrap;
  final ScrollPhysics? physics;

  @override
  State<AnimatedListView> createState() => _AnimatedListViewState();
}

class _AnimatedListViewState extends State<AnimatedListView> with TickerProviderStateMixin {
  late List<AnimationController> _controllers;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(
      widget.items.length,
      (index) => AnimationController(
        duration: const Duration(milliseconds: 400),
        vsync: this,
      ),
    );
    _startAnimations();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: widget.physics,
      shrinkWrap: widget.shrinkWrap,
      itemBuilder: (context, i) {
        return AnimatedBuilder(
          animation: _controllers[i],
          builder: (context, child) {
            final value = _controllers[i].value;

            return Transform.translate(
              offset: Offset(0, (1 - value) * 300),
              child: Padding(
                padding: EdgeInsets.only(bottom: (1 - value) * 50),
                child: widget.items[i],
              ),
            );
          },
        );
      },
      itemCount: widget.items.length,
    );
  }

  Future<void> _startAnimations() async {
    for (int i = 0; i < _controllers.length; i++) {
      await Future.delayed(const Duration(milliseconds: 100));
      if (mounted) {
        _controllers[i].forward();
      }
    }
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }
}
