import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:app/routes/app_routes.dart';
import 'package:app/theme/app_theme.dart';
import 'package:app/theme/icons/app_icons.dart';
import 'package:app/util/firebase_analytics.dart';

class SearchCartAppBar extends StatelessWidget {
  final Widget body;
  final String fromPage;

  SearchCartAppBar({Key key, this.body, this.fromPage = ''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          floating: true,
          backgroundColor: Colors.white,
          pinned: false,
          elevation: 0,
          titleSpacing: 0,
          title: Padding(
            padding: const EdgeInsets.only(top: 0.0, left: 15, right: 5),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      FirebaseAnalyticsService.logClick(fromPage, 'barra_de_busca');
                    },
                    child: Container(
                      height: 35,
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              AppIcons.search_nv,
                              size: 17,
                              color: textLow,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 2),
                              child: Text(
                                "Buscar na App",
                                style: captionRegular.copyWith(color: textLow),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [body ?? Container()],
          ),
        ),
      ],
    );
  }
}
