import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../domain/home/series/serie/serie.dart';
import '../../../../infrastructure/core/credentials.dart';
import '../../../core/app_colors.dart';
import '../../../core/component_widgets/cancel_button_widget.dart';
import 'widgets/items_widget.dart';
import 'widgets/more_like_this_block_widget.dart';

class SerieInfo extends StatelessWidget {
  final Serie serie;

  const SerieInfo({
    Key key,
    @required this.serie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTextTheme = Theme.of(context).textTheme;
    final heightSize = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: heightSize * 0.04),
            //* Top Container: Holds serie/Series information
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image:
                          NetworkImage("$MOVIE_POSTER_PATH${serie.posterPath}"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 30.0, sigmaY: 30.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            AppColors.black.withOpacity(0.9)
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: Items(
                        appTextTheme: appTextTheme,
                        serie: serie,
                      ),
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: CancelButton(),
                ),
              ],
            ),

            //* Bottom Container: Holds [MORE LIKE THIS]
            MoreLikeThisBlock(
              serie: serie,
            ),
          ],
        ),
      ),
    );
  }
}
