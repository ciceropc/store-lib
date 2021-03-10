import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import 'package:app/theme/app_theme.dart';
import 'package:app/theme/icons/app_icons.dart';

class AutocompleteListCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final Function onTap;
  final Function onTapIcon;
  final bool isHistory;
  final bool isHtml;

  const AutocompleteListCard({
    this.title,
    this.onTap,
    this.isHistory: false,
    this.subTitle: '',
    this.isHtml: false,
    this.onTapIcon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 62,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: disabledColor)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              isHistory ? AppIcons.access_time_nv : AppIcons.search_nv,
              color: textMedium,
            ),
            SizedBox(width: 12),
            Expanded(
              child: isHtml
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HtmlWidget(
                          '$title',
                          textStyle: bodyRegular.copyWith(color: textHigh),
                        ),
                        HtmlWidget(
                          '$subTitle',
                          textStyle: captionBold.copyWith(color: textHigh),
                        ),
                      ],
                    )
                  : Text(
                      title,
                      style: bodyRegular.copyWith(color: textHigh),
                      overflow: TextOverflow.ellipsis,
                    ),
            ),
            GestureDetector(
              onTap: onTapIcon,
              child: Icon(
                AppIcons.arrow_diagonal,
                color: isHistory ? textMedium : accentColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
