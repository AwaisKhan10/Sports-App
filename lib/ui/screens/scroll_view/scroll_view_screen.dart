// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sports_app/core/constant/colors.dart';
import 'package:sports_app/core/constant/text_style.dart';
import 'package:sports_app/core/model/scroll_view.dart';
import 'package:sports_app/ui/screens/scroll_view/scroll_view_view_model.dart';
import 'package:sports_app/widget/drop_down_expendable_button.dart';
import 'package:sports_app/widget/scroll_view_screen_widget.dart';
import 'package:sports_app/widget/scroll_view_show_upcoming.dart';
import 'package:timeago/timeago.dart' as timeago;

class ScrollViewScreen extends StatefulWidget {
  const ScrollViewScreen({super.key});

  @override
  State<ScrollViewScreen> createState() => _ScrollViewScreenState();
}

class _ScrollViewScreenState extends State<ScrollViewScreen> {
  @override
  void initState() {
    super.initState();
    // Load posts when screen initializes
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ScrollViewViewModel()..loadPosts(),
      child: Scaffold(
        backgroundColor: scaffoldColor,

        body: Consumer<ScrollViewViewModel>(
          builder: (context, model, child) {
            if (model.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (model.error != null) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      model.error ?? '',
                      style: TextStyle(color: Colors.red),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: model.loadPosts,
                      child: Text('Retry'),
                    ),
                  ],
                ),
              );
            }

            if (model.posts.isEmpty) {
              return const Center(child: Text('No posts available'));
            }

            return RefreshIndicator(
              onRefresh: model.loadPosts,
              child: ListView.builder(
                padding: EdgeInsets.all(16.r),
                itemCount: model.posts.length,
                itemBuilder: (context, index) {
                  final post = model.posts[index];
                  final tweetModel = TweetModel(
                    username: post.teamName,
                    handle: post.teamName,
                    timeAgo: timeago.format(post.createdAt),
                    content: post.postText,
                    imageUrl: post.postImg,
                  );

                  return CustomTweetCardWidget(tweetObject: tweetModel);
                  // return Card(
                  //   margin: EdgeInsets.only(bottom: 16.r),
                  //   child: Padding(
                  //     padding: EdgeInsets.all(16.r),
                  //     child: Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         Row(
                  //           children: [
                  //             CircleAvatar(
                  //               backgroundImage: NetworkImage(
                  //                 post.postImg ?? '',
                  //               ),
                  //               onBackgroundImageError:
                  //                   (e, s) => Icon(Icons.person),
                  //             ),
                  //             SizedBox(width: 12.w),
                  //             Expanded(
                  //               child: Column(
                  //                 crossAxisAlignment: CrossAxisAlignment.start,
                  //                 children: [
                  //                   Text(post.teamName, style: style16B),
                  //                   Text(
                  //                     DateFormat(
                  //                       'MMM d, y',
                  //                     ).format(post.createdAt),
                  //                     style: style14.copyWith(
                  //                       color: Colors.grey,
                  //                     ),
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //         SizedBox(height: 12.h),
                  //         Text(post.postText),
                  //         if (post.postImg != null) ...[
                  //           SizedBox(height: 12.h),
                  //           ClipRRect(
                  //             borderRadius: BorderRadius.circular(8.r),
                  //             child: Image.network(
                  //               post.postImg!,
                  //               width: double.infinity,
                  //               fit: BoxFit.cover,
                  //               errorBuilder:
                  //                   (context, error, stackTrace) => Container(
                  //                     height: 200.h,
                  //                     color: Colors.grey[300],
                  //                     child: Icon(Icons.error),
                  //                   ),
                  //             ),
                  //           ),
                  //         ],
                  //         SizedBox(height: 12.h),
                  //         Row(
                  //           children: [
                  //             Icon(Icons.favorite_border, size: 20.r),
                  //             SizedBox(width: 4.w),
                  //             Text('${post.totalLikes}'),
                  //             SizedBox(width: 16.w),
                  //             Icon(Icons.comment_outlined, size: 20.r),
                  //             SizedBox(width: 4.w),
                  //             Text('${post.comments.length}'),
                  //           ],
                  //         ),
                  //         if (post.comments.isNotEmpty) ...[
                  //           SizedBox(height: 12.h),
                  //           Text('Comments', style: style16B),
                  //           SizedBox(height: 8.h),
                  //           ListView.builder(
                  //             shrinkWrap: true,
                  //             physics: NeverScrollableScrollPhysics(),
                  //             itemCount: post.comments.length,
                  //             itemBuilder: (context, index) {
                  //               final comment = post.comments[index];
                  //               return Padding(
                  //                 padding: EdgeInsets.only(bottom: 8.r),
                  //                 child: Row(
                  //                   crossAxisAlignment:
                  //                       CrossAxisAlignment.start,
                  //                   children: [
                  //                     CircleAvatar(
                  //                       radius: 16.r,
                  //                       child: Text(
                  //                         comment.userId[0].toUpperCase(),
                  //                       ),
                  //                     ),
                  //                     SizedBox(width: 8.w),
                  //                     Expanded(
                  //                       child: Column(
                  //                         crossAxisAlignment:
                  //                             CrossAxisAlignment.start,
                  //                         children: [
                  //                           Text(
                  //                             comment.userId,
                  //                             style: style14B,
                  //                           ),
                  //                           Text(comment.commentText),
                  //                         ],
                  //                       ),
                  //                     ),
                  //                   ],
                  //                 ),
                  //               );
                  //             },
                  //           ),
                  //         ],
                  //         SizedBox(height: 12.h),
                  //         _CommentInput(
                  //           postId: post.id.toString(),
                  //           onSubmit:
                  //               (text) => model.postComment(
                  //                 postId: post.id.toString(),
                  //                 commentText: text,
                  //               ),
                  //           isPosting: model.isPostingCommentFor(
                  //             post.id.toString(),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class _CommentInput extends StatefulWidget {
  final String postId;
  final Function(String) onSubmit;
  final bool isPosting;

  const _CommentInput({
    required this.postId,
    required this.onSubmit,
    required this.isPosting,
  });

  @override
  State<_CommentInput> createState() => _CommentInputState();
}

class _CommentInputState extends State<_CommentInput> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _controller,
            decoration: InputDecoration(
              hintText: 'Add a comment...',
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 12.w,
                vertical: 8.h,
              ),
            ),
            enabled: !widget.isPosting,
          ),
        ),
        SizedBox(width: 8.w),
        IconButton(
          onPressed:
              widget.isPosting
                  ? null
                  : () {
                    final text = _controller.text.trim();
                    if (text.isNotEmpty) {
                      widget.onSubmit(text);
                      _controller.clear();
                    }
                  },
          icon:
              widget.isPosting
                  ? SizedBox(
                    width: 20.r,
                    height: 20.r,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                  : Icon(Icons.send),
        ),
      ],
    );
  }
}
