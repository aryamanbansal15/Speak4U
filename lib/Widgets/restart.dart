import 'package:flutter/material.dart';

class Restart extends StatefulWidget {
  final Widget child;
  static String? postRestartRoute;

  const Restart({Key? key, required this.child}) : super(key: key);

  static void restartApp(BuildContext context, {String? postRestartRoute}) {
    Restart.postRestartRoute = postRestartRoute;
    context.findAncestorStateOfType<_RestartState>()?.restartApp();
  }

  @override
  State<Restart> createState() => _RestartState();
}

class _RestartState extends State<Restart> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey(); // Force rebuild
    });
  }

  @override
  void didUpdateWidget(covariant Restart oldWidget) {
    super.didUpdateWidget(oldWidget);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (Restart.postRestartRoute != null) {
        Navigator.of(context).pushNamedAndRemoveUntil(
          Restart.postRestartRoute!,
              (route) => false,
        );
        // Reset the static value to avoid repeated redirects
        Restart.postRestartRoute = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.child,
    );
  }
}
