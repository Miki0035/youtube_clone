import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_clone/core/screens/error_page.dart';
import 'package:youtube_clone/core/screens/loader.dart';
import 'package:youtube_clone/features/auth/provider/user_provider.dart';
import 'package:youtube_clone/features/channel/my_channel/widgets/buttons.dart';
import 'package:youtube_clone/features/channel/my_channel/widgets/tab_bar.dart';
import 'package:youtube_clone/features/channel/my_channel/widgets/tab_bar_views.dart';
import 'package:youtube_clone/features/channel/my_channel/widgets/top_header.dart';

class MyChannelPage extends ConsumerWidget {
  const MyChannelPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref
        .watch(currentUserProvider)
        .when(
          data: (currentUser) {
            return DefaultTabController(
              length: 7,
              child: Scaffold(
                body: SafeArea(
                  child: Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: Column(
                      children: [
                        // TOP HEADER
                        TopHeader(user: currentUser),

                        Text("More about this channel."),

                        YButtons(),

                        // TAB BAR
                        YTabBar(),

                        YTabViews(),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          error: (error, stackTrace) => ErrorPage(),
          loading: () => Loader(),
        );
  }
}
