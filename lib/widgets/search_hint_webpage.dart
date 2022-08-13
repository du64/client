import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../services/app_service.dart';

class SearchHintWebpage extends StatefulWidget {
  const SearchHintWebpage({Key? key, required this.url}) : super(key: key);
  final String url;

  @override
  _FeaturedState createState() => _FeaturedState();
}

  class _FeaturedState extends State<SearchHintWebpage> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 3),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          Container(
            child: ListTile(
              contentPadding: EdgeInsets.all(0),
              isThreeLine: false,
              leading: CircleAvatar(
                backgroundColor: Theme.of(context).primaryColor,
                radius: 20,
                child: Icon(
                  LucideIcons.globe,
                  size: 20,
                  color: Colors.white,
                ),
              ),
              title: Row(
                children: [
                  Text(
                    'link detect title',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w700),
                  ).tr(),
                  Spacer(),
                  Container(
                    margin: EdgeInsets.only(top: 0),
                    padding: EdgeInsets.symmetric(horizontal: 3),
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.background.withOpacity(1),
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                            color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                            width: 0.7
                        )
                    ),
                    child: Row(
                      children: [
                        Text(
                          'MP',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                          ),
                        ).tr(),
                      ],
                    ),
                  ),
                ],
              ),
              subtitle: Container(
                padding: EdgeInsets.only(top: 5),
                child: Text(
                  'link detect description',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).colorScheme.secondary),
                ).tr(),
              ),
            ),
          ),
          Container(height: 10,),
          InkWell(
              child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onPrimary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Container(height: 35, decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onSecondary,
                    borderRadius: BorderRadius.circular(8),
                  ), child: Center(
                    child: Text(
                      'link detect button',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ).tr(),
                  ),
                  )
              ),
            onTap: () {
              AppService().openLinkWithBrowserMiniProgram(
                  context, (widget.url));
              HapticFeedback.heavyImpact();
            }
          ),
        ],
      ),
    );
  }
}