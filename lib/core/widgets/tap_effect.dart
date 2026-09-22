import 'package:flutter/material.dart';

class TapEffect extends StatefulWidget {
  const TapEffect({
    super.key,
    this.isClickable = true,
    this.enableAnimation = true,
    required this.onClick,
    required this.child,
  });

  final bool isClickable;
  final bool enableAnimation;
  final VoidCallback? onClick;
  final Widget child;

  @override
  // ignore: library_private_types_in_public_api
  _TapEffectState createState() => _TapEffectState();
}

class _TapEffectState extends State<TapEffect>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  DateTime tapTime = DateTime.now();
  bool isProgress = false;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    animationController!.animateTo(
      1.0,
      duration: const Duration(milliseconds: 0),
      curve: Curves.fastOutSlowIn,
    );

    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  Future<void> onTapCancel() async {
    if (widget.isClickable) {
      await _onDelayed();

      if (widget.enableAnimation) {
        animationController!.animateTo(
          1.0,
          duration: const Duration(milliseconds: 240),
          curve: Curves.fastOutSlowIn,
        );
      }
    }

    isProgress = false;
  }

  Future<void> _onDelayed() async {
    if (widget.isClickable && widget.enableAnimation) {
      final int tapDuration = DateTime.now().millisecondsSinceEpoch -
          tapTime.millisecondsSinceEpoch;

      if (tapDuration < 120) {
        await Future<dynamic>.delayed(
          Duration(milliseconds: 120 - tapDuration),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,

      onTap: () async {
        if (widget.isClickable) {
          await Future<dynamic>.delayed(
            const Duration(milliseconds: 200),
          );

          try {
            if (!isProgress) {
              if (widget.onClick != null) {
                widget.onClick!();
              }

              isProgress = true;
            }
          } catch (_) {}
        }
      },

      onTapDown: (TapDownDetails details) {
        if (widget.isClickable) {
          tapTime = DateTime.now();

          if (widget.enableAnimation) {
            animationController!.animateTo(
              0.9,
              duration: const Duration(milliseconds: 120),
              curve: Curves.fastOutSlowIn,
            );
          }
        }

        isProgress = true;
      },

      onTapUp: (TapUpDetails details) {
        onTapCancel();
      },

      onTapCancel: () {
        onTapCancel();
      },

      child: AnimatedBuilder(
        animation: animationController!,
        builder: (BuildContext context, Widget? child) {
          return Transform.scale(
            scale: widget.enableAnimation
                ? animationController!.value
                : 1.0,
            origin: const Offset(0.0, 0.0),
            child: widget.child,
          );
        },
      ),
    );
  }
}