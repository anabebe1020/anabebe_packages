import 'package:flutter/cupertino.dart';

class PullRefreshScrollView extends StatelessWidget {
  final Widget child;
  final Future<void> Function() onRefresh;
  final ScrollController? scrollController;

  const PullRefreshScrollView({
    Key? key,
    required this.child,
    required this.onRefresh,
    this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      physics: const AlwaysScrollableScrollPhysics()
          .applyTo(const BouncingScrollPhysics()),
      slivers: [
        CupertinoSliverRefreshControl(
          onRefresh: onRefresh,
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (_, __) => child,
            childCount: 1,
          ),
        )
      ],
    );
  }
}
