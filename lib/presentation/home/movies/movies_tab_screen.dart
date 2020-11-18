import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:movingPictures/injection.dart';

import '../../../application/home/movies/movies_bloc.dart';
import '../../../domain/home/movies/movie.dart';
import '../../core/app_colors.dart';
import '../../core/constants/language_constants.dart';
import '../widgets/banner_block_widget.dart';
import '../widgets/build_show_info_modal_bottom_sheet_widget.dart';
import '../widgets/regular_block_widget.dart';
import '../widgets/top_10_block_widget.dart';

class MoviesTabScreen extends HookWidget {
  const MoviesTabScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTextTheme = Theme.of(context).textTheme;

    Future showInfoBottomSheet() => buildShowInfoModalBottomSheet(
          context: context,
          appTextTheme: appTextTheme,
        );

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BannerBlockWidget(),
          const SizedBox(height: 20.0),
          RegularBlockWidget(
            blockName: trendingNow,
            showInfoBottomSheet: showInfoBottomSheet,
          ),
          const SizedBox(height: 20.0),
          // RegularBlockWidget(
          //   blockName: action,
          //   showInfoBottomSheet: showInfoBottomSheet,
          // ),
          // const SizedBox(height: 20.0),
          // TopTenBlockWidget(
          //   moviesOrSeries: movies,
          //   showInfoBottomSheet: showInfoBottomSheet,
          // ),
          // const SizedBox(height: 20.0),
          // RegularBlockWidget(
          //   blockName: horror,
          //   showInfoBottomSheet: showInfoBottomSheet,
          // ),
          // const SizedBox(height: 20.0),
          // RegularBlockWidget(
          //   blockName: comedy,
          //   showInfoBottomSheet: showInfoBottomSheet,
          // ),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
