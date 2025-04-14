// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:sports_app/core/constant/colors.dart';
import 'package:sports_app/core/enums/view_state.dart';
import 'package:sports_app/ui/screens/new_feeds/new_feeds_view_model.dart';
import 'package:sports_app/widget/drop_down_expendable_button.dart';
import 'package:sports_app/widget/scroll_view_screen_widget.dart';
import 'package:sports_app/widget/shimmer/tweet_card_shimmer.dart';

class NewFeedScreen extends StatefulWidget {
  const NewFeedScreen({super.key});

  @override
  State<NewFeedScreen> createState() => _NewFeedScreenState();
}

class _NewFeedScreenState extends State<NewFeedScreen> {
  @override
  void initState() {
    super.initState();
    // Load posts when screen initializes
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NewFeedsViewModel()..loadPosts(),
      child: Consumer<NewFeedsViewModel>(
        builder:
            (context, model, child) => Scaffold(
              backgroundColor: scaffoldColor,

              body: ModalProgressHUD(
                inAsyncCall: model.state == ViewState.busy,
                progressIndicator: TweetCardShimmerWidget(),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Center(
                        child: CustomDropDownExpendableButton(
                          text:
                              'Welcome to the Avaya App. For great in-app features such as posting to the Fan Engagement Wall and social sharing, please create a profile here. Digital Ticketing is a separate feature with your Earthquakes Ticketmaster Account login details.',
                        ),
                      ),
                      RefreshIndicator(
                        onRefresh: model.loadPosts,
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: model.posts.length,
                          itemBuilder: (context, index) {
                            final post = model.posts[index];
                            return CustomTweetCardWidget(
                              post: post,
                              viewModel: model,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
      ),
    );
  }
}
