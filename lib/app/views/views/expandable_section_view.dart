//
// Created by nqhung on 06/11/2020.
//

import 'package:flutter/widgets.dart';

class ExpandableSectionView extends StatefulWidget {
  final Widget header;
  final Widget child;
  final bool expand;
  final AnimationStatusListener listener;
  ExpandableSectionView({
    this.expand = false,
    this.header,
    @required this.child,
    this.listener,
  });

  @override
  _ExpandedSectionState createState() => _ExpandedSectionState();
}

class _ExpandedSectionState extends State<ExpandableSectionView>
    with SingleTickerProviderStateMixin {
  AnimationController expandController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    prepareAnimations();
    _runExpandCheck();
  }

  ///Setting up the animation
  void prepareAnimations() {
    expandController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    animation = CurvedAnimation(
      parent: expandController,
      curve: Curves.fastOutSlowIn,
    );

    if (widget.listener != null) {
      animation.addStatusListener(widget.listener);
    }
  }

  void _runExpandCheck() {
    if (widget.expand) {
      expandController.forward();
    } else {
      expandController.reverse();
    }
  }

  @override
  void didUpdateWidget(ExpandableSectionView oldWidget) {
    super.didUpdateWidget(oldWidget);
    _runExpandCheck();
  }

  @override
  void dispose() {
    expandController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.header != null) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.header,
          SizeTransition(
              axisAlignment: 1.0, sizeFactor: animation, child: widget.child)
        ],
      );
    }
    return SizeTransition(
        axisAlignment: 1.0, sizeFactor: animation, child: widget.child);
  }
}
