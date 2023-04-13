import 'package:flutter/material.dart';
import 'dart:math' as math;

///This widget will coordinate the expansion and collapse the other action buttons
///The parameters this widget have are first, if this widget begins with expanded position
///then the maximum distance between action buttons and finally a list of children widgets
///this children are the behaviour it needs to have when expanded and collapsed
///
///What this widget shows when displayed is a blue edit (the icon is open to changes in both cases)
///button when collapses and white close button when expanded
class CustomExpandableFab extends StatefulWidget {
  const CustomExpandableFab(
      {super.key,
      this.initialOpen,
      required this.distance,
      required this.children});

  final bool? initialOpen;
  final double distance;
  final List<Widget> children;

  @override
  State<CustomExpandableFab> createState() => _CustomExpandableFabState();
}

class _CustomExpandableFabState extends State<CustomExpandableFab>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _expandAnimation;

  bool _open = false;

  @override
  void initState() {
    super.initState();
    _open = widget.initialOpen ?? false;
    _animationController = AnimationController(
        value: _open ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 250),
        vsync: this);
    _expandAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.fastOutSlowIn,
      reverseCurve: Curves.easeOutQuad,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  //to toggle if is expanded or not
  void _toggle() {
    setState(() {
      _open = !_open;
      if (_open) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        alignment: Alignment.bottomRight,
        clipBehavior: Clip.none,
        children: [
          TapToCloseFabWidget(
            toggleFunction: _toggle,
          ),
          ..._buildExpandingActionButtons(),
          TapToOpenFabWidget(
            open: _open,
            toggle: _toggle,
          )
        ],
      ),
    );
  }

  List<Widget> _buildExpandingActionButtons() {
    final children = <Widget>[];
    final count = widget.children.length;
    final step = 90.0 / (count - 1);

    for (var i = 0, angleInDregrees = 0.0;
        i < count;
        i++, angleInDregrees += step) {
      children.add(
        _ExpandingActionButtonWidget(
          directionInDegrees: angleInDregrees,
          maxDistance: widget.distance,
          progress: _expandAnimation,
          child: widget.children[i],
        ),
      );
    }
    return children;
  }
}

class TapToCloseFabWidget extends StatelessWidget {
  const TapToCloseFabWidget({super.key, required this.toggleFunction});
  final VoidCallback toggleFunction;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 56.0,
      height: 56.0,
      child: Center(
        child: Material(
          shape: const CircleBorder(),
          clipBehavior: Clip.antiAlias,
          elevation: 4.0,
          child: InkWell(
            onTap: () => toggleFunction(),
            child: Padding(
              padding: const EdgeInsets.all(16.5),
              child: Icon(
                Icons.close_rounded,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TapToOpenFabWidget extends StatelessWidget {
  const TapToOpenFabWidget(
      {super.key, required this.open, required this.toggle});
  final bool open;
  final VoidCallback toggle;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: open,
      child: AnimatedContainer(
        transformAlignment: Alignment.center,
        transform: Matrix4.diagonal3Values(
          open ? 0.7 : 1.0,
          open ? 0.7 : 1.0,
          1.0,
        ),
        duration: const Duration(microseconds: 250),
        curve: const Interval(
          0.0,
          0.5,
          curve: Curves.easeOut,
        ),
        child: AnimatedOpacity(
          opacity: open ? 0.0 : 1.0,
          curve: const Interval(0.25, 1.0),
          duration: const Duration(milliseconds: 250),
          child: FloatingActionButton(
            onPressed: () => toggle(),
            backgroundColor: Theme.of(context).primaryColor,
            elevation: 15.0,
            child: const Icon(
              Icons.more_vert_rounded,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

//Buttons that will be displayed when fab were to be expanded
class CustomActionButtonWidget extends StatelessWidget {
  const CustomActionButtonWidget({
    super.key,
    required this.onPressed,
    required this.icon,
  });

  final VoidCallback onPressed;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      color: const Color.fromARGB(
          255, 200, 129, 247), //Theme.of(context).colorScheme.secondary,
      elevation: 7.0,
      child: IconButton(
        onPressed: onPressed,
        padding: const EdgeInsets.all(20.0),
        icon: icon,
        color: Theme.of(context).colorScheme.onSecondary,
      ),
    );
  }
}

class _ExpandingActionButtonWidget extends StatelessWidget {
  const _ExpandingActionButtonWidget(
      {required this.directionInDegrees,
      required this.maxDistance,
      required this.progress,
      required this.child});

  final double directionInDegrees;
  final double maxDistance;
  final Animation<double> progress;
  final Widget child;

//Positioned Widget will position child at the stablished x,y withing the Stack
//The AnimatedBuilder will rebuild the Positioned everytime the animation changes
//FadeInTransition will be in charge of how the actionButton will appear and disappear
//as the expand and collapse
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: progress,
      builder: (BuildContext context, Widget? child) {
        final offset = Offset.fromDirection(
          directionInDegrees * (math.pi / 180),
          progress.value * maxDistance,
        );
        return Positioned(
          right: 4.0 + offset.dx,
          bottom: 4.0 + offset.dy,
          child: Transform.rotate(
            angle: 1.0 - progress.value * math.pi / 2,
            child: child!,
          ),
        );
      },
      child: FadeTransition(
        opacity: progress,
        child: child,
      ),
    );
  }
}
