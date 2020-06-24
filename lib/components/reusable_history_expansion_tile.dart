import 'package:flutter/material.dart';

class ReusableHistoryExpansionTile extends StatelessWidget {
  ReusableHistoryExpansionTile(
      {@required this.title,
      @required this.subtitle,
      this.child,
      this.initiallyExpanded});

  final String title;
  final String subtitle;
  final Widget child;
  final bool initiallyExpanded;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Card(
          elevation: 3.0,
          child: ExpansionTile(
            initiallyExpanded: initiallyExpanded ?? false,
            onExpansionChanged: (bool value) {
              print('Yeah');
            },
            title: Text(
              title,
              style: Theme.of(context).textTheme.title.copyWith(
                    fontSize: 15.0,
                  ),
            ),
            subtitle: Text(
              subtitle,
              style: Theme.of(context).textTheme.subtitle.copyWith(),
            ),
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.history,
                  color: Colors.teal,
                ),
              ],
            ),
            children: <Widget>[
              child ?? Container(),
            ],
          ),
        ),
      ],
    );
  }
}
