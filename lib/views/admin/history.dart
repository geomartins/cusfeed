import 'package:flutter/material.dart';
import '../../components/reusable_history_expansion_tile.dart';
import '../../config/constants.dart';

class History extends StatefulWidget {
  static const String id = '/history';

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'History',
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: kPrimaryColor,
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/cool_bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ReusableHistoryExpansionTile(
                title: 'April 16, 1990',
                subtitle: '20 response',
                initiallyExpanded: true,
                child: Wrap(
                  children: <Widget>[
                    ActionChip(
                      avatar: CircleAvatar(
                        radius: 40.0,
                        backgroundColor: Colors.grey.shade800,
                        child: Text('10%'),
                      ),
                      label: Text('Aaron Burr'),
                      onPressed: () {
                        print(
                            "If you stand for nothing, Burr, what’ll you fall for?");
                      },
                    ),
                    ActionChip(
                      avatar: CircleAvatar(
                        radius: 40.0,
                        backgroundColor: Colors.grey.shade800,
                        child: Text('10%'),
                      ),
                      label: Text('Aaron Burr'),
                      onPressed: () {
                        print(
                            "If you stand for nothing, Burr, what’ll you fall for?");
                      },
                    ),
                    ActionChip(
                      avatar: CircleAvatar(
                        radius: 40.0,
                        backgroundColor: Colors.grey.shade800,
                        child: Text('10%'),
                      ),
                      label: Text('Aaron Burr'),
                      onPressed: () {
                        print(
                            "If you stand for nothing, Burr, what’ll you fall for?");
                      },
                    ),
                    ActionChip(
                      avatar: CircleAvatar(
                        radius: 40.0,
                        backgroundColor: Colors.grey.shade800,
                        child: Text('SD'),
                      ),
                      label: Text('Aaron Burr'),
                      onPressed: () {
                        print(
                            "If you stand for nothing, Burr, what’ll you fall for?");
                      },
                    ),
                    ActionChip(
                      avatar: CircleAvatar(
                        radius: 40.0,
                        backgroundColor: Colors.grey.shade800,
                        child: Text('10%'),
                      ),
                      label: Text('Aaron Burr'),
                      onPressed: () {
                        print(
                            "If you stand for nothing, Burr, what’ll you fall for?");
                      },
                    ),
                  ],
                )),
            ReusableHistoryExpansionTile(
              title: 'April 16, 1990',
              subtitle: '20 response',
            ),
          ],
        ),
      ),
    );
  }
}
